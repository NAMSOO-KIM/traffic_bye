package traffic.bye.service;


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
import traffic.bye.vo.StoreStatusVO;

public interface OrdersService {
	
	int insertOrders(OrdersVO ordersVO) throws Exception;
	
	int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws Exception;

	List<OrdersManageVO> getOrderList(long storeId) throws Exception;
	
	long getOrderId() throws Exception;
	
	List<OrdersDetailListVO> getOrdersDetailList(OrdersDetailListParmVO vo) throws Exception;

	void orderAccept(OrdersUpdateParamVO vo) throws Exception;

	void orderReady(OrdersUpdateParamVO vo) throws Exception;

	void orderReceipt(OrdersUpdateParamVO vo) throws Exception;

	List<OrdersListVO> getOrdersList(long memberId) throws Exception;

	List<OrdersTrackingVO> getOrderTrackingList(long orderId) throws Exception;

	void changeQuantity(CartChangeQuantityVO vo) throws Exception;

	void deleteQuantity(DeleteQuantityVO vo) throws Exception;
	
	int makeOrder(Long memberId, OrdersVO ordersVO, List<OrdersDetailVO> ordersDetails) throws Exception;

	List<OrdersTrackingVO> getFirstOrder(Long id) throws Exception;
}
