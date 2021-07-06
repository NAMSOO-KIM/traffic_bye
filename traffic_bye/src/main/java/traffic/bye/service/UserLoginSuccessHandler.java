package traffic.bye.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.UserDetailsVO;

@Service("userLoginSuccessHandler")
@Slf4j
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		UserDetailsVO vo = (UserDetailsVO)authentication.getPrincipal();
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", new LoginInfo(vo.getId(), vo.getUsername(), null));
		
		//로그인 버튼을 바로 누른 경우 이전 페이지 가져오기
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
			log.info("이전 페이지 있음!! {}", prevPage);
		}
		
		String uri = "/";
		// 있을 경우 URI 등 정보를 가져와서 사용
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
			// 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
			requestCache.removeRequest(request, response);
			log.info("이전 접근 내역 있냐 {}", uri);
		} else if(prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
			log.info("없으면 {}", uri);
		}
		response.sendRedirect(uri);
	}
}
