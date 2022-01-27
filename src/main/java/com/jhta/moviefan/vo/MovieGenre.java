package com.jhta.moviefan.vo;

public class MovieGenre {

	private int movieNo;
	private int genreNo;
	
	public MovieGenre() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	@Override
	public String toString() {
		return "MovieGenre [movieNo=" + movieNo + ", genreNo=" + genreNo + "]";
	}
	
	
}
