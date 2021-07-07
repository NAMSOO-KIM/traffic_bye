package traffic.bye.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.service.CartService;
import traffic.bye.service.MemberService;
import traffic.bye.service.OrdersService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersVO;

@Controller
public class OrderTestController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrdersService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "creditTest")
	public String getTest(HttpSession session, Model model) throws Exception {
		LoginInfo loginSession = (LoginInfo)session.getAttribute("loginInfo");
		long id = loginSession.getId();
		
		MemberVO memberVO = memberService.findMember(id);
		
		
		// 회원정보 가져감
		System.out.println(memberVO);
		System.out.println(memberVO.getName());
		model.addAttribute("memberVO",memberVO);
		
		
		List<CartVO> cartList = cartService.getCartList(id);
		System.out.println(cartList.toString());
		model.addAttribute("cartList",cartList);
		
		return "testView/testorder";
	}
	
	@PostMapping(value="testorder")
	public String testorder(HttpSession session , OrdersVO orders, OrdersDetailVO ordersDetail ) throws Exception {
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
	
	@PostMapping(value="/payments/complete" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ModelAndView completePayments(HttpServletRequest request, HttpSession session) throws Exception {
		String uid = request.getParameter("imp_uid");
		System.out.println(uid);
		//return "orders/ordersuccess";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("orders/ordersuccess");
		return mav;
	}
	
	
	/*
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
	*/
	
}
