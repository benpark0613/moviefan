package com.jhta.moviefan.vo;

public class Actor extends MoviePerson {

	private int no;
	private String name;
	private String nameEn;
	
	public Actor() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	@Override
	public String toString() {
		return "Actor [no=" + no + ", name=" + name + ", nameEn=" + nameEn + "]";
	}
	
	
	
}
