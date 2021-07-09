package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.OrdersDAO;
import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersVO;

@Slf4j
@Service
public class OrderServiceImpl implements OrdersService{
	
	@Autowired
	@Qualifier(value="ordersDAO")
	private OrdersDAO ordersDAO;

	@Override
	public int insertOrders(OrdersVO ordersVO) throws Exception {
		return ordersDAO.insertOrders(ordersVO);
	}

	@Override
	public int insertOrdersDetail(OrdersDetailVO ordersDetailVO) throws Exception {
		return ordersDAO.insertOrdersDetail(ordersDetailVO);
	}

	@Override
	public List<OrdersManageVO> getOrderList(long storeId) throws Exception {
		return ordersDAO.getOrderList(storeId);
	}

	@Override
	public long getOrderId() throws Exception {
		return ordersDAO.getOrderId();
	}

	@Override
	public List<OrdersDetailListVO> getOrdersDetailList(long orderId) throws Exception {
		return ordersDAO.getOrdersDetailList(orderId);
	}

	@Override
	public void orderAccept(long orderId) throws Exception {
		  ordersDAO.orderAccept(orderId);
	}

	@Override
	public void orderReady(long orderId) throws Exception {
		 ordersDAO.orderReady(orderId);
	}

	@Override
	public void orderReceipt(long orderId) throws Exception {
		 ordersDAO.orderReceipt(orderId);
	}

	@Override
	public List<OrdersListVO> getOrdersList(long memberId) throws Exception {
		return ordersDAO.getOrdersList(memberId);
	}

	@Override
	public OrdersTrackingVO getOrderTrackingList(long orderId) throws Exception {
		return ordersDAO.getOrderTrackingList(orderId);
	}

	
	
	
	
}
