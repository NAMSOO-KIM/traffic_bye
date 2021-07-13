package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CartVO;

public interface CartDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<CartVO> getCartList(long member_id) throws SQLException;
	void insertCart(CartVO cartVO) throws SQLException;
	void deleteCart(CartVO cartVO) throws SQLException;
	CartVO findItemCart(CartVO cartVO) throws SQLException;
	void updateCart(CartVO cartVO) throws SQLException;
	long countCart(long member_id) throws SQLException; 
	int completeCart(Long memberId) throws SQLException;
}
