package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.CartChangeQuantityVO;
import traffic.bye.vo.DeleteQuantityVO;
import traffic.bye.vo.OrdersDetailListParmVO;
import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersUpdateParamVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersDAO {
	
	int insertOrders(OrdersVO ordersVO) throws SQLException;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws SQLException;

	List<OrdersManageVO> getOrderList(long storeId) throws SQLException;
	
	long getOrderId() throws SQLException; 
	
	List<OrdersDetailListVO> getOrdersDetailList(OrdersDetailListParmVO vo) throws SQLException;

	void orderAccept(OrdersUpdateParamVO vo) throws SQLException;

	void orderReady(OrdersUpdateParamVO vo) throws SQLException;

	void orderReceipt(OrdersUpdateParamVO vo) throws SQLException;

	List<OrdersListVO> getOrdersList(long memberId) throws SQLException;

	List<OrdersTrackingVO> getOrderTrackingList(long orderId) throws SQLException;

	void changeQuantity(CartChangeQuantityVO vo) throws SQLException;

	void deleteQuantity(DeleteQuantityVO vo) throws SQLException;
	
	long customerStatus(Long id) throws SQLException;

	List<OrdersTrackingVO> getFirstOrder(Long id) throws SQLException;
	
	

}
