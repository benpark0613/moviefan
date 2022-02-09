package com.jhta.moviefan.form;

import org.springframework.web.multipart.MultipartFile;

public class NoticeInsertForm {
	
	private String title;
	private String content;
	private int customerNo;
	private int categoryNo;
	private MultipartFile upfile;
	
	public NoticeInsertForm() {}

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

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public MultipartFile getUpfile() {
		return upfile;
	}

	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}

	@Override
	public String toString() {
		return "NoticeInsertForm [title=" + title + ", content=" + content + ", customerNo=" + customerNo
				+ ", categoryNo=" + categoryNo + ", upfile=" + upfile + "]";
	}

	
	
}
