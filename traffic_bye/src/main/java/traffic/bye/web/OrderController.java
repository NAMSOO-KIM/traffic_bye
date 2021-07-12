package traffic.bye.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CartService;
import traffic.bye.service.MemberService;
import traffic.bye.service.OrdersService;
import traffic.bye.vo.CartChangeQuantityVO;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.DeleteQuantityVO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.OrdersDetailListParmVO;
import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersUpdateParamVO;
import traffic.bye.vo.OrdersVO;

@Controller
@Slf4j
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "order")
	public String getOrder(HttpSession session, Model model) throws Exception {
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long id = loginSession.getId();
		MemberVO memberVO = memberService.findMember(id); // 추가된 부분 - 김남수 
		model.addAttribute("memberVO", memberVO); // 추가된 부분
		
		List<CartVO> cartList = cartService.getCartList(id);
		System.out.println(cartList.toString());
		model.addAttribute("cartList", cartList);
		// return "orders/ordermain";
		return "orders/ordermainTest";  // 정상적으로 작동하면 orders/ordermainTest.jsp 파일을 ordermain.jsp에 복붙 후 사용 (ordermainTest.jsp 삭제)
	}

	@PostMapping(value = "orderInsert")
	public ResponseEntity<Void> orderInsert(HttpSession session, OrdersVO orders, OrdersDetailVO ordersDetail, Model model)
			 {
		OrdersVO ordersVO = new OrdersVO();
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		// 멤버 아이디
		try {
			log.info("ajax 매핑 들어옴");
//			List<CartVO> cartList = cartService.getCartList(memberId);
//			System.out.println(cartList);
//			// 카트 목록
//			long amount = 0;
//			List<Long> itemId = new ArrayList<>();
//			for (int i = 0; i < cartList.size(); i++) {
//				itemId.add(cartList.get(i).getItem_id());
//				amount += (cartList.get(i).getPrice() * cartList.get(i).getQuantity());
//			}
//			ordersVO.setMemberId(memberId);
//			ordersVO.setAmount(amount);
//			ordersService.insertOrders(ordersVO);
//			System.out.println("오더 번호는 : " + ordersService.getOrderId());
//			model.addAttribute("orderId", ordersService.getOrderId());
//			
//			List<OrdersDetailVO> orderDetails = new ArrayList<OrdersDetailVO>();
//			
//			for (int i = 0; i < cartList.size(); i++) {
//				OrdersDetailVO ordersDetailVO = new OrdersDetailVO();
//				ordersDetailVO.setItemId(cartList.get(i).getItem_id());
//				ordersDetailVO.setStoreId(cartList.get(i).getStore_id());
//				ordersDetailVO.setQuantity(cartList.get(i).getQuantity());
//				orderDetails.add(ordersDetailVO);
//			}
//			ordersService.makeOrder(ordersVO, orderDetails);
			return new ResponseEntity<Void>(HttpStatus.CREATED);			
		} catch(Exception e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_GATEWAY);
		}
	}

	@PostMapping(value = "/getOrderId")
	@ResponseBody
	public List<OrdersDetailListVO> orderSuccess(long orderId , HttpSession session) throws Exception {
		System.out.println("받아온 order 번호 : " + orderId);
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginSession.getStoreId();
		OrdersDetailListParmVO vo = new OrdersDetailListParmVO();
		vo.setOrderId(orderId);
		vo.setStoreId(storeId);
		
		List<OrdersDetailListVO> detailList = ordersService.getOrdersDetailList(vo);
		return detailList;
	}
	
	@PostMapping(value = "/orderAccept")
	@ResponseBody
	public void orderAccept(long orderId , HttpSession session) throws Exception {
		System.out.println("받아온 order 번호 : " + orderId);
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginSession.getStoreId();
		OrdersUpdateParamVO vo = new OrdersUpdateParamVO();
		vo.setOrderId(orderId);
		vo.setStoreId(storeId);
		ordersService.orderAccept(vo);
	}
	@PostMapping(value ="/orderReady")
	@ResponseBody
	public void orderReady(long orderId , HttpSession session) throws Exception{
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginSession.getStoreId();
		OrdersUpdateParamVO vo = new OrdersUpdateParamVO();
		vo.setOrderId(orderId);
		vo.setStoreId(storeId);
		ordersService.orderReady(vo);
	}
	
	@PostMapping(value ="/orderReceipt")
	@ResponseBody
	public void orderReceipt(long orderId , HttpSession session) throws Exception{
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long storeId = loginSession.getStoreId();
		OrdersUpdateParamVO vo = new OrdersUpdateParamVO();
		vo.setOrderId(orderId);
		vo.setStoreId(storeId);
		ordersService.orderReceipt(vo);
	}
	
	@PostMapping(value ="/changeQuantity")
	@ResponseBody
	public Map<String, Object> changeQuantity(String data) throws Exception{
		System.out.println(data);
		JSONObject json = getJsonDataFormMsg(data);
		long currentQuantity = Long.parseLong((String) json.get("currentQuantity"));
		long currentMemberId = Long.parseLong((String) json.get("currentMemberId"));
		long currentItemId = Long.parseLong((String) json.get("currentItemId"));
		CartChangeQuantityVO vo = new CartChangeQuantityVO();
		vo.setCurrentQuantity(currentQuantity);
		vo.setCurrentMemberId(currentMemberId);
		vo.setCurrentItemId(currentItemId);
		System.out.println(vo);
		ordersService.changeQuantity(vo);
		return null;
		
	}
	
	@PostMapping(value ="/deleteQuantity")
	@ResponseBody
	public Map<String, Object> deleteQuantity(String itemId ,HttpSession session) throws Exception{
		System.out.println(itemId);
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		DeleteQuantityVO vo = new DeleteQuantityVO();
		vo.setItemId(Long.parseLong(itemId));
		vo.setMemberId(memberId);
		System.out.println(vo);
		ordersService.deleteQuantity(vo);
		return null;
		
	}
	
	
	
//	@GetMapping(value="order/orderlist")
//	public String ordersList(HttpSession session, Model model) throws Exception{
//		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
//		long memberId = loginSession.getId();
//		List<OrdersListVO> ordersList = ordersService.getOrdersList(memberId);
//		model.addAttribute("ordersList", ordersList);
//		return "orders/orderlist";
//	}
	@GetMapping(value="member/mypage/orders")
	public String ordersList(HttpSession session, Model model) throws Exception{
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long memberId = loginSession.getId();
		List<OrdersListVO> ordersList = ordersService.getOrdersList(memberId);
		model.addAttribute("ordersList", ordersList);
		return "orders/orderlist";
	}
	
	@GetMapping(value ="member/mypage/orders/{memberId}/{id}")
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
	
	private JSONObject getJsonDataFormMsg(String data) throws Exception{
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(data);
		return (JSONObject)obj;
	}
	/*
	@GetMapping(value = "ordertest")
	public String getOrderTest(HttpSession session, Model model) throws Exception {
		LoginInfo loginSession = (LoginInfo) session.getAttribute("loginInfo");
		long id = loginSession.getId();
		MemberVO memberVO = memberService.findMember(id);
		model.addAttribute("memberVO",memberVO);
		
		List<CartVO> cartList = cartService.getCartList(id);
		System.out.println(cartList.toString());
		model.addAttribute("cartList", cartList);

		return "orders/ordermainTest";
	}
	*/
}
