package com.jhta.moviefan.vo;

public class Genre {

	private int no;
	private String name;
	
	public Genre() {}

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
		return "Genre [no=" + no + ", name=" + name + "]";
	}
	
	
}
