package traffic.bye.service;

import java.util.List;

import traffic.bye.vo.StoreVO;


public interface StoreService {
	
	//public ItemDTO getItem(long itemNO) throws Exception;
	
	List<StoreVO> getStoreList() throws Exception;
	
	StoreVO getStore(long id) throws Exception;

}
