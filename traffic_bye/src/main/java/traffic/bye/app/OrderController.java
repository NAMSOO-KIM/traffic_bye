package traffic.bye.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	@GetMapping("/order")
	public String order() {
		return "orders/ordermain";
	}
	
	@GetMapping("/orderdetail")
	public String orderdetail() {
		return "orders/ordersuccess";
	}
}
