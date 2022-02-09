package com.jhta.moviefan.dto;

import java.util.List;
import java.util.Map;

import com.jhta.moviefan.vo.Movie;

public class TicketMoviePageDto {

	List<Movie> moviesNowPlaying;							// 상영중인 영화 전체 목록
	List<Movie> moviesAvailable;							// 선택한 극장, 날짜로 예매 가능한 영화 목록
	List<CityWithCinemasDto> citiesWithCinemas;				// 도시 전체 목록과 해당 도시에 있는 극장 전체 목록 
	List<CityWithCinemasDto> citiesWithCinemasAvailable;	// 선택한 영화, 날짜로 예매 가능한 극장 목록
	List<Map<String, Object>> showDatesNowPlaying;			// 상영중인 영화가 있는 날짜 전체 목록
	List<Map<String, Object>> showDatesAvailable;			// 선택한 영화, 극장에서 예매 가능한 날짜 목록
	
	public List<Movie> getMoviesNowPlaying() {
		return moviesNowPlaying;
	}
	public void setMoviesNowPlaying(List<Movie> moviesNowPlaying) {
		this.moviesNowPlaying = moviesNowPlaying;
	}
	public List<Movie> getMoviesAvailable() {
		return moviesAvailable;
	}
	public void setMoviesAvailable(List<Movie> moviesAvailable) {
		this.moviesAvailable = moviesAvailable;
	}
	public List<CityWithCinemasDto> getCitiesWithCinemas() {
		return citiesWithCinemas;
	}
	public void setCitiesWithCinemas(List<CityWithCinemasDto> citiesWithCinemas) {
		this.citiesWithCinemas = citiesWithCinemas;
	}
	public List<CityWithCinemasDto> getCitiesWithCinemasAvailable() {
		return citiesWithCinemasAvailable;
	}
	public void setCitiesWithCinemasAvailable(List<CityWithCinemasDto> citiesWithCinemasAvailable) {
		this.citiesWithCinemasAvailable = citiesWithCinemasAvailable;
	}
	public List<Map<String, Object>> getShowDatesNowPlaying() {
		return showDatesNowPlaying;
	}
	public void setShowDatesNowPlaying(List<Map<String, Object>> showDatesNowPlaying) {
		this.showDatesNowPlaying = showDatesNowPlaying;
	}
	public List<Map<String, Object>> getShowDatesAvailable() {
		return showDatesAvailable;
	}
	public void setShowDatesAvailable(List<Map<String, Object>> showDatesAvailable) {
		this.showDatesAvailable = showDatesAvailable;
	}
	@Override
	public String toString() {
		return "TicketMoviePageDto [moviesNowPlaying=" + moviesNowPlaying + ", moviesAvailable=" + moviesAvailable
				+ ", citiesWithCinemas=" + citiesWithCinemas + ", citiesWithCinemasAvailable="
				+ citiesWithCinemasAvailable + ", showDatesNowPlaying=" + showDatesNowPlaying + ", showDatesAvailable="
				+ showDatesAvailable + "]";
	}
	
	
	
	
	
}
