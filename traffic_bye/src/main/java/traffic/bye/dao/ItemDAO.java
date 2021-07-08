package traffic.bye.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import traffic.bye.vo.ItemVO;

public interface ItemDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<ItemVO> getItemList() throws SQLException;
	
	ItemVO getItem(long id) throws SQLException;
	
	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws SQLException;
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	
}
