package traffic.bye.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	@GetMapping("/order")
	public String order(HttpSession session) {
		session.setAttribute("userInfo", session);
		System.out.println(session);
		return "orders/ordermain";
	}
	
	@GetMapping("/ordersdetail")
	public String orderdetail() {
		return "orders/ordersuccess";
	}
}
