package com.jhta.moviefan.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeDto {

	// notice
	private int no;
	private String title;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date updatedDate;
	private int viewCount;
	private String isDeleted;
	// 카테고리
	private int categoryNo;
	private String categoryName;
	// 관리자 식별용
	private int customerNo;
	// 이미지 파일 이름
	private String image;
	
	public NoticeDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "RestNoticeDto [no=" + no + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", viewCount=" + viewCount + ", isDeleted=" + isDeleted
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", customerNo=" + customerNo
				+ ", image=" + image + "]";
	}

	
}
