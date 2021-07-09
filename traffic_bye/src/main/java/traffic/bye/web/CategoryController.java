package traffic.bye.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import traffic.bye.service.CategoryService;
import traffic.bye.vo.CategoryVO;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping(value = "categoryList", produces = "application/json; charset=UTF-8")
	public List<CategoryVO> getCategory() throws Exception {
		List<CategoryVO> list = categoryService.getCategoryList();
		return list;
	}
	
	
	@GetMapping("/midCategory")
	@ResponseBody
	public List<CategoryVO> getMidCategories(long id) {
		try {
			return categoryService.getMediumCategory(id);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
