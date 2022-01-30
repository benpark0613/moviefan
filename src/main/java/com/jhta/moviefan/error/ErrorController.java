package com.jhta.moviefan.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;

@Controller
@RequestMapping("/error")
public class ErrorController {

	@RequestMapping("/login/loginform")
	public String loginError() {
		throw new LoginErrorException("로그인 후 사용가능한 서비스입니다.");
	}
	
	@RequestMapping("/login/rest")
	public ResponseDto<?> rest() {
		throw new RestLoginErrorException("로그인 후 사용가능한 서비스입니다.");
	}
	
}
