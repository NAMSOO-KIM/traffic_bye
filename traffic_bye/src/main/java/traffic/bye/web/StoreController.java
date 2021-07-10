package traffic.bye.web;


import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.CategoryVO;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemDetailVO;
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
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeDetail");
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
	public String UpdateItemProc(@PathVariable Long id, @PathVariable Long itemId, String items, MultipartHttpServletRequest mreq) {		 
		log.info("HI");
		Map<String, MultipartFile> fileMap = mreq.getFileMap();
		Set<String> keySet = fileMap.keySet();
		for(String key : keySet) {
			log.info("key {} , fileName {}", key, fileMap.get(key).getOriginalFilename());
		}
		return null;
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
