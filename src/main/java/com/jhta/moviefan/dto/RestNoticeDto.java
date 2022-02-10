package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.pagination.Pagination;

public class RestNoticeDto {

	private String status;
	private String error;
	private List<NoticeDto> noticeDtos;
	private Pagination pagination;
	
	public RestNoticeDto() {}
	
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
	public List<NoticeDto> getNoticeDtos() {
		return noticeDtos;
	}
	public void setNoticeDtos(List<NoticeDto> noticeDtos) {
		this.noticeDtos = noticeDtos;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	@Override
	public String toString() {
		return "RestNoticeDto [status=" + status + ", error=" + error + ", noticeDtos=" + noticeDtos + ", pagination="
				+ pagination + "]";
	}
	
	
}
