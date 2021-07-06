package traffic.bye.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.service.CartService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.LoginInfo;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	
	// 나중에 session으로 처리
//	@GetMapping(value = "cartList/{id}")
//	public List<CartVO> getInstructor(@PathVariable("id") long id, HttpSession session) throws Exception {
//		Logger logger = LoggerFactory.getLogger(this.getClass());
//		
//		List<CartVO> cartList = cartService.getCartList(id);
//		
//		return cartList;
//	}
	
//	@GetMapping("/order")
//	public String order(Model model) {
//		return "orders/ordermain";
//		
//	}
	
	
	@GetMapping("/ordersdetail")
	public String orderdetail() {
		return "orders/ordersuccess";
	}
	
	@GetMapping("/ordertracking")
	public String orderTracking() {
		return "orders/ordertracking";
	}
	
	@GetMapping("/ordermanage")
	public String orderManage() {
		return "orders/ordermanage";
	}
	
}
