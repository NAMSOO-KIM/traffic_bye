package traffic.bye.service;

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

	
}