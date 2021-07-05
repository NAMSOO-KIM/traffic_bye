package traffic.bye.service;

import java.util.List;

import traffic.bye.vo.CartVO;

public interface CartService {
	
	List<CartVO> getCartList(long member_id) throws Exception;
	
	void insertCart(CartVO cartVO) throws Exception;

}
