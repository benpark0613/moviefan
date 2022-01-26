package com.jhta.moviefan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.service.CommentService;

@Controller
@RequestMapping("/community")
public class ReviewController {

	@Autowired
	CommentService commentService;
	
	@GetMapping("/commentScore")
	public String commentSocre() {
		return "community/commentScore";
	}
	
	@GetMapping("/reviewBoard")
	public String reviewBoard() {
		return "community/reviewBoard";
	}
	
	@GetMapping("/write")
	public String write() {
		return "community/write";
	}
	
	
}
