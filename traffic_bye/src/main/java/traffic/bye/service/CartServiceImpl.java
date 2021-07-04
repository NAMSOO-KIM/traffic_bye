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
		// TODO Auto-generated method stub
		return cartDAO.getCartList(member_id);
	}

	
}