package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.StoreVO;

public interface StoreDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<StoreVO> getStoreList() throws SQLException;
	
	StoreVO getStore(long id) throws SQLException;

	List<Long> getStoreCategories(long store_id) throws SQLException;
	
}
