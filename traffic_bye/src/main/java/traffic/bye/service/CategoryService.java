package traffic.bye.service;


import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CategoryVO;


public interface CategoryService {
	
	List<CategoryVO> getCategoryList() throws Exception;
	
	CategoryVO getCategory(long id) throws Exception;

	List<CategoryVO> getMainCategory() throws Exception;
	
	List<CategoryVO> getMediumCategory(long parent_id) throws Exception;
	
	long getFirstMainCategory() throws Exception;
}
