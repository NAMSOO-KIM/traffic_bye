package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CategoryVO;

public interface CategoryDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	
	List<CategoryVO> getCategoryList() throws SQLException;
	
	CategoryVO getCategory(long id) throws SQLException;
	
	List<CategoryVO> getMainCategory() throws SQLException;
	
	List<CategoryVO> getMediumCategory(long parent_id) throws SQLException;
	
	long getFirstMainCategory() throws SQLException;
	
	long checkMainCategory(long id) throws SQLException; // 대분류인지 체크. 0이면 중분류
	
	//long getCategory(long id) throws SQLException;
}
