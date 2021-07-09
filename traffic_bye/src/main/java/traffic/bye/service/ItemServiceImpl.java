package traffic.bye.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.util.Util;
import traffic.bye.vo.ImageVO;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;


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
		ImageVO repreImage = s3Service.processImage(repreFile);
		itemAddVO.setRepreFile(repreImage.getRealFileName());
		itemDAO.addItem(itemAddVO);
		Long id = itemAddVO.getId();
		repreImage.setItemId(id);
		images.add(repreImage);
		for(String anotherFileParam : anotherParams) {
			MultipartFile anotherFile = files.get(anotherFileParam);
			ImageVO imageVO = s3Service.processImage(anotherFile);
			imageVO.setItemId(id);
			images.add(imageVO);
		}
		itemDAO.addItemImages(images);
		return id;

	}
}