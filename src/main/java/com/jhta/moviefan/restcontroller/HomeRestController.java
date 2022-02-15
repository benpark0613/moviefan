package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.HomeTrailerDto;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

@RestController
@RequestMapping("/rest/home")
public class HomeRestController {
	
	static final Logger LOGGER = LogManager.getLogger(HomeRestController.class);
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;


	// 일반 로그인 요청 처리
	@PostMapping("/logincheck")
	public ResponseDto<String> checkPassword(String id, String password) {
		ResponseDto<String> response = new ResponseDto<String>();
		
		Customer customer = customerService.login(id, password);
		SessionUtils.addAttribute("LOGINED_CUSTOMER", customer);
		response.setStatus("OK");
		
		return response;
	}
	
	// 회원가입
	@PostMapping("/register")
	public ResponseDto<String> register(@RequestBody CustomerRegisterForm form) {
		ResponseDto<String> response = new ResponseDto<String>();
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		
		System.out.println("암호화 전 : " + customer.getPassword());
		customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
		customer.setLoginType("NORMAL");
		System.out.println("암호화 후 " + customer.getPassword());
		
		customerService.registerCustomer(customer);
		response.setStatus("OK");
		
		return response;
	}
	
	// 회원정보수정
	@PostMapping("/update")
	public ResponseDto<String> update(@LoginedCustomer Customer customer, @RequestBody CustomerRegisterForm form) {
		ResponseDto<String> response = new ResponseDto<String>();
		Customer newInfo = new Customer();
		
		BeanUtils.copyProperties(form, newInfo);
		
		customerService.updateCustomerInfo(customer, newInfo);
		response.setStatus("OK");
		
		return response;
	}
	
	// 아이디 찾기
	@PostMapping("/findid")
	public ResponseDto<String> findId(String name, String email) {
		ResponseDto<String> response = new ResponseDto<String>();
		Customer savedCustomer = customerService.getCustomerByEmail(email);
		
		if (savedCustomer == null) {
			throw new RestLoginErrorException("가입되지 않은 이메일입니다. 가입 후 이용해주세요.");
		}
		if (!savedCustomer.getName().equals(name)) {
			throw new RestLoginErrorException("사용자 정보가 일치하지 않습니다. 다시 확인해주세요.");
		}
		
		response.setStatus("OK");
		
		return response;
	}
	
	@PostMapping("/findpassword")
	public ResponseDto<String> findPassword(String name, String email, String id) {
		ResponseDto<String> response = new ResponseDto<String>();
		Customer savedCustomer = customerService.getCustomerByEmail(email);
		
		if (savedCustomer == null) {
			throw new RestLoginErrorException("가입되지 않은 이메일입니다. 가입 후 이용해주세요.");
		}
		if (!savedCustomer.getName().equals(name) || !savedCustomer.getId().equals(id)) {
			throw new RestLoginErrorException("사용자 정보가 일치하지 않습니다. 다시 확인해주세요.");
		}
		
		response.setStatus("OK");
		response.setItem(List.of("회원가입이 완료되었습니다."));
		
		return response;
	}
	
	@GetMapping("trailer")
	public ResponseDto<HomeTrailerDto> homeTrailer(){
		ResponseDto<HomeTrailerDto> response = new ResponseDto<>();
		List<HomeTrailerDto> movie = movieService.getHomeTrailer();
		
		response.setItem(movie);
		
		return response;
	}
	
	
}




















