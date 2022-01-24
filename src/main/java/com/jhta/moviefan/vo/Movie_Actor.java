package com.jhta.moviefan.vo;

public class Movie_Actor {
	
	private int movieNo;
	private int actorNo;
	private String actorName; 

	public Movie_Actor() {}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public int getActorNo() {
		return actorNo;
	}

	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}

	public String getActorName() {
		return actorName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	@Override
	public String toString() {
		return "Movie_Actor [movieNo=" + movieNo + ", actorNo=" + actorNo + ", actorName=" + actorName + "]";
	}
	

}
