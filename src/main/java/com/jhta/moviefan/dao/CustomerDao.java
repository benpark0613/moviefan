package com.jhta.moviefan.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Customer;

@Mapper
public interface CustomerDao {

	Customer getCustomer(Map<String, Object> map);
	Customer getCustomerByNo(int no);
	void deleteCustomerByNo(int no);
	void insertCustomer(Customer customer);
	void updateCustomerByNo(Customer customer);
}
