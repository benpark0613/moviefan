package com.jhta.moviefan.argumentResolver;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.utils.SessionUtils;

/**
 * HandlerMethodArgumentResolver : 요청핸들러메소드의 매개변수를 분석해서 해당 매개변수에 적절한 값을 전달하는 객체
 * 메소드
 * 		boolean supportsParameter(MethodParameter parameter)
 * 			- 이 메소드가 true를 반환해야 resolveArgument() 메소드가 실행된다.
 * 		Object resolveArgument( ... )
 * 			- 이 메소드 반환하는 값이 요청핸들러 메소드의 매개변수로 전달된다.
 * @author sg2po
 *
 */
public class LoginedCustomerArgumentResolver implements HandlerMethodArgumentResolver {
	
	static final Logger logger = LogManager.getLogger(LoginedCustomerArgumentResolver.class);

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		logger.info("@Logined_Customer 어노테이션을 가지고 있는가? " + parameter.hasParameterAnnotation(LoginedCustomer.class));
		logger.info("매개변수의 클래스이름: " + parameter.getParameterType().getName());
		logger.info("매개변수의 이름: " + parameter.getParameterName());
		return parameter.hasParameterAnnotation(LoginedCustomer.class);
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		return SessionUtils.getAttribute("LOGINED_CUSTOMER");
	}

	
}
