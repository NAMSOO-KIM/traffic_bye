package traffic.bye.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.vo.ImageDeleteVO;
import traffic.bye.vo.ImageVO;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemUpdateVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.PagingVO;


@Slf4j
@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private S3Service s3Service;


	@Override
	public List<ItemVO> getItemList() throws Exception {
		
		return itemDAO.getItemList();
	}
	
	@Override
	public ItemVO getItem(long id) throws Exception {

		return itemDAO.getItem(id);
	}

	@Override
	public List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws Exception {
		return itemDAO.getRelatedItemList(map);
	}
	
	@Override
	public List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException {
		
		return itemDAO.getMainCategoryItemList(parent_id);
	}


	@Override
	public List<ItemVO> getItemDetail(long id) throws SQLException {

		return itemDAO.getItemDetail(id);
	}
	
	@Override
	public int isRelatedItem(HashMap<String, Object> map) throws Exception {

		return itemDAO.isRelatedItem(map);
	}


	@Override
	public List<ItemVO> getItemFromStore(long store_id) throws Exception {
		return itemDAO.getItemFromStore(store_id);
	}
	
	@Override
	public List<ItemVO> getMediumCategoryItemList(long category_id) throws SQLException {
	
		return itemDAO.getMediumCategoryItemList(category_id);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public Long addItem(Long storeId, String items, MultipartHttpServletRequest mreq) throws Exception {
		// TODO Auto-generated method stub
		ObjectMapper objectMapper = new ObjectMapper();
		ItemAddVO itemAddVO = objectMapper.readValue(items, ItemAddVO.class);
		itemAddVO.setStoreId(storeId);
		Map<String, MultipartFile> files = mreq.getFileMap();
		MultipartFile repreFile = files.get("repreFile");
		files.remove("repreFile");
		Set<String> anotherParams = files.keySet();
		List<ImageVO> images = new ArrayList<ImageVO>();
		ImageVO repreImage = s3Service.processItemImage(repreFile);
		itemAddVO.setRepreFile(repreImage.getRealFileName());
		itemAddVO.setThumbFileURL(repreImage.getThumbFileURL());
		itemAddVO.setRepreFileSize(repreImage.getFileSize());
		itemAddVO.setRepreFileURL(repreImage.getOriginFileURL());
		itemAddVO.setMainThumbFileURL(repreImage.getMainThumbFileURL());
		itemDAO.addItem(itemAddVO);
		Long id = itemAddVO.getId();
		repreImage.setItemId(id);
		for(String anotherFileParam : anotherParams) {
			MultipartFile anotherFile = files.get(anotherFileParam);
			ImageVO imageVO = s3Service.processItemImage(anotherFile);
			imageVO.setItemId(id);
			images.add(imageVO);
		}
		if(images.size() > 0) itemDAO.addItemImages(images);
		return id;


	}
	
	@Override
	public List<ItemVO> getMainCategoryNewItemList(long category_id) throws SQLException {

		return itemDAO.getMainCategoryNewItemList(category_id);
	}

	@Override
	public ItemDetailVO getItemDetailWithImage(Long id) throws Exception {
		// TODO Auto-generated method stub
		ItemDetailVO vo = itemDAO.getItemDetailWithoutImage(id);
		vo.setImages(itemDAO.getImage(id));
		return vo;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void updateItem(Long itemId, String items, MultipartHttpServletRequest mreq) throws Exception {
		// TODO Auto-generated method stub
		ObjectMapper objectMapper = new ObjectMapper();
		ItemUpdateVO itemUpdateVO = objectMapper.readValue(items, ItemUpdateVO.class);
		Map<String, MultipartFile> files = mreq.getFileMap();
		MultipartFile repreFile = files.get("repreFile");
		itemUpdateVO.setId(itemId);
		if(repreFile != null) { // 대표 사진에 변경이 발생한 경우
			files.remove("repreFile"); // 새로 업로드를 해주고 기존에 있던 파일 정보 또한 업데이트 시켜준다.
			ImageVO repreImage = s3Service.processItemImage(repreFile);
			itemUpdateVO.setRepreFile(repreImage.getRealFileName());
			itemUpdateVO.setThumbFileURL(repreImage.getThumbFileURL());
			itemUpdateVO.setRepreFileSize(repreImage.getFileSize());
			itemUpdateVO.setRepreFileURL(repreImage.getOriginFileURL());
		}
		if(itemUpdateVO.getDeletedImgs().size() > 0) {
			ImageDeleteVO imageDeleteVO = new ImageDeleteVO();
			imageDeleteVO.setList(itemUpdateVO.getDeletedImgs());
			imageDeleteVO.setId(itemId);
			itemDAO.deleteItemImages(imageDeleteVO);
		}
		itemDAO.updateItem(itemUpdateVO);
		Set<String> anotherParams = files.keySet();
		List<ImageVO> images = new ArrayList<ImageVO>();
		for(String anotherFileParam : anotherParams) {
			MultipartFile anotherFile = files.get(anotherFileParam);
			ImageVO imageVO = s3Service.processItemImage(anotherFile);
			imageVO.setItemId(itemId);
			images.add(imageVO);
		}
		if(images.size() > 0) itemDAO.addItemImages(images);
	}
	
	
	@Override
	public int countItem(long id) throws Exception {

		return itemDAO.countItem(id);
	}
	
	@Override
	public List<ItemVO> getPagingItemList(HashMap<String, Object> map) throws SQLException {

		return itemDAO.getPagingItemList(map);
	}

	@Override
	public int countStoreItem(long store_id) throws Exception {
		return itemDAO.countStoreItem(store_id);
	}

	@Override
	public List<ItemVO> getPagingStoreItemList(HashMap<String, Object> map) throws Exception {
		return itemDAO.getPagingStoreItemList(map);
	}
	
	@Override
	public List<ItemVO> getMainOutOfStockList(long parent_id) throws SQLException {
		// 첫 번째 메인 카테고리에 재고가 없는 순으로 8개 가져옴.(100이하일 경우만)
		return itemDAO.getMainOutOfStockList(parent_id);
	}
	
	@Override
	public List<ItemVO> getFrequentSmartOrderItems() throws SQLException {

		return itemDAO.getFrequentSmartOrderItems();
	}
}