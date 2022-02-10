package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerCinemaFavorites;
import com.jhta.moviefan.vo.CustomerMovieWishList;

@Mapper
public interface CustomerDao {

	Customer getCustomerByNo(int no);
	Customer getCustomerById(String id);
	Customer getCustomerByEmail(String email);
	Customer getCustomerByPhoneNumber(String phoneNumber);
	Customer getCustomerByNickName(String nickName);
	
	void deleteCustomerByNo(int no);
	void insertCustomer(Customer customer);
	void updateCustomer(Customer customer);

	// 찜한 영화 전체 데이터
	List<CustomerMovieWishList> getAllCustomerMovieWishListByCustomerNo(int customerNo);
	// 찜한 영화 페이지네이션
	int getCustomerMovieWishListTotalRows(CriteriaMyAccount criteriaMyAccount);
	// 찜한 영화 검색
	List<CustomerMovieWishList> searchCustomerMovieWishList(CriteriaMyAccount criteriaMyAccount);
	// 주성
	int countCustomerMovieWishListByMovieNo(int movieNo);
	void insertCustomerMovieWishListByMovieNo(CustomerMovieWishList wishList);
	void deleteCustomerMovieWishListByMovieNo(CustomerMovieWishList wishList);
	
	// my영화관
	List<CustomerCinemaFavorites> getCustomerCinemaFavoritesByCustomerNo(int customerNo);
	void insertMyCinema(CustomerCinemaFavorites customerCinemaFavorites);
	void deleteMyCinema(CustomerCinemaFavorites customerCinemaFavorites);
}
