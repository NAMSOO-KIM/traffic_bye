package traffic.bye.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.service.ItemService;
import traffic.bye.vo.ItemVO;



@RestController
public class TrafficByeController {
	
	@Autowired
	private ItemService itemService;
	
	
	@RequestMapping(value = "itemList", produces = "application/json; charset=UTF-8")
	public List<ItemVO> getInstructor() throws Exception {
		List<ItemVO> list = itemService.getItemList();
		//ItemVO itemVO = list.get(0);
		
		//System.out.println(itemVO.getDetail());
		return list;
	}
	
	/*
	@GetMapping(value = "earlybird")
	public ModelAndView earlybird() throws Exception {
		return new ModelAndView("earlybird");
	}
	*/
	
}
