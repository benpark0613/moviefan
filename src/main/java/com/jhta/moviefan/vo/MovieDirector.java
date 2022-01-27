package com.jhta.moviefan.vo;

public class MovieDirector {

	private int movieNo;
	private int directorNo;
	private String directorName;
	private String directorNameEn;
	
	public MovieDirector() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getDirectorNo() {
		return directorNo;
	}

	public void setDirectorNo(int directorNo) {
		this.directorNo = directorNo;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public String getDirectorNameEn() {
		return directorNameEn;
	}

	public void setDirectorNameEn(String directorNameEn) {
		this.directorNameEn = directorNameEn;
	}

	@Override
	public String toString() {
		return "MovieDirector [movieNo=" + movieNo + ", directorNo=" + directorNo + ", directorName=" + directorName
				+ ", directorNameEn=" + directorNameEn + "]";
	}

	
	
	
}
