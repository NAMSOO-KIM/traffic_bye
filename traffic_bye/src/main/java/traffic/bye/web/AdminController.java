package traffic.bye.web;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CategoryService;
import traffic.bye.service.ItemService;
import traffic.bye.service.OrdersService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.ItemDeleteVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.OrdersManageVO;

@Slf4j
@RequestMapping("admin/{id}")
@Controller
public class AdminController {
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("")
	public String orderManage(HttpSession session, Model model) throws Exception {
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginInfo.getStoreId();
		List<OrdersManageVO> ordersList = ordersService.getOrderList(storeId);
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		System.out.println(ordersList.toString());
		model.addAttribute("ordersList", ordersList);
		model.addAttribute("storeStatus", storeService.getStoreStatus(storeId));
		model.addAttribute("month", month);
		return "admin/ordermanage";
	}
	
	@GetMapping("/addItem")
	public String addItem(Model model) {
		try {
			model.addAttribute("bigCategories", categoryService.getMainCategory());
			return "admin/addItem";
		} catch(Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@PostMapping("addItem")
	public ResponseEntity<Long> addItemProc(@PathVariable Long id, String items, MultipartHttpServletRequest mreq) {
		try {
			Long itemId = itemService.addItem(id, items, mreq);
			return new ResponseEntity<Long>(itemId, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Long>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/updateItem/{itemId}")
	public String updateItem(@PathVariable Long id, @PathVariable Long itemId, Model model) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			ItemDetailVO itemDetailVO = itemService.getItemDetailWithImage(itemId);
			log.info(itemDetailVO.toString());
			String data = objectMapper.writeValueAsString(itemDetailVO);
			model.addAttribute("bigCategories", categoryService.getMainCategory());
			model.addAttribute("midCategories", categoryService.getMediumCategory(itemDetailVO.getParentCategoryId()));
			model.addAttribute("itemDetailVO", data);
			return "admin/updateItem";
		} catch(Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}

	@PostMapping("/updateItem/{itemId}")
	public ResponseEntity<Void> UpdateItemProc(@PathVariable Long id, @PathVariable Long itemId, String items, MultipartHttpServletRequest mreq) {		 
		try {
			itemService.updateItem(itemId, items, mreq);
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/items")
	public String getItems(@PathVariable Long id, Model model) {
		try {
			model.addAttribute("itemList", storeService.getStoreItems(id));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/itemList";
	}
	
	@DeleteMapping("/items/{itemId}")
	public ResponseEntity<Void> deleteItem(@PathVariable Long id, @PathVariable Long itemId){
		log.info("HI");
		try {
			storeService.deleteItem(new ItemDeleteVO(itemId, id));
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} catch(Exception e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			
		}
	}
}