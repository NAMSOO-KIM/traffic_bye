package traffic.bye.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.dao.StoreDAO;
import traffic.bye.vo.ImageVO;
import traffic.bye.vo.ItemDeleteVO;
import traffic.bye.vo.StoreDetailVO;
import traffic.bye.vo.StoreItemVO;
import traffic.bye.vo.StoreStatusVO;
import traffic.bye.vo.StoreVO;


@Slf4j
@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private S3Service s3Service;
	
	@Override
	public List<StoreVO> getStoreList() throws Exception {

		return storeDAO.getStoreList();
	}

	@Override
	public StoreVO getStore(long id) throws Exception {

		return storeDAO.getStore(id);
	}

	@Override
	public List<Long> getStoreCategories(long store_id) throws Exception {
		return storeDAO.getStoreCategories(store_id);
	}
	
	@Override
	public List<StoreStatusVO> getStoreStatus(Long storeId) throws Exception {
		// TODO Auto-generated method stub
		return storeDAO.getStoreStatus(storeId);
	}

	@Override
	public List<StoreItemVO> getStoreItems(Long storeId) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.getStoreItems(storeId);
	}

	@Override
	public int deleteItem(ItemDeleteVO itemDeleteVO) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.deleteItem(itemDeleteVO);
	}

	@Override
	public StoreDetailVO getStoreDetail(Long id) throws Exception {
		// TODO Auto-generated method stub
		return storeDAO.getStoreDetail(id);
	}

	@Override
	public void updateStore(Long storeId, String items, MultipartHttpServletRequest mreq) throws Exception {
		// TODO Auto-generated method stub
		ObjectMapper objectMapper = new ObjectMapper();
		StoreDetailVO storeDetailVO = objectMapper.readValue(items, StoreDetailVO.class);
		Map<String, MultipartFile> files = mreq.getFileMap();
		MultipartFile repreFile = files.get("repreFile");
		storeDetailVO.setId(storeId);
		if(repreFile != null) { // 대표 사진에 변경이 발생한 경우
			files.remove("repreFile"); // 새로 업로드를 해주고 기존에 있던 파일 정보 또한 업데이트 시켜준다.
			ImageVO repreImage = s3Service.processStoreImage(repreFile);
			storeDetailVO.setRepreFile(repreImage.getRealFileName());
			storeDetailVO.setThumbFileURL(repreImage.getThumbFileURL());
			storeDetailVO.setRepreFileSize(repreImage.getFileSize());
			storeDetailVO.setRepreFileURL(repreImage.getOriginFileURL());
		}
		storeDAO.updateStore(storeDetailVO);
	}}