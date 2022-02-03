package com.jhta.moviefan.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TicketService {

	static final Logger logger = LogManager.getLogger(TicketService.class);
	
}
