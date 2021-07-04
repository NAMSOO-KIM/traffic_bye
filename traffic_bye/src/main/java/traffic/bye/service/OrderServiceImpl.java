package traffic.bye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.OrdersDAO;

@Slf4j
@Service
public class OrderServiceImpl implements OrdersService{
	
	@Autowired
	@Qualifier(value="ordersDAO")
	private OrdersDAO ordersDAO;
	
	
	
	
}
