package com.jhta.moviefan.restcontroller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.service.AdminService;

@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {

	static final Logger logger = LogManager.getLogger(AdminRestController.class);
	
	@Autowired
	private AdminService adminService;
	

}
