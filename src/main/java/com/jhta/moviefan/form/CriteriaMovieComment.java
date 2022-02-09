package com.jhta.moviefan.form;

public class CriteriaMovieComment {
	
	private int movieNo;
	private String sort;
	private String opt;
	private String value;
	private int beginIndex;
	private int endIndex;
	
	public CriteriaMovieComment() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "CriteriaMovieComment [movieNo=" + movieNo + ", sort=" + sort + ", opt=" + opt + ", value=" + value
				+ ", beginIndex=" + beginIndex + ", endIndex=" + endIndex + "]";
	}
	
}
