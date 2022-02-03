package com.jhta.moviefan.vo;

public class CustomerMovieWishList {

	private int customerNo;
	private int movieNo;
	
	public CustomerMovieWishList() {}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	@Override
	public String toString() {
		return "CustomerMovieWishList [customerNo=" + customerNo + ", movieNo=" + movieNo + "]";
	}

	
	

}
