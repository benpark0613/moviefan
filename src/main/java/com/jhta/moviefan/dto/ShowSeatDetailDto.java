package com.jhta.moviefan.dto;

public class ShowSeatDetailDto {

	private int no;
	private int showNo;
	private int seatNo;
	private int bookingNo;
	private String isReserved;
	private int hallNo;
	private String seatRow;
	private int seatColumn;
	private String seatType;
	private int seatSection;
	
	public ShowSeatDetailDto() {}

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

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}

	public String getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}

	public int getSeatColumn() {
		return seatColumn;
	}

	public void setSeatColumn(int seatColumn) {
		this.seatColumn = seatColumn;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public int getSeatSection() {
		return seatSection;
	}

	public void setSeatSection(int seatSection) {
		this.seatSection = seatSection;
	}

	@Override
	public String toString() {
		return "ShowSeatDetailDto [no=" + no + ", showNo=" + showNo + ", seatNo=" + seatNo + ", bookingNo=" + bookingNo
				+ ", isReserved=" + isReserved + ", hallNo=" + hallNo + ", seatRow=" + seatRow + ", seatColumn="
				+ seatColumn + ", seatType=" + seatType + ", seatSection=" + seatSection + "]";
	}

	
	
}
