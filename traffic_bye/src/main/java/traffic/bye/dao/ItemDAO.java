package traffic.bye.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import traffic.bye.vo.ImageVO;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemVO;

public interface ItemDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<ItemVO> getItemList() throws SQLException;
	
	ItemVO getItem(long id) throws SQLException;
	
	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws SQLException;
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	List<ItemVO> getItemDetail(long id) throws SQLException; // 이미지 포함
	
	int isRelatedItem(HashMap<String, Object> map) throws SQLException;
	
	List<ItemVO> getMediumCategoryItemList(long category_id) throws SQLException;

	Long addItem(ItemAddVO itemAddVO) throws SQLException;
	
	int addItemImages(List<ImageVO> list) throws SQLException;

}
