package com.jhta.moviefan.vo;

public class MovieActor {
	
	private int movieNo;
	private int actorNo;
	private int actorPriority;
	private String actorName;
	private String actorNameEn;

	public MovieActor() {}

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
	
	public int getActorPriority() {
		return actorPriority;
	}

	public void setActorPriority(int actorPriority) {
		this.actorPriority = actorPriority;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public String getActorNameEn() {
		return actorNameEn;
	}

	public void setActorNameEn(String actorNameEn) {
		this.actorNameEn = actorNameEn;
	}

	@Override
	public String toString() {
		return "MovieActor [movieNo=" + movieNo + ", actorNo=" + actorNo + ", actorPriority=" + actorPriority
				+ ", actorName=" + actorName + ", actorNameEn=" + actorNameEn + "]";
	}

	
	

}
