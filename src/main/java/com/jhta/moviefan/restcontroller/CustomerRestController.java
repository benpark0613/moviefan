package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.vo.Customer;

@RestController
@RequestMapping("/rest/member")
public class CustomerRestController {
	
//	@Autowired
//	private CustomerService customerService;
//
//	@PostMapping("/checkpassword")
//	public ResponseDto<String> checkPassword(@LoginedCustomer Customer customer, String id, String password) {
//		ResponseDto<String> response = new ResponseDto<String>();
//		
//		if (customer.getPassword() != password) {
//			response.setStatus("FAIL");
//			response.setError("비밀번호가 일치하지 않습니다.");
//			
//			return response;
//		}
//		
//		response.setStatus("OK");
//		response.setItem(List.of("modifyinfo"));
//		
//		return response;
//		
//	}
}
