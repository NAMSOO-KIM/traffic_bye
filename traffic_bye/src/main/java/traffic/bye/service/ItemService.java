package traffic.bye.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemVO;


public interface ItemService {
	
	//public ItemDTO getItem(long itemNO) throws Exception;
	
	List<ItemVO> getItemList() throws Exception;
	
	ItemVO getItem(long id) throws Exception;

	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws Exception; 
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	List<ItemVO> getItemDetail(long id) throws Exception;
	
	int isRelatedItem(HashMap<String, Object> map) throws Exception;


	List<ItemVO> getItemFromStore(long id) throws Exception;

	
	List<ItemVO> getMediumCategoryItemList(long category_id) throws SQLException;

	Long addItem(Long storeId, String items, MultipartHttpServletRequest mreq) throws Exception;

	List<ItemVO> getMainCategoryNewItemList(long category_id) throws SQLException;
	
	ItemDetailVO getItemDetailWithImage(Long id) throws Exception;
}
