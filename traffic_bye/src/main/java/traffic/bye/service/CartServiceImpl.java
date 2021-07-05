package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.CartDAO;
import traffic.bye.vo.CartVO;



@Slf4j
@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartVO> getCartList(long member_id) throws Exception {

		return cartDAO.getCartList(member_id);
	}

	@Override
	public void insertCart(CartVO cartVO) throws Exception {
		
		cartDAO.insertCart(cartVO);
	}

	@Override
	public void deleteCart(CartVO cartVO) throws Exception {
		cartDAO.deleteCart(cartVO);
		
	}
	
	@Override
	public CartVO findItemCart(CartVO cartVO) throws Exception {
		
		return cartDAO.findItemCart(cartVO);
	}
	
	@Override
	public void updateCart(CartVO cartVO) throws Exception {
		cartDAO.updateCart(cartVO);
		
	}
	
	@Override
	public long cartCount(long member_id) throws Exception {

		return cartDAO.countCart(member_id);
	}
}