package com.jhta.moviefan.vo;

public class CinemaSeat {

	private int no;
	private int hallNo;
	private String row;
	private int column;
	private String type;
	private int section;
	
	public CinemaSeat() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
		return "CinemaSeat [no=" + no + ", hallNo=" + hallNo + ", row=" + row + ", column=" + column + ", type=" + type
				+ ", section=" + section + "]";
	}

	
	
	
}
