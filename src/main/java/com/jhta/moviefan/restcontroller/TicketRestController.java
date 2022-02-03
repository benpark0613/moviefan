package com.jhta.moviefan.restcontroller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/ticket")
public class TicketRestController {

	static final Logger logger = LogManager.getLogger(TicketRestController.class);
}
