package traffic.bye.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {
	
	@GetMapping("/detail")
	public String order() {
		return "item/itemsdetail";
	}
}