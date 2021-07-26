package traffic.bye.service;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.UserDetailsVO;

@Service("webSecurity")
@Slf4j
public class WebSecurity {
	public boolean checkUserId(Authentication authentication, Long id) {
		UserDetailsVO vo = (UserDetailsVO)authentication.getPrincipal();
		if(vo == null) return false;
		log.info("이거 들어오냐? 로그인한 유저 아이디 : {} , 접근하려는 곳 아이디 : {}", new Object[] {vo.getId(), id});
		return vo.getId() == id;
	}
	
	public boolean checkAdminId(Authentication authentication, Long id) {
		log.info("hi~ 관리자 맞는지 확인");
		UserDetailsVO vo = (UserDetailsVO)authentication.getPrincipal();
		if(vo == null) return false;
		Long storeId = vo.getStoreId();
		if(storeId == null) return false;
		return storeId == id; 
	}
}
