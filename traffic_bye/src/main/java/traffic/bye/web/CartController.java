package traffic.bye.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import traffic.bye.service.CartService;
import traffic.bye.vo.CartVO;


@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	// 나중에 session으로 처리
	@GetMapping(value = "cartList/{id}")
	public List<CartVO> getInstructor(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		List<CartVO> cartList = cartService.getCartList(id);
		
		return cartList;
	}
	
	
}
