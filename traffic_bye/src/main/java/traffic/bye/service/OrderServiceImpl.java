package traffic.bye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.OrdersDAO;
import traffic.bye.vo.OrdersDetailVO;
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
		// TODO Auto-generated method stub
		return ordersDAO.insertOrdersDetail(ordersDetailVO);
	}
	
	
	
	
}
