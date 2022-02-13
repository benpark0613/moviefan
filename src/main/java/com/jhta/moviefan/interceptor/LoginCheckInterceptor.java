package com.jhta.moviefan.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.http.ResponseCookie;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

/**
 * 로그인 여부를 체크하는 인터셉터
 * @author psg
 *
 */
public class LoginCheckInterceptor implements HandlerInterceptor {
public static Logger logger = LogManager.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		MethodParameter[] methodParameters = handlerMethod.getMethodParameters();
		
		// 요청핸들러메소드에 @LoginedCustomer 파라미터가 있는가? > 없으면 해당 요청핸들러 메소드를 사용하는데 사용자 정보가 필요없다는 것이니까 true로 보내면 된다.
		boolean hasLoginedCustomer = false;
		for (MethodParameter methodParameter : methodParameters) {
			if (methodParameter.hasParameterAnnotation(LoginedCustomer.class)) {
				hasLoginedCustomer = true;
				break;
			}
		}
		
		logger.info("로그인 체크 여부: " + hasLoginedCustomer);

		// 파라미터 검사 후 여기서 사용자 정보가 필요없는 요청핸들러 메소드는 true로 값을 바꿔서 보내준다.
		if (!hasLoginedCustomer) {
			return true;
		}
		// 사용자 정보가 필요한 요청핸들러 메소드를 요청한 경우, 세션에 사용자 정보가 있는지 확인한다.
		// 사용자 정보가 세션에 없는데 사용자 정보가 필요한 요청핸들러 메소드를 요청함 > LoginErrorException
		// 사용자 정보가 세션에 있고 사용자 정보가 필요한 요청핸들러 메소드를 요청함 > 해당 요청핸들러 메소드 실행
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		if (customer == null) {
			response.sendRedirect("/error/login/loginform");
			return false;
		}
		
		return true;
	}
}
