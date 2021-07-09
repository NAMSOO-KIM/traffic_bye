package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersDAO {
	
	int insertOrders(OrdersVO ordersVO) throws SQLException;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws SQLException;

	List<OrdersManageVO> getOrderList(long storeId) throws SQLException;
	
	long getOrderId() throws SQLException; 
	
	List<OrdersDetailListVO> getOrdersDetailList(long orderId) throws SQLException;

	void orderAccept(long orderId) throws SQLException;

	void orderReady(long orderId) throws SQLException;

	void orderReceipt(long orderId) throws SQLException;

	List<OrdersListVO> getOrdersList(long memberId) throws SQLException;

	OrdersTrackingVO getOrderTrackingList(long orderId) throws SQLException;

}
