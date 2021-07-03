package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.ItemVO;

public interface ItemDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<ItemVO> getItemList() throws SQLException;
	
}
