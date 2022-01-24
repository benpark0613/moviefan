package com.jhta.moviefan.vo;

public class Movie_Director {

	private int movieNo;
	private String directorName;
	
	public Movie_Director() {}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	@Override
	public String toString() {
		return "Movie_Director [movieNo=" + movieNo + ", directorName=" + directorName + "]";
	}
	
	
}
