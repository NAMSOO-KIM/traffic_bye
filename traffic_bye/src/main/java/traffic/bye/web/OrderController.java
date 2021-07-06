package traffic.bye.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import traffic.bye.service.CartService;
import traffic.bye.service.OrdersService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersVO;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrdersService orderService;
	
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
	
	@GetMapping(value = "order")
	public String getInstructor(HttpSession session, Model model) throws Exception {
		LoginInfo loginSession = (LoginInfo)session.getAttribute("loginInfo");
		long id = loginSession.getId();
		System.out.println(id);
		List<CartVO> cartList = cartService.getCartList(id);
		System.out.println(cartList.toString());
		model.addAttribute("cartList",cartList);
		return "orders/ordermain";
	}
	
	@PostMapping(value="orderInsert")
	public String orderInsert(HttpSession session , OrdersVO orders, OrdersDetailVO ordersDetail ) throws Exception {
		OrdersVO ordersVO = new OrdersVO();
		LoginInfo loginSession = (LoginInfo)session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		//멤버 아이디 
		List<CartVO> cartList = cartService.getCartList(memberId);
		System.out.println(cartList);
		//카트 목록
		long amount=0;
		List<Long> itemId = new ArrayList<>();
		for(int i=0;i<cartList.size();i++) {
			itemId.add(cartList.get(i).getItem_id());
			amount += (cartList.get(i).getPrice()*cartList.get(i).getQuantity());
		}
		ordersVO.setMemberId(memberId);
		ordersVO.setAmount(amount);
		orderService.insertOrders(ordersVO);
		
		for(int i=0;i<cartList.size();i++) {
			OrdersDetailVO ordersDetailVO = new OrdersDetailVO();
			ordersDetailVO.setItemId(cartList.get(i).getItem_id());
			ordersDetailVO.setStoreId(cartList.get(i).getStore_id());
			ordersDetailVO.setQuantity(cartList.get(i).getQuantity());
			orderService.insertOrdersDetail(ordersDetailVO);
		}
		
		return "orders/ordersuccess";
	}
	
	
	
	
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
