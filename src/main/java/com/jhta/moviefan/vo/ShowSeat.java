package com.jhta.moviefan.vo;

public class ShowSeat {

	private int no;
	private int showNo;
	private int seatNo;
	private int bookingNo;
	private String isReserved;
	
	public ShowSeat() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getShowNo() {
		return showNo;
	}

	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public String getIsReserved() {
		return isReserved;
	}

	public void setIsReserved(String isReserved) {
		this.isReserved = isReserved;
	}

	@Override
	public String toString() {
		return "ShowSeat [no=" + no + ", showNo=" + showNo + ", seatNo=" + seatNo + ", bookingNo=" + bookingNo
				+ ", isReserved=" + isReserved + "]";
	}

	
	
	
}
