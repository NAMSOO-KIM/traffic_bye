package traffic.bye.service;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.dao.CartDAO;
import traffic.bye.vo.CartVO;

public interface CartService {
	
	List<CartVO> getCartList(long member_id) throws Exception;
	
	void insertCart(CartVO cartVO) throws Exception;
	
	void deleteCart(CartVO cartVO) throws Exception;
	
	CartVO findItemCart(CartVO cartVO) throws Exception;
	
	void updateCart(CartVO cartVO) throws Exception; 
	
	long cartCount(long member_id) throws Exception;
}
