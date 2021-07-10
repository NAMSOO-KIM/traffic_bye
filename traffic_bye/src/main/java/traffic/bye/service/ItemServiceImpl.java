package traffic.bye.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.vo.ItemVO;


@Slf4j
@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO itemDAO;


	@Override
	public List<ItemVO> getItemList() throws Exception {
		
		return itemDAO.getItemList();
	}
	
	@Override
	public ItemVO getItem(long id) throws Exception {

		return itemDAO.getItem(id);
	}

	@Override
	public List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws Exception {
		return itemDAO.getRelatedItemList(map);
	}
	
	@Override
	public List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException {
		
		return itemDAO.getMainCategoryItemList(parent_id);
	}


	@Override
	public List<ItemVO> getItemDetail(long id) throws SQLException {

		return itemDAO.getItemDetail(id);
	}
	
	@Override
	public int isRelatedItem(HashMap<String, Object> map) throws Exception {

		return itemDAO.isRelatedItem(map);
	}

	@Override
	public List<ItemVO> getItemFromStore(long store_id) throws Exception {
		return itemDAO.getItemFromStore(store_id);
	}
	
}