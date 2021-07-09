package traffic.bye.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.StoreVO;

@Slf4j
@Controller
public class StoreController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StoreService storeService;
	
	
	@RequestMapping(value = "storeList", produces = "application/json; charset=UTF-8")
	public List<StoreVO> getStore() throws Exception {
		List<StoreVO> list = storeService.getStoreList();
		return list;
	}
	
	//to-do 링크만 따뒀음
	@GetMapping(value = "store/{id}")
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeDetail");
		return mav;
	}
	
	@RequestMapping(value="store")
	public ModelAndView storeMain(HttpSession session) throws Exception{
		log.info("store main 들어옴");
		ModelAndView mav = new ModelAndView();
		
		try {
			List<CategoryVO> categories = categoryService.getCategoryList();
			List<StoreVO> stores = storeService.getStoreList();

			for(StoreVO store : stores) {
				List<Long> storeCategories = storeService.getStoreCategories(store.getId());
				store.setCategories(storeCategories);
				log.info("store num : " + store.getName() + " list : " + storeCategories.toString());
			}
			
			mav.addObject("categoryList", categories);
			mav.addObject("storeList", stores);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("store/storeMain");
		return mav;
	}
	
}
