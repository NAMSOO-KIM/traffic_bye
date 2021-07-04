package traffic.bye.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.vo.LoginInfo;

@Controller
public class OrderController {
	
	@GetMapping("/order")
	public String order(HttpSession session , Model model) {
		LoginInfo mySession =(LoginInfo)session.getAttribute("loginInfo");
		System.out.println(mySession.getLoginId());
		model.addAttribute("mySession",mySession.getLoginId());
		return "orders/ordermain";
		
	}
	
	
	@GetMapping("/ordersdetail")
	public String orderdetail() {
		return "orders/ordersuccess";
	}
	
	@GetMapping("/ordertracking")
	public String orderTracking() {
		return "orders/ordertracking";
	}
}
