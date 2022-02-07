package com.jhta.moviefan.service;

import java.util.Date;
import java.util.List;

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
	
	public Date[] getShowDates() {
		return ticketDao.getShowDates();
	}
}
