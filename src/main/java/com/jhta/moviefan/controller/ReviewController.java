package com.jhta.moviefan.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.jhta.moviefan.vo.CommentLikedCustomer;
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
	public String commentScore(@LoginedCustomer Customer customer, @RequestParam(name = "page", required = false, defaultValue = "1") String page, Model model, CriteriaMovieComment criteria) {
		int totalRecords = commentService.getCommentTotalRow(criteria);
		Pagination pagination = new Pagination(page, totalRecords, 10);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<CommentDto> commentList = commentService.searchComment(criteria);
		List<CommentLikedCustomer> likeList = commentService.getAllLikedCommentByCustomerNo(customer.getNo());
				
		
		if(customer != null) {
			model.addAttribute("customerNo", customer.getNo());
		}
		model.addAttribute("likeList", likeList);
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
	public String commentForm(@RequestParam(name = "title", required = false, defaultValue = "") String title, @LoginedCustomer Customer customer, Model model) throws ParseException { 
		
		if(customer == null) {
			throw new LoginErrorException("로그인 후 이용해 주세요");
		}
		
		List<Movie> movieList = movieService.getAllMovies();
		List<Movie> list = new ArrayList<>();
		if(title != null) {
			model.addAttribute("title", title);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy.MM.dd");
				
		Date time = new Date();
				
		String time1 = sdf.format(time);
				
		Date today = sdf.parse(time1);
		
		for(Movie aa : movieList) {
			Movie movie = new Movie();
			if(aa.getOpenDate().before(today)) {
				movie.setNo(aa.getNo());
				movie.setTitle(aa.getTitle());
			}else {
				movie.setTitle("미개봉");
			}
			list.add(movie);
		}
		model.addAttribute("movieList", list);
		
		
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
	
	@GetMapping("/deletecomment")
	public String deletecomment(int commentNo) {
		
		commentService.deleteComment(commentNo);
		commentService.updateMovieCustomerRating(commentNo);
		
		
		return "redirect:commentScore";
	}
	
	
}
