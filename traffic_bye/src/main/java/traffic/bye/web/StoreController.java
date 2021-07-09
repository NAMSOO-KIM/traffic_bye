package traffic.bye.web;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import traffic.bye.service.StoreService;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.StoreVO;

@Controller
@Slf4j
public class StoreController {
	
	
	
	@Autowired
	private StoreService storeService;
	
	
	@RequestMapping(value = "storeList", produces = "application/json; charset=UTF-8")
	public List<StoreVO> getStore() throws Exception {
		List<StoreVO> list = storeService.getStoreList();
		return list;
	}
	
	//to-do 링크만 따뒀음
	@GetMapping(value = "store/{id}")
	public ModelAndView itemDetail(@PathVariable("id") long id, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeDetail");
		return mav;
	}
	
	@GetMapping("/store/{id}/addProduct")
	public String addProduct() {
		return "store/addProduct";
	}
	
	@PostMapping("/store/{id}/addProduct")
	public String addProductProc(ItemAddVO itemAddVO, MultipartHttpServletRequest mreq) {
		log.info("HI~");
		log.info(itemAddVO.toString());
		Map<String, MultipartFile> files = mreq.getFileMap();
		Set<String> filenames = files.keySet();
		for(String fileName : filenames) {
			log.info("파라미터명 : {}, 파일 이름 : {}, 파일 크기 : {}", new Object[] {fileName, files.get(fileName).getOriginalFilename(), files.get(fileName).getSize()});
		}
		return "";
	}
	
}
