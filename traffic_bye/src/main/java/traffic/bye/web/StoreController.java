package traffic.bye.web;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.PagingVO;
import traffic.bye.vo.StoreVO;



@Slf4j
@Controller
public class StoreController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ItemService itemService;
	
	
	@RequestMapping(value = "storeList", produces = "application/json; charset=UTF-8")
	public List<StoreVO> getStore() throws Exception {
		List<StoreVO> list = storeService.getStoreList();
		return list;
	}
	
	//to-do 링크만 따뒀음
	@GetMapping(value = "store/{id}")
	public ModelAndView itemDetail(PagingVO vo, Model model
			, @PathVariable("id") long id
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		
		try {
			StoreVO storeInfo = storeService.getStore(id);

			// 특정 카테고리의 count 개수
			int total = itemService.countStoreItem(id);
			
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
			map.put("store_id", id);
			
			List<ItemVO> selectMainItemList = itemService.getPagingStoreItemList(map);
			mav.addObject("selectMainItemList",selectMainItemList);
			
			mav.addObject("store", storeInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("store/storeDetail");
		return mav;
	}
	
	@GetMapping("/store/{id}/addItem")
	public String addItem(Model model) {
		try {
			model.addAttribute("bigCategories", categoryService.getMainCategory());
			return "store/addItem";
		} catch(Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@PostMapping("/store/{id}/addItem")
	public ResponseEntity<Long> addItemProc(@PathVariable Long id, String items, MultipartHttpServletRequest mreq) {
		try {
			Long itemId = itemService.addItem(id, items, mreq);
			return new ResponseEntity<Long>(itemId, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Long>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/store/{id}/updateItem/{itemId}")
	public String updateItem(@PathVariable Long id, @PathVariable Long itemId, Model model) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			ItemDetailVO itemDetailVO = itemService.getItemDetailWithImage(itemId);
			log.info(itemDetailVO.toString());
			String data = objectMapper.writeValueAsString(itemDetailVO);
			model.addAttribute("bigCategories", categoryService.getMainCategory());
			model.addAttribute("midCategories", categoryService.getMediumCategory(itemDetailVO.getParentCategoryId()));
			model.addAttribute("itemDetailVO", data);
			return "store/updateItem";
		} catch(Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}

	@PostMapping("/store/{id}/updateItem/{itemId}")
	public ResponseEntity<Void> UpdateItemProc(@PathVariable Long id, @PathVariable Long itemId, String items, MultipartHttpServletRequest mreq) {		 
		try {
			itemService.updateItem(itemId, items, mreq);
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_GATEWAY);
		}
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
	
	@GetMapping("/store/{id}/update")
	public String storeUpdate(@PathVariable Long id) {
		return null;
	}
}
