package traffic.bye.service;


import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersService {
	
	int insertOrders(OrdersVO ordersVO) throws Exception;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws Exception;
	
}
