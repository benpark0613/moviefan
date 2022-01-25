package com.jhta.moviefan.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Customer;

@Mapper
public interface CustomerDao {

	Customer getCustomerByNo(int no);
	Customer getCustomerById(String id);
	Customer getCustomerByEmail(String email);
	Customer getCustomerByPhoneNumber(String phoneNumber);
	Customer getCustomerByNickName(String nickName);
	void deleteCustomerByNo(int no);
	void insertCustomer(Customer customer);
	void updateCustomerByNo(Customer customer);
}
