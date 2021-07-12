package traffic.bye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.ItemDAO;
import traffic.bye.dao.OrdersDAO;
import traffic.bye.dao.StoreDAO;
import traffic.bye.vo.CartChangeQuantityVO;
import traffic.bye.vo.DeleteQuantityVO;
import traffic.bye.vo.OrdersDetailListParmVO;
import traffic.bye.vo.OrdersDetailListVO;
import traffic.bye.vo.OrdersDetailStatusParamVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.OrdersListVO;
import traffic.bye.vo.OrdersManageVO;
import traffic.bye.vo.OrdersTrackingVO;
import traffic.bye.vo.OrdersUpdateParamVO;
import traffic.bye.vo.OrdersVO;
import traffic.bye.vo.StoreStatusVO;

@Slf4j
@Service
public class OrderServiceImpl implements OrdersService {

	@Autowired
	@Qualifier(value = "ordersDAO")
	private OrdersDAO ordersDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	


	@Transactional
	@Override
	public int makeOrder(OrdersVO ordersVO, List<OrdersDetailVO> ordersDetails) throws Exception {
		// TODO Auto-generated method stub
		int row = 0;
		for(OrdersDetailVO ordersDetailVO : ordersDetails) {
			row += itemDAO.updateStock(ordersDetailVO);
		}
		if(row != ordersDetails.size()) throw new Exception();
		int orderId =  ordersDAO.insertOrders(ordersVO);
		for(OrdersDetailVO ordersDetailVO : ordersDetails) {
			ordersDetailVO.setOrdersId(orderId);
			ordersDAO.insertOrdersDetail(ordersDetailVO);
		}
		return orderId;
	}

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
	public List<OrdersDetailListVO> getOrdersDetailList(OrdersDetailListParmVO vo) throws Exception {
		return ordersDAO.getOrdersDetailList(vo);
	}

	@Override
	public void orderAccept(OrdersUpdateParamVO vo) throws Exception {
		OrdersDetailStatusParamVO paramVO = new OrdersDetailStatusParamVO();
		paramVO.setDetailStatus(0);
		paramVO.setOrderId(vo.getOrderId());
		ordersDAO.orderAccept(vo);
		ordersDAO.customerStatus(vo.getOrderId());

	}

	@Override
	public void orderReady(OrdersUpdateParamVO vo) throws Exception {
		OrdersDetailStatusParamVO paramVO = new OrdersDetailStatusParamVO();
		paramVO.setDetailStatus(1);
		paramVO.setOrderId(vo.getOrderId());
		ordersDAO.orderReady(vo);
		ordersDAO.customerStatus(vo.getOrderId());
	}

	@Override
	public void orderReceipt(OrdersUpdateParamVO vo) throws Exception {
		OrdersDetailStatusParamVO paramVO = new OrdersDetailStatusParamVO();
		paramVO.setDetailStatus(2);
		paramVO.setOrderId(vo.getOrderId());
		ordersDAO.orderReceipt(vo);
		ordersDAO.customerStatus(vo.getOrderId());

	}

	@Override
	public List<OrdersListVO> getOrdersList(long memberId) throws Exception {
		return ordersDAO.getOrdersList(memberId);
	}

	@Override
	public List<OrdersTrackingVO> getOrderTrackingList(long orderId) throws Exception {
		return ordersDAO.getOrderTrackingList(orderId);
	}

	@Override
	public void changeQuantity(CartChangeQuantityVO vo) throws Exception {
		ordersDAO.changeQuantity(vo);
	}

	@Override
	public void deleteQuantity(DeleteQuantityVO vo) throws Exception {
		ordersDAO.deleteQuantity(vo);
	}

	@Override
	public List<OrdersTrackingVO> getFirstOrder(Long id) throws Exception {
		return ordersDAO.getFirstOrder(id);
	}
}
