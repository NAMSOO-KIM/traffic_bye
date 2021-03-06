package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.StoreDetailVO;
import traffic.bye.vo.StoreStatusVO;
import traffic.bye.vo.StoreVO;

public interface StoreDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<StoreVO> getStoreList() throws SQLException;
	
	StoreVO getStore(long id) throws SQLException;

	List<Long> getStoreCategories(long store_id) throws SQLException;
	
	List<StoreStatusVO> getStoreStatus(Long storeId) throws SQLException;
	
	StoreDetailVO getStoreDetail(Long id) throws SQLException;
	
	void updateStore(StoreDetailVO storeDetailVO) throws SQLException;
}
