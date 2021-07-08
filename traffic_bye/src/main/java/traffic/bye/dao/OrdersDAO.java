package traffic.bye.dao;

import java.sql.SQLException;
import java.util.List;

import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersDAO {
	
	int insertOrders(OrdersVO ordersVO) throws SQLException;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws SQLException;

	List<OrdersManageVO> getOrderList(long storeId) throws SQLException;
	
	long getOrderId() throws SQLException; 
	
}
