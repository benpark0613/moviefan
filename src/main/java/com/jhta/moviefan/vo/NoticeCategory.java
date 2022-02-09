package com.jhta.moviefan.vo;

public class NoticeCategory {

	private int categoryNo;
	private String name;
	
	public NoticeCategory() {}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "NoticeCategory [categoryNo=" + categoryNo + ", name=" + name + "]";
	}

}
