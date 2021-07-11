package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.dao.StoreDAO;
import traffic.bye.vo.ItemDeleteVO;
import traffic.bye.vo.ItemDetailVO;
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
}