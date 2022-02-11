package com.jhta.moviefan.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class MovieCustomerCommentService {
	
	static final Logger LOGGER = LogManager.getLogger(MovieCustomerCommentService.class);

	@Autowired
	private MovieCustomerCommentService movieCustomerCommentService;
}
