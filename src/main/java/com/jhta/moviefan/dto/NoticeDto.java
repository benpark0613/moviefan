package com.jhta.moviefan.dto;

import java.util.Date;

public class NoticeDto {

	private int noticeNo;
	private String title;
	private String content;
	private Date createdDate;
	private Date updatedDate;
	private int viewCount;
	private String isDeleted;
	private int categoryNo;
	private int categoryName;
	private int customerNo;
	private String image;
	
	public NoticeDto() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public int getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(int categoryName) {
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
		return "NoticeDto [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", createdDate="
				+ createdDate + ", updatedDate=" + updatedDate + ", viewCount=" + viewCount + ", isDeleted=" + isDeleted
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", customerNo=" + customerNo
				+ ", image=" + image + "]";
	}
	
}
