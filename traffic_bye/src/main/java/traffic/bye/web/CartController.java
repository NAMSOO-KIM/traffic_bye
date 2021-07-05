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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public List<CartVO> getInstructor(Long id, HttpSession session) throws Exception {
		
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
		//session.getAttribute("id");
		log.info("컨트롤러 : addCart로 왔음");
		log.info("item_id",item_id);
		log.info("quantity",quantity);
		
		CartVO cartVO = new CartVO();
		cartVO.setMember_id(2);
		cartVO.setItem_id(item_id);
		cartVO.setQuantity(quantity);
		try {
			cartService.insertCart(cartVO);
		}catch (Exception e) {
			e.printStackTrace();
			return 0; // 실패			
		}
		return 1; // 성공
		
	}
	
}
