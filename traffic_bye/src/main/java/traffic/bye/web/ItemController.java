package traffic.bye.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import traffic.bye.service.ItemService;
import traffic.bye.service.StoreService;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.StoreVO;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StoreService storeService;
	

	@RequestMapping(value = "itemList", produces = "application/json; charset=UTF-8")
	public List<ItemVO> getInstructor() throws Exception {
		List<ItemVO> list = itemService.getItemList();
		//ItemVO itemVO = list.get(0);
		
		//System.out.println(itemVO.getDetail());
		return list;
	}
	
	@GetMapping(value = "items/{id}")
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		// 특정 아이템 정보, 해당하는 매장 정보 가져오기
		try {
			
			ItemVO item = itemService.getItem(id);
			mav.addObject("item",item);
			
			//매장 id 조회
			long store_id=item.getStore_id();
			StoreVO store=storeService.getStore(store_id);
			mav.addObject("store", store);
			
			//관련 상품들 추천(카테고리가 같은 아이템 모두 가져옴)
			long category_id = item.getCategory_id();
			HashMap<String, Object> map = new HashMap<>();
			map.put("category_id",category_id);
			map.put("id",id);
			
			List<ItemVO> RelatedItemlist = itemService.getRelatedItemList(map);
			mav.addObject("RelatedItemlist",RelatedItemlist);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("productDetail");
		return mav;
	}
	
}
