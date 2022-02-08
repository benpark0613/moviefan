package com.jhta.moviefan.service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.TicketDao;
import com.jhta.moviefan.vo.Show;

@Service
@Transactional
public class TicketService {

	static final Logger logger = LogManager.getLogger(TicketService.class);
	
	@Autowired 
	private TicketDao ticketDao;
	
	public List<Show> getShowsNowPlaying() {
		return ticketDao.getShowsNowPlaying();
	}
	
	public List<Map<String, Object>> getShowDatesNowPlaying() {
		Date[] dates = ticketDao.getShowDatesNowPlaying();
		
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
	
}
