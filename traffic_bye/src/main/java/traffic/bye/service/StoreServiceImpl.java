package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.StoreDAO;
import traffic.bye.vo.StoreVO;


@Slf4j
@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO storeDAO;
	
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
	
}