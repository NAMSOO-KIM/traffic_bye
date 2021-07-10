package traffic.bye.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import traffic.bye.service.CartService;
import traffic.bye.service.OrdersService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersVO;

@Controller
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private OrdersService ordersService;

	@GetMapping(value = "order")
	public String getInstructor(HttpSession session, Model model) throws Exception {
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long id = loginSession.getId();
		List<CartVO> cartList = cartService.getCartList(id);
		System.out.println(cartList.toString());
		model.addAttribute("cartList", cartList);
		return "orders/ordermain";
	}

	@PostMapping(value = "orderInsert")
	public String orderInsert(HttpSession session, OrdersVO orders, OrdersDetailVO ordersDetail, Model model)
			throws Exception {
		OrdersVO ordersVO = new OrdersVO();
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		// 멤버 아이디
		List<CartVO> cartList = cartService.getCartList(memberId);
		System.out.println(cartList);
		// 카트 목록
		long amount = 0;
		List<Long> itemId = new ArrayList<>();
		for (int i = 0; i < cartList.size(); i++) {
			itemId.add(cartList.get(i).getItem_id());
			amount += (cartList.get(i).getPrice() * cartList.get(i).getQuantity());
		}
		ordersVO.setMemberId(memberId);
		ordersVO.setAmount(amount);
		ordersService.insertOrders(ordersVO);
		System.out.println("오더 번호는 : " + ordersService.getOrderId());
		model.addAttribute("orderId", ordersService.getOrderId());

		for (int i = 0; i < cartList.size(); i++) {
			OrdersDetailVO ordersDetailVO = new OrdersDetailVO();
			ordersDetailVO.setItemId(cartList.get(i).getItem_id());
			ordersDetailVO.setStoreId(cartList.get(i).getStore_id());
			ordersDetailVO.setQuantity(cartList.get(i).getQuantity());
			ordersService.insertOrdersDetail(ordersDetailVO);
		}
		return "orders/ordersuccess";
	}

	@PostMapping(value = "/getOrderId")
	@ResponseBody
	public List<OrdersDetailListVO> orderSuccess(long orderId) throws Exception {
		System.out.println("받아온 order 번호 : " + orderId);
		List<OrdersDetailListVO> detailList = ordersService.getOrdersDetailList(orderId);
		return detailList;
	}
	
	@PostMapping(value = "/orderAccept")
	@ResponseBody
	public void orderAccept(long orderId) throws Exception {
		System.out.println("받아온 order 번호 : " + orderId);
		ordersService.orderAccept(orderId);
	}
	@PostMapping(value ="/orderReady")
	@ResponseBody
	public void orderReady(long orderId) throws Exception{
		ordersService.orderReady(orderId);
	}
	
	@PostMapping(value ="/orderReceipt")
	@ResponseBody
	public void orderReceipt(long orderId) throws Exception{
		ordersService.orderReceipt(orderId);
	}
	
	
	@GetMapping(value="order/orderlist")
	public String ordersList(HttpSession session, Model model) throws Exception{
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		List<OrdersListVO> ordersList = ordersService.getOrdersList(memberId);
		model.addAttribute("ordersList", ordersList);
		return "orders/orderlist";
	}
	
	@GetMapping(value ="order/orderlist/{memberId}/{id}")
	public String orderTracking(@PathVariable long memberId, @PathVariable long id ,Model model) throws Exception {
		OrdersTrackingVO trackingList = ordersService.getOrderTrackingList(id);
		model.addAttribute("list",trackingList);
		System.out.println("트래킹 리스트:"+trackingList.toString());
		return "orders/ordertracking";
		
	}
	

	@GetMapping("ordermanage")
	public String orderManage(HttpSession session, Model model) throws Exception {
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginInfo.getStoreId();
		List<OrdersManageVO> ordersList = ordersService.getOrderList(storeId);
		System.out.println(ordersList.toString());
		model.addAttribute("ordersList", ordersList);

		return "orders/ordermanage";
	}
	

//	@PostMapping("/statusChange")
//	public String statusChange() {
//		
//		
//	}

}
