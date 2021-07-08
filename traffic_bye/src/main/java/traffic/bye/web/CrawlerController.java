package traffic.bye.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.service.CrawlerService;


@Controller
public class CrawlerController {
	
	@Autowired
	CrawlerService crawlerService;
	
	@GetMapping(value="/crawler")
	public ModelAndView crawler(HttpServletRequest request, HttpServletResponse response) {
		//HttpSession session = request.getSession(true);
		//String user_id = (String)session.getAttribute("user_id");
		//ModelAndView mav = new ModelAndView();		
		try {
			
			//crawlerService.insert("https://learn.dict.naver.com/endic/today/words.nhn?targetDate="+timedate,user_id);
			//crawlerService.insert("https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000801");
			//crawlerService.insert("https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00080102");
			//crawlerService.insert("https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00080103");
			//crawlerService.insert("https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000804#itemFilterTop");
			crawlerService.insert("https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00090101#itemFilterTop");
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return null;
	}
}
