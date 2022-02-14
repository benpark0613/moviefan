package com.jhta.moviefan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.CommentDto;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.form.CommentInsertForm;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;

@Controller
@RequestMapping("/community")
public class ReviewController {

	@Autowired
	CommentService commentService;
	@Autowired
	MovieService movieService;
	
	@GetMapping("/commentScore")
	public String commentScore(@RequestParam(name = "page", required = false, defaultValue = "1") String page, Model model, CriteriaMovieComment criteria) {
		int totalRecords = commentService.getCommentTotalRow(criteria);
		Pagination pagination = new Pagination(page, totalRecords, 10);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<CommentDto> commentList = commentService.searchComment(criteria);
		
		model.addAttribute("comment", commentList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("size", totalRecords);
		
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
	
	@GetMapping("/commentForm") 
	public String commentForm(@RequestParam(name = "title", required = false, defaultValue = "") String title, @LoginedCustomer Customer customer, Model model) { 
		
		if(customer == null) {
			throw new LoginErrorException("로그인 후 이용해 주세요");
		}
		
		List<Movie> movieList = movieService.getAllMovies();
		
		if(title != null) {
			model.addAttribute("title", title);
		}
		model.addAttribute("movieList", movieList);
		
		
		return "community/commentForm";
	}
	
	
	@PostMapping("/commentregister")
	public String commentregister(@LoginedCustomer Customer customer ,CommentInsertForm form) {
		
		if(customer == null) {
			throw new LoginErrorException("로그인 후 이용하세요");
		}
		
		form.setCustomerNo(customer.getNo());
		
		commentService.insertComment(form);
		commentService.updateMovieCustomerRating(form.getMovieNo());
		
		return "redirect:commentScore";
	}
	
}
