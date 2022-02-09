
package com.jhta.moviefan.exceptionhandler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.AdminErrorException;
import com.jhta.moviefan.exception.CustomException;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.MovieErrorException;
import com.jhta.moviefan.exception.MyCinemaErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.exception.RestRegisterErrorException;

/**
 * 예외처리를 담당하는 controllerAdvice다.
 * 던져진 예외는 모두 여기로 모여서 처리된다.
 * 예외처리는 에러 페이지(jsp 페이지)를 보여주거나 / 오류 메세지(json)를 보내줘야 한다.
 * 
 * serverError(500번), notFoundError(404)는 dispatcherServlet으로 요청이 오기전 filter에서 예외처리 한다. (web.xml에 정의)
 * 로그인 여부와 관련된 예외처리는 인터셉터를 통해 처리된다. (context-web.xml 인터셉터 등록)
 * @author sg2po
 */
@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	// rest 응답
	@ExceptionHandler(RestLoginErrorException.class)
	public @ResponseBody ResponseDto<?> handleRestLoginErrorException(RestLoginErrorException e) {
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	@ExceptionHandler(RestRegisterErrorException.class)
	public @ResponseBody ResponseDto<?> handleRestRegisterErrorException(RestRegisterErrorException e) {
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	@ExceptionHandler(MovieErrorException.class)
	public @ResponseBody ResponseDto<?> handleMovieErrorException(MovieErrorException e) {
		e.printStackTrace();
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	@ExceptionHandler(MyCinemaErrorException.class)
	public @ResponseBody ResponseDto<?> handleRestMyCinemaErrorException(MyCinemaErrorException e) {
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	// 에러페이지 응답
	@ExceptionHandler(AdminErrorException.class)
	public String handleAdminErrorException(AdminErrorException e) {
		return "member/loginform";
	}
	
	@ExceptionHandler(LoginErrorException.class)
	public String handleLoginErrorException(LoginErrorException e) {
		e.printStackTrace();
		return "member/loginform";
	}
	
	@ExceptionHandler(CustomException.class)
	public String handleCustomException(CustomException e) {
		e.printStackTrace();
		return "error/customerror";
	}

	/*
	 * @ExceptionHandler(DataAccessException.class) public String
	 * handleDataAccessException(DataAccessException e) {
	 * 
	 * return "error/databaseerror"; }
	 */

	/*
	 * @ExceptionHandler(Exception.class) public String handleException(Exception e)
	 * { e.printStackTrace(); return "error/servererror"; }
	 */
}
