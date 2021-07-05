package traffic.bye.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.service.CartService;
import traffic.bye.vo.CartVO;

@Slf4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	// 나중에 session으로 처리
	@GetMapping(value = "cartList/{id}")
	public List<CartVO> getInstructor(@PathVariable("id") long id, HttpSession session) throws Exception {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		List<CartVO> cartList = cartService.getCartList(id);
		
		return cartList;
	}
	
	
}
