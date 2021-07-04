package traffic.bye.service;

import java.util.List;

import traffic.bye.vo.CartVO;

public interface CartService {
	
	List<CartVO> getCartList(long member_id) throws Exception;
	
	//CategoryVO getCategory(long id) throws Exception;

}
