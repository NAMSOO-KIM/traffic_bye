package traffic.bye.service;


import java.util.List;

import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersVO;

public interface OrdersService {
	
	int insertOrders(OrdersVO ordersVO) throws Exception;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws Exception;

	List<OrdersManageVO> getOrderList(long storeId) throws Exception;
	
	long getOrderId() throws Exception;
	
}
