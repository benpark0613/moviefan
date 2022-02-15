package com.jhta.moviefan.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.ShowSeatDetailDto;
import com.jhta.moviefan.vo.Show;
import com.jhta.moviefan.vo.ShowSeat;

@Mapper
public interface TicketDao {

	Show getShowByNo(int showNo);
	List<ShowSeatDetailDto> getShowSeatDetailByShowNo(int showNo);
	List<Show> getShowsNowPlaying(Map<String, Object> request);
	List<ShowSeat> getShowSeatsByShowNo(int showNo);
	int getTotalSeatsAvailable(int showNo);
	int getTotalSeatsRows(int showNo);
	Date[] getShowDatesNowPlaying(Map<String, Integer> request);
	
}
