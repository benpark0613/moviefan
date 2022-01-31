package com.jhta.moviefan.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

@RestController
@RequestMapping("/rest/home")
public class HomeRestController {
	
	@Autowired
	private CustomerService customerService;

	// 일반 로그인 요청 처리
	@PostMapping("/logincheck")
	public ResponseDto<String> checkPassword(String id, String password) {
		ResponseDto<String> response = new ResponseDto<String>();
		
		Customer customer = customerService.login(id, password);
		SessionUtils.addAttribute("LOGINED_CUSTOMER", customer);
		
		response.setStatus("OK");
		
		return response;
	}
}
