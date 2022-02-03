package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerMovieWishList;

@Mapper
public interface CustomerDao {

	Customer getCustomerByNo(int no);
	Customer getCustomerById(String id);
	Customer getCustomerByEmail(String email);
	Customer getCustomerByPhoneNumber(String phoneNumber);
	Customer getCustomerByNickName(String nickName);
	
	List<CustomerMovieWishList> getCustomerMovieWishListByCustomerNo(int customerNo); 
	
	void deleteCustomerByNo(int no);
	void insertCustomer(Customer customer);
	void updateCustomer(Customer customer);
	
	int countCustomerMovieWishListByMovieNo(int movieNo);
	void insertCustomerMovieWishListByMovieNo(CustomerMovieWishList wishList);
	
}
