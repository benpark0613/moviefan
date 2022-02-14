package com.jhta.moviefan.dto;

public class ShowSeatDetailDto {

	private int no;
	private int showNo;
	private int seatNo;
	private int bookingNo;
	private String isReserved;
	private int hallNo;
	private String row;
	private int column;
	private String type;
	private int section;
	
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

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public int getColumn() {
		return column;
	}

	public void setColumn(int column) {
		this.column = column;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	@Override
	public String toString() {
		return "ShowSeatDetailDto [no=" + no + ", showNo=" + showNo + ", seatNo=" + seatNo + ", bookingNo=" + bookingNo
				+ ", isReserved=" + isReserved + ", hallNo=" + hallNo + ", row=" + row + ", column=" + column
				+ ", type=" + type + ", section=" + section + "]";
	}
	
	
}
