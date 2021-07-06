package traffic.bye.web;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CartService;
import traffic.bye.vo.CartVO;

@Slf4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	// 나중에 session으로 처리
	@PostMapping(value = "/cartList")
	@ResponseBody
	public List<CartVO> getCartList(Long id, HttpSession session) throws Exception {
		
		// String 형태로 통신 받았음. String - > long
		//long lid = Long.parseLong(id);
		log.info("체크");
		
		//Logger logger = LoggerFactory.getLogger(this.getClass());
		
		List<CartVO> cartList = cartService.getCartList(id);
		
		return cartList;
	}
	

	//add Cart
	@PostMapping(value = "/addCart")
	@ResponseBody
	public int addCart(long item_id, long quantity, HttpSession session) throws Exception {
		//session 에서 꺼내옴
		//String id = (String)session.getAttribute("id");
		//log.info(id);
		log.info("컨트롤러 : addCart로 왔음");
		log.info("item_id",item_id);
		log.info("quantity",quantity);
		
		
		//만약 카트에 item_id가 이미 있으면 update -> 현재 양 + quantity
    	//없으면 그냥 insert
		
		
		/*
		 * to-do (세션으로 변경)
		 * session 없이 회원은 우선 2로 설정
		 */
		// 회원 id, item
		CartVO cartVO = new CartVO();
		cartVO.setMember_id(2); // 임시로 id=2 회원 사용
		cartVO.setItem_id(item_id);
		cartVO.setQuantity(quantity);
		
		CartVO new_cartVO = cartService.findItemCart(cartVO);
		
		// insert
		if (new_cartVO == null) {
			try {
				cartService.insertCart(cartVO);	
			}catch (Exception e) {
				e.printStackTrace();
				return 0; // 실패		
			}
		}
		
		// 업데이트
		else {
			try {
				long new_quantity =new_cartVO.getQuantity();
				new_quantity += cartVO.getQuantity(); // 가져온 개수 더해줌
				
				cartVO.setQuantity(new_quantity);
				
				cartService.updateCart(cartVO);	
			}catch (Exception e) {
				e.printStackTrace();
				return 0; // 실패
			}
			
		}
		
		return 1; // 성공
		
		 
        
	}

	//delete Cart
	@PostMapping(value = "/deleteCart")
	@ResponseBody
	public int deleteCart(long item_id, HttpSession session) throws Exception {
		//session 에서 꺼내옴
		//session.getAttribute("id");
		log.info("컨트롤러 : deleteCart로 왔음");
		log.info("item_id",item_id);
		
		CartVO cartVO = new CartVO();
		
	
		cartVO.setItem_id(item_id);
		
		/*
		 * to-do
		 * member_id는 세션으로 대체
		 */

		cartVO.setMember_id(2); // 임시
		
		try {
			
			cartService.deleteCart(cartVO);
			log.info("삭제됨");
			
		}catch (Exception e) {
			e.printStackTrace();
			return 0; // 실패			
		}
		return 1; // 성공
		
	}
	
	
	
}
