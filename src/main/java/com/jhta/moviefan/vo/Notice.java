package com.jhta.moviefan.vo;

import java.util.Date;

public class Notice {

	private int no;
	private String title;
	private String content;
	private Date createdDate;
	private Date updatedDate;
	private int viewCount;
	private String isDeleted;
	private int categoryNo;
	private int customerNo;
	
	public Notice() {}

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

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", viewCount=" + viewCount + ", isDeleted=" + isDeleted
				+ ", categoryNo=" + categoryNo + ", customerNo=" + customerNo + "]";
	}
	
	
	
}
