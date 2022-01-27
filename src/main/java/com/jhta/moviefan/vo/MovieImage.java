package com.jhta.moviefan.vo;

public class MovieImage {

	private int movieNo;
	private String filename;
	
	public MovieImage() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "MovieImage [movieNo=" + movieNo + ", filename=" + filename + "]";
	}
}
