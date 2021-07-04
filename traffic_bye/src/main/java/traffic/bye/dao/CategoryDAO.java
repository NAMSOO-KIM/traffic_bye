package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CategoryVO;

public interface CategoryDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	
	List<CategoryVO> getCategory() throws SQLException;
	
	CategoryVO getCategory(long id) throws SQLException;
	
}
