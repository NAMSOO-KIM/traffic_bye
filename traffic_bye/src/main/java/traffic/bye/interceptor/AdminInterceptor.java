package traffic.bye.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.LoginInfo;

@Slf4j
public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Map<?, ?> pathVariables = (Map<?, ?>)request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		String id = (String)pathVariables.get("id");
		Long parseId = Long.parseLong(id);
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
		if(loginInfo.getStoreId() == parseId) return true;
		response.sendRedirect(request.getContextPath());
		return false;
	}

}
