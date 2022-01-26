package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dao.CustomerDao;
import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private MovieDao movieDao;
	
	
	public Customer registerCustomer(Customer customer) {
		Customer savedCustomer = customerDao.getCustomerById(customer.getId());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 아이디입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByEmail(customer.getEmail());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 이메일입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByNickName(customer.getNickName());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 닉네임입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByPhoneNumber(customer.getPhoneNumber());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 전화번호입니다.");
		}
		
		customerDao.insertCustomer(customer);
		
		return customer;
	}
	
	public Customer login(String id, String password) {
		Customer savedCustomer = customerDao.getCustomerById(id);
		
		if (savedCustomer == null) {
			throw new RuntimeException("사용자가 존재하지 않습니다..");
		}
		if (!"NORMAL".equals(savedCustomer.getLoginType())) {
			throw new RuntimeException("사이트에 가입된 사용자가 아닙니다.");
		}
		if ("Y".equals(savedCustomer.getIsWithdrawal())) {
			throw new RuntimeException("탈퇴처리된 사용자입니다.");
		}
		if (!password.equals(savedCustomer.getPassword())) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		return savedCustomer;
	}

	public List<Movie> getCustomerMovieWishList(int customerNo) {
		List<CustomerMovieWishList> customerMovieWishList = customerDao.getCustomerMovieWishListByCustomerNo(customerNo);
		
		List<Movie> movies = new ArrayList<Movie>();

		for (CustomerMovieWishList item : customerMovieWishList) {
			Movie movie = movieDao.getMovieByNo(item.getMovieNo());
			movies.add(movie);
		}
		
		return movies;
	}
	
}
