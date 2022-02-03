package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.pagination.PaginationMyAccount;

public class RestMovieWishListDto {

	private String status;
	private String error;
	private PaginationMyAccount paginationMyAccount; 
	private List<?> item;
	
	public RestMovieWishListDto() {}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public PaginationMyAccount getPaginationMyAccount() {
		return paginationMyAccount;
	}

	public void setPaginationMyAccount(PaginationMyAccount paginationMyAccount) {
		this.paginationMyAccount = paginationMyAccount;
	}

	public List<?> getItem() {
		return item;
	}

	public void setItem(List<?> item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "RestMovieWishListDto [status=" + status + ", error=" + error + ", paginationMyAccount="
				+ paginationMyAccount + ", item=" + item + "]";
	}

	
	
	
	
}
