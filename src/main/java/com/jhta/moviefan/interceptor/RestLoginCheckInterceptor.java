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

public class RestLoginCheckInterceptor implements HandlerInterceptor {
	
	private static Logger logger = LogManager.getLogger(RestLoginCheckInterceptor.class);

	 @Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		MethodParameter[] methodParameters = handlerMethod.getMethodParameters();
		
		boolean hasLoginedCustomer = false;
		for (MethodParameter methodParameter : methodParameters) {
			if (methodParameter.hasParameterAnnotation(LoginedCustomer.class)) {
				hasLoginedCustomer = true;
				break;
			}
		}
		
		logger.info("로그인 체크 여부: " + hasLoginedCustomer);
		
		// 요청핸들러메소드의 파라미터값에 @loginedCustomer가 없으면 사용자 정보가 필요한게 아니까 그냥 보낸다.
		// 있으면 세션에 로그인 정보가 있는지 확인한다.
		if (!hasLoginedCustomer) {
			return true;
		}
		
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		if (customer == null) {
			response.sendRedirect("/error/login/rest");
			return false;
		}
		
		return true;
		
		
	}
}
