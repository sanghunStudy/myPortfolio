package kr.ac.kopo.utill;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();//파라미터에서 받는 request에서 세션을 얻어온다.
		
		
				if(session.getAttribute("user") == null) {
					response.sendRedirect("/kopo/login");
					return false;
				}
					return true;
	}
	

}
