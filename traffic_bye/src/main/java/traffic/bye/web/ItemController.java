package traffic.bye.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.PagingVO;
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
		
		return list;
	}
	
	@GetMapping(value = "items/{id}")
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		// 특정 아이템 정보, 해당하는 매장 정보 가져오기
		
		List<ItemVO> itemDetailList = itemService.getItemDetail(id);
		
		
		mav.addObject("itemDetailList",itemDetailList);
		
		
		ItemVO item = itemService.getItem(id);
		mav.addObject("item",item);
		
		// 매장 id 조회
		long store_id=itemDetailList.get(0).getStore_id();
		
		StoreVO store=storeService.getStore(store_id);
		mav.addObject("store", store);
		
		// 관련 상품들 추천(카테고리가 같은 아이템 모두 가져옴)
		long category_id = itemDetailList.get(0).getCategory_id();
		HashMap<String, Object> map = new HashMap<>();
		map.put("category_id",category_id);
		map.put("id",id);
		
		// 관련된 상품이 있으면 관련상품 목록 모두 가져옴
		List<ItemVO> selectMainItemList = itemService.getMainCategoryItemList(id);

		// int check = itemService.isRelatedItem(map);
		// if (check >= 1) {
		
		List<ItemVO> RelatedItemlist = itemService.getRelatedItemList(map);
		mav.addObject("RelatedItemlist",RelatedItemlist);	
		
		// }
	
		mav.setViewName("productDetail");
		return mav;
	}
	
	@GetMapping("mm/items/list/{category_id}")
	public ModelAndView boardList(PagingVO vo, Model model
			, @PathVariable("category_id") long category_id
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		// 특정 카테고리의 count 개수
		int total = itemService.countItem(category_id);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "12";
		}
		
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		

		mav.addObject("paging",vo);
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("parent_id", category_id);
		
		// 0이면 중분류, 1 이면 대분류
		long isCheckMain = categoryService.checkMainCategory(category_id);
		
		// 대분류의 중분류 가져와서 해당하는 아이템 전부 뽑기
		if(isCheckMain == 1) { // 대분류이면
			
			
			List<CategoryVO> mediumCategoryList = categoryService.getMediumCategory(category_id); // 대분류 id값 넣으면 중분류들 아이템 나옴
			List<ItemVO> newProductList = itemService.getMainCategoryNewItemList(category_id);
			List<ItemVO> selectMainItemList = itemService.getPagingItemList(map);
			CategoryVO mainCategoryVO = categoryService.getCategory(category_id);
			
			
			mav.addObject("mainCategoryVO",mainCategoryVO);
			mav.addObject("mediumCategoryList",mediumCategoryList);
			mav.addObject("newProductList",newProductList);
			mav.addObject("selectMainItemList",selectMainItemList);	
			
		}
		else { // 0 이면
			// 특정 카테고리 중분류 아이템들만 가져옴
			
			long parent_category_id = categoryService.getCategory(category_id).getParent_id();
			
			List<CategoryVO> mediumCategoryList = categoryService.getMediumCategory(parent_category_id); // 대분류 id값 넣으면 중분류들 아이템 나옴
			List<ItemVO> newProductList = itemService.getMainCategoryNewItemList(parent_category_id);
			List<ItemVO> selectMainItemList = itemService.getPagingItemList(map);
			CategoryVO mainCategoryVO = categoryService.getCategory(parent_category_id);
			
			mav.addObject("mainCategoryVO",mainCategoryVO);
			mav.addObject("mediumCategoryList",mediumCategoryList);
			mav.addObject("newProductList",newProductList);
			mav.addObject("selectMainItemList",selectMainItemList);
			
		}
		
		mav.setViewName("categoryPage");
		return mav;
	}
		
	@PostMapping(value = "/firstMainOutOfStockList")
	@ResponseBody
	public List<ItemVO> getFirstMainOutOfStockList(HttpSession session) throws Exception {

		long first_category = categoryService.getFirstMainCategory();
		
		
		List<ItemVO> firstItemList = itemService.getMainOutOfStockList(first_category);
		
		return firstItemList;	
	
		
	}
	
	@PostMapping(value = "/selectMainOutOfStockList")
	@ResponseBody
	public List<ItemVO> getSelectMainOutOfStockList(long id,HttpSession session) throws Exception {

		
		List<ItemVO> selectMainItemList = itemService.getMainOutOfStockList(id);

		return selectMainItemList;
	
		
	}
	
	
	
}
