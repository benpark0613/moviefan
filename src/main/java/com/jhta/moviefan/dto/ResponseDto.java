package com.jhta.moviefan.dto;

import java.util.List;

public class ResponseDto<T> {

	private String status;
	private String error;
	private List<T> item;
	
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
	public List<T> getItem() {
		return item;
	}
	public void setItem(List<T> item) {
		this.item = item;
	}
	
	@Override
	public String toString() {
		return "ResponseDto [status=" + status + ", error=" + error + ", item=" + item + "]";
	}
	
	
}
