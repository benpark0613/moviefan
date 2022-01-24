package com.jhta.moviefan.vo;

public class Movie_Genre {
	
	private int movieNo;
	private int GenreNo;
	private String GenreName;
	
	public Movie_Genre() {
		
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getGenreNo() {
		return GenreNo;
	}
	public void setGenreNo(int genreNo) {
		GenreNo = genreNo;
	}
	public String getGenreName() {
		return GenreName;
	}
	public void setGenreName(String genreName) {
		GenreName = genreName;
	}
	
	@Override
	public String toString() {
		return "Movie_Genre [movieNo=" + movieNo + ", GenreNo=" + GenreNo + ", GenreName=" + GenreName + "]";
	}
	
	
	
}
