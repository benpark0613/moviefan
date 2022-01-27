package com.jhta.moviefan.vo;

public class MovieImage {
	
	private int movieNo;
	private String movieImageFileName;
	
	public MovieImage() {}
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	
	public String getMovieImageFileName() {
		return movieImageFileName;
	}

	public void setMovieImageFileName(String movieImageFileName) {
		this.movieImageFileName = movieImageFileName;
	}

	@Override
	public String toString() {
		return "MovieImage [movieNo=" + movieNo + ", movieImageFileName=" + movieImageFileName + "]";
	}
}
