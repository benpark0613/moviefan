package com.jhta.moviefan.vo;

public class MovieGenre {

	private int movieNo;
	private int genreNo;
	private String genreName;
	
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

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	@Override
	public String toString() {
		return "MovieGenre [movieNo=" + movieNo + ", genreNo=" + genreNo + ", genreName=" + genreName + "]";
	}

	
	
}
