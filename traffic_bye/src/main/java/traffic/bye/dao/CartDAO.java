package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CartVO;

public interface CartDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<CartVO> getCartList(long member_id) throws SQLException;
	void insertCart(CartVO cartVO) throws SQLException;
	
}
