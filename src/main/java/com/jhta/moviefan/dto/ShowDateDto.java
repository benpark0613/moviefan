package com.jhta.moviefan.dto;

import java.util.Arrays;

public class ShowDateDto {

	private int year;
	private int month;
	private int[] dates;
	
	public ShowDateDto() {}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int[] getDates() {
		return dates;
	}

	public void setDates(int[] dates) {
		this.dates = dates;
	}

	@Override
	public String toString() {
		return "ShowDateDto [year=" + year + ", month=" + month + ", dates=" + Arrays.toString(dates) + "]";
	}
	
	
}
