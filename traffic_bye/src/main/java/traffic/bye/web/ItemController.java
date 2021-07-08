package traffic.bye.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.StoreVO;

@Slf4j
@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private CategoryService categoryService;
	
	private LoginInfo loginInfo;

	@RequestMapping(value = "itemList", produces = "application/json; charset=UTF-8")
	public List<ItemVO> getInstructor() throws Exception {
		List<ItemVO> list = itemService.getItemList();
		//ItemVO itemVO = list.get(0);
		
		//System.out.println(itemVO.getDetail());
		return list;
	}
	
	@GetMapping(value = "items/{id}")
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Logger logger = LoggerFactory.getLogger(this.getClass());
		logger.info("hi");
		
		
		// 특정 아이템 정보, 해당하는 매장 정보 가져오기
		try {
			
			ItemVO item = itemService.getItem(id);
			mav.addObject("item",item);
			
			//매장 id 조회
			long store_id=item.getStore_id();
			StoreVO store=storeService.getStore(store_id);
			mav.addObject("store", store);
			
			//관련 상품들 추천(카테고리가 같은 아이템 모두 가져옴)
			long category_id = item.getCategory_id();
			HashMap<String, Object> map = new HashMap<>();
			map.put("category_id",category_id);
			map.put("id",id);
			
			List<ItemVO> RelatedItemlist = itemService.getRelatedItemList(map);
			mav.addObject("RelatedItemlist",RelatedItemlist);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("productDetail");
		return mav;
	}
	
	@GetMapping(value = "mm/items/list/{category_id}")
	public ModelAndView itemList(@PathVariable("category_id") long category_id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Logger logger = LoggerFactory.getLogger(this.getClass());
		logger.info("hi");
		
		mav.setViewName("categoryPage");
		return mav;
	}
	
	
	@PostMapping(value = "/firstMainList")
	@ResponseBody
	public List<ItemVO> getFirstMainItemList(HttpSession session) throws Exception {
	//public List<CartVO> getCartList(Long id, HttpSession session) throws Exception {
		log.info("firstMainList로 옴");
		
		
		//long id = loginInfo.getId();
		long first_category = categoryService.getFirstMainCategory();
		
		List<ItemVO> firstItemList = itemService.getMainCategoryItemList(first_category);
		for(ItemVO iv : firstItemList) {
			System.out.println(iv.getId());
			System.out.println(iv.getName());
			System.out.println(iv.getDetail());
			System.out.println(iv.getPrice());
			System.out.println(iv.getThumb_file_url());
			System.out.println();
			System.out.println();
		}
		
		return firstItemList;	
	
		
	}
	
	@PostMapping(value = "/selectMainList")
	@ResponseBody
	public List<ItemVO> getSelectMainItemList(long id,HttpSession session) throws Exception {
	//public List<CartVO> getCartList(Long id, HttpSession session) throws Exception {
		log.info("selectMainList로 옴");
		
		
		//long id = loginInfo.getId();
		
		//long select_category = categoryService.get();
		//List<CategoryVO> mediumCategoryList =categoryService.getMediumCategory(id);
		List<ItemVO> selectMainItemList = itemService.getMainCategoryItemList(id);
//		List<ItemVO> firstItemList = itemService.getMainCategoryItemList(id);
		System.out.println("selectMainItemList 출력");
		
		for(ItemVO iv : selectMainItemList) {
			System.out.println(iv.getId());
			System.out.println(iv.getName());
			System.out.println(iv.getDetail());
			System.out.println(iv.getPrice());
			System.out.println(iv.getThumb_file_url());
			System.out.println();
			System.out.println();
		}
		
		return selectMainItemList;	
	
		
	}
	
	
}
