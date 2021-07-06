package traffic.bye.dao;

import java.sql.SQLException;

import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersDAO {
	
	int insertOrders(OrdersVO ordersVO) throws SQLException;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws SQLException;
	
}
