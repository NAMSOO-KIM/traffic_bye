package traffic.bye.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CartService;
import traffic.bye.service.ItemService;
import traffic.bye.vo.CartVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.LoginInfo;

@Slf4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemService itemService;
	
	
	private LoginInfo loginInfo;
	
	// 나중에 session으로 처리
	@PostMapping(value = "/cartList")
	@ResponseBody
	public List<CartVO> getCartList(HttpSession session) throws Exception {
	//public List<CartVO> getCartList(Long id, HttpSession session) throws Exception {
		log.info("체크");
		
		loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			log.info("로그인 부터 하셈");
			return null;
		}
		else {
			long id = loginInfo.getId();
			List<CartVO> cartList = cartService.getCartList(id);
			
			return cartList;	
		}
		
	}
	

	//add Cart
	@PostMapping(value = "/addCart")
	@ResponseBody
	public int addCart(long item_id, long quantity, HttpSession session) throws Exception {
		
		log.info("컨트롤러 : addCart로 왔음");
		log.info("item_id",item_id);
		log.info("quantity",quantity);
		
		
		//만약 카트에 item_id가 이미 있으면 update -> 현재 양 + quantity
    	//없으면 그냥 insert
		
		loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			log.info("로그인 부터 하셈");
			return 0;
		}
		else {
			
			long id = loginInfo.getId();
			
			CartVO cartVO = new CartVO();
			cartVO.setMember_id(id); 
			cartVO.setItem_id(item_id);
			cartVO.setQuantity(quantity);
			
			CartVO new_cartVO = cartService.findItemCart(cartVO);
			
			ItemVO itemVO=itemService.getItem(item_id);
			long possible_quantity = itemVO.getStock();
			
			// insert
			if (new_cartVO == null) {
				if (quantity<=possible_quantity) {
					try {
						cartService.insertCart(cartVO);	
						return 1; // 성공
					}catch (Exception e) {
						e.printStackTrace();
						return 0; // 실패		
					}
				}
				else {
					return 2; // 재고부족
				}
			}
			
			// 업데이트
			else {
				long new_quantity =new_cartVO.getQuantity();
				new_quantity += cartVO.getQuantity(); // 가져온 개수 더해줌
				if (new_quantity <= possible_quantity) {
					try {
						cartVO.setQuantity(new_quantity);
						cartService.updateCart(cartVO);							
						return 1; //성공
					}catch (Exception e) {
						e.printStackTrace();
						return 0; // 실패
					}
				}else {
					return 2; //재고부족
				}
		}
		}
	}

	//delete Cart
	@PostMapping(value = "/deleteCart")
	@ResponseBody
	public int deleteCart(long item_id, HttpSession session) throws Exception {

		loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		
		log.info("컨트롤러 : deleteCart로 왔음");
		
		if (loginInfo == null) {
			log.info("로그인 부터 하셈");
			return 0;
		}
		
		else {
			CartVO cartVO = new CartVO();
			cartVO.setItem_id(item_id);
			
			long id = loginInfo.getId(); 
			cartVO.setMember_id(id); // 임시
			
			try {
				cartService.deleteCart(cartVO);
				log.info("삭제됨");
				
			}catch (Exception e) {
				e.printStackTrace();
				return 2; // 실패			
			}
			return 1; // 성공
			
		}
		
		}
		
		
		
	
	
}
