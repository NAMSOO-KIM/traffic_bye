package traffic.bye.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import traffic.bye.vo.ItemVO;


public interface ItemService {
	
	//public ItemDTO getItem(long itemNO) throws Exception;
	
	List<ItemVO> getItemList() throws Exception;
	
	ItemVO getItem(long id) throws Exception;

	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws Exception; 
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	List<ItemVO> getItemDetail(long id) throws Exception;
}
