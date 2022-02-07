package com.jhta.moviefan.vo;

public class CustomerCinemaFavorites {
	
	private int customerNo;
	private int cinemaNo;
	
	public CustomerCinemaFavorites() {}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getCinemaNo() {
		return cinemaNo;
	}

	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}

	@Override
	public String toString() {
		return "CustomerCinemaFavorites [customerNo=" + customerNo + ", cinemaNo=" + cinemaNo + "]";
	}


}
