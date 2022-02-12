package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.pagination.Pagination;

public class RestMyCommentDto {

	private String status;
	private String error;
	private List<MyAccountCustomerCommentDto> dtos;
	private Pagination pagination;
	
	public RestMyCommentDto() {}
	
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
	public List<MyAccountCustomerCommentDto> getDtos() {
		return dtos;
	}
	public void setDtos(List<MyAccountCustomerCommentDto> dtos) {
		this.dtos = dtos;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	@Override
	public String toString() {
		return "RestMyCommentDto [status=" + status + ", error=" + error + ", dtos=" + dtos + ", pagination="
				+ pagination + "]";
	}
	
	
}
