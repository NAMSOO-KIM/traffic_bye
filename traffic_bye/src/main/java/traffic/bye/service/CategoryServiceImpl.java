package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.CategoryDAO;
import traffic.bye.vo.CategoryVO;


@Slf4j
@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;


	@Override
	public List<CategoryVO> getCategoryList() throws Exception {

		return categoryDAO.getCategoryList();
	}

	@Override
	public CategoryVO getCategory(long id) throws Exception {

		return categoryDAO.getCategory(id);
	}

	
}