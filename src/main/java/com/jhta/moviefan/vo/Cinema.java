package com.jhta.moviefan.vo;

public class Cinema {

	private int no;
	private String name;
	private String address;
	private int totalHalls;
	private int cityNo;
	
	public Cinema() {}

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalHalls() {
		return totalHalls;
	}

	public void setTotalHalls(int totalHalls) {
		this.totalHalls = totalHalls;
	}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	@Override
	public String toString() {
		return "Cinema [no=" + no + ", name=" + name + ", address=" + address + ", totalHalls=" + totalHalls
				+ ", cityNo=" + cityNo + "]";
	}
	
}
