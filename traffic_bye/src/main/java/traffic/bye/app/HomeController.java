package traffic.bye.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.ItemVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		try {
			List<ItemVO> list = itemService.getItemList();

			// 대분류 카테고리 가져오기
			List<CategoryVO> mainCategoryList = categoryService.getMainCategory();
			

			model.addAttribute("itemList",list);
			model.addAttribute("mainCategoryList",mainCategoryList);
			
			//model.addAttribute("", mainCategoryList;)
			// 대분류에 해당하는 아이템 가져오기
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
}
