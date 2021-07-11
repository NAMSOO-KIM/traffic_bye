package traffic.bye.service;

import java.util.List;

import traffic.bye.vo.ItemDeleteVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.StoreItemVO;
import traffic.bye.vo.StoreStatusVO;
import traffic.bye.vo.StoreVO;


public interface StoreService {
	
	//public ItemDTO getItem(long itemNO) throws Exception;
	
	List<StoreVO> getStoreList() throws Exception;
	
	StoreVO getStore(long id) throws Exception;

	List<Long> getStoreCategories(long store_id) throws Exception;
	
	public List<StoreStatusVO> getStoreStatus(Long storeId) throws Exception;
	
	public List<StoreItemVO> getStoreItems(Long storeId) throws Exception;
	
	int deleteItem(ItemDeleteVO itemDeleteVO) throws Exception;

}
