package traffic.bye.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import traffic.bye.service.StoreService;
import traffic.bye.vo.StoreVO;

@Controller
public class StoreController {
	
	
	
	@Autowired
	private StoreService storeService;
	
	
	@RequestMapping(value = "storeList", produces = "application/json; charset=UTF-8")
	public List<StoreVO> getStore() throws Exception {
		List<StoreVO> list = storeService.getStoreList();
		return list;
	}
	
}
