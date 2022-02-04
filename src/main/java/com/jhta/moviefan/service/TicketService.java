package com.jhta.moviefan.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.dao.TicketDao;

@Service
@Transactional
public class TicketService {

	static final Logger logger = LogManager.getLogger(TicketService.class);
	
	@Autowired 
	private TicketDao ticketDao;
	
	
}
