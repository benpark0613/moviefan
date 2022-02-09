package com.jhta.moviefan.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Show;

@Mapper
public interface TicketDao {

	List<Show> getShowsNowPlaying();
	Date[] getShowDatesNowPlaying(Map<String, Integer> request);
	
}
