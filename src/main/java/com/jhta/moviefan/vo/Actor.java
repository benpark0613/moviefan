package com.jhta.moviefan.vo;

public class Actor {

	private int no;
	private String name;
	
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

	@Override
	public String toString() {
		return "Actor [no=" + no + ", name=" + name + "]";
	}
	
	
}
