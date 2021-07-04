package traffic.bye.service;

import java.util.List;

import traffic.bye.vo.CategoryVO;


public interface CategoryService {
	
	List<CategoryVO> getCategoryList() throws Exception;
	
	CategoryVO getCategory(long id) throws Exception;

}
