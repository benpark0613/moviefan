package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dao.TicketDao;
import com.jhta.moviefan.dto.CinemaHallWithShowsDto;
import com.jhta.moviefan.dto.ShowSeatDetailDto;
import com.jhta.moviefan.dto.ShowWithSeatsDto;
import com.jhta.moviefan.vo.CinemaHall;
import com.jhta.moviefan.vo.Show;
import com.jhta.moviefan.vo.ShowSeat;

@Service
@Transactional
public class TicketService {

	static final Logger logger = LogManager.getLogger(TicketService.class);
	
	@Autowired 
	private TicketDao ticketDao;
	@Autowired
	private CinemaDao cinemaDao; 
	
	public List<Show> getShowsNowPlaying(Map<String, Object> request) {
		return ticketDao.getShowsNowPlaying(request);
	}
	
	public List<ShowSeat> getShowSeatsByShowNo(int showNo) {
		return ticketDao.getShowSeatsByShowNo(showNo);
	}
	
	public ShowWithSeatsDto getShowWithSeatsByShowNo(int showNo) {
		ShowWithSeatsDto showWithSeats = new ShowWithSeatsDto();
		
		Show show = ticketDao.getShowByNo(showNo);
		BeanUtils.copyProperties(show, showWithSeats);
		List<ShowSeat> seats = ticketDao.getShowSeatsByShowNo(showNo);
		showWithSeats.setSeats(seats);
		
		return showWithSeats;
	}
	
	public List<ShowSeatDetailDto> getShowSeatDetailDtos(int showNo) {
		return ticketDao.getShowSeatDetailByShowNo(showNo);
	}
	
	public int getTotalSeatsRows(int showNo) {
		return ticketDao.getTotalSeatsRows(showNo);
	}
	
	public List<ShowWithSeatsDto> getShowsWithSeatsNowPlaying(Map<String, Object> request) {
		List<ShowWithSeatsDto> showsWithSeatsNowPlaying = new ArrayList<>();
		
		List<Show> shows = ticketDao.getShowsNowPlaying(request);
		for (Show show : shows) {
			ShowWithSeatsDto showWithSeats = new ShowWithSeatsDto();
			List<ShowSeat> seats = ticketDao.getShowSeatsByShowNo(show.getNo());
			int totalSeatsAvailabe = ticketDao.getTotalSeatsAvailable(show.getNo());
			BeanUtils.copyProperties(show, showWithSeats);
			showWithSeats.setSeats(seats);
			showWithSeats.setTotalSeatsAvailable(totalSeatsAvailabe);
			showsWithSeatsNowPlaying.add(showWithSeats);
		}
		
		return showsWithSeatsNowPlaying;
	}
	
	public List<Map<String, Object>> getShowDatesNowPlaying(Map<String, Integer> request) {
		Date[] dates = ticketDao.getShowDatesNowPlaying(request);
		
		List<Map<String, Object>> showDatesNowPlaying = Arrays.stream(dates).map(date -> {
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("year", c.get(Calendar.YEAR));
			map.put("month", c.get(Calendar.MONTH) + 1);
			map.put("day", c.get(Calendar.DAY_OF_WEEK));
			map.put("date", date);
			return map;
		}).collect(Collectors.toList());
		
		return showDatesNowPlaying;
	}
	
	public List<CinemaHallWithShowsDto> getCinemaHallsWithShowsDto(Map<String, Object> request) {
		List<CinemaHallWithShowsDto> cinemaHallsWithShows = new ArrayList<>();
		
		List<CinemaHall> halls = cinemaDao.getCinemaHallsNowPlaying(request);
		for (CinemaHall hall : halls) {
			CinemaHallWithShowsDto cinemaHallWithShows = new CinemaHallWithShowsDto();
			request.put("hallNo", hall.getNo());
			List<ShowWithSeatsDto> showWithSeats = getShowsWithSeatsNowPlaying(request);
			BeanUtils.copyProperties(hall, cinemaHallWithShows);
			cinemaHallWithShows.setShows(showWithSeats);
			cinemaHallsWithShows.add(cinemaHallWithShows);
		}
		
		return cinemaHallsWithShows;
	}
	
	
	
	
}
