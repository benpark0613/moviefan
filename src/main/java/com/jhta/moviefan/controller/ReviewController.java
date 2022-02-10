package com.jhta.moviefan.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.moviefan.form.CommentInsertForm;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.vo.Comment;

@Controller
@RequestMapping("/community")
public class ReviewController {

	@Autowired
	CommentService commentService;
	
	@GetMapping("/commentScore")
	public String commentScore(@RequestParam(name = "page", required = false, defaultValue = "1")String page, Model model, CriteriaMovieComment criteria) {
		int totalRecords = commentService.getCommentTotalRow(criteria);
		Pagination pagination = new Pagination(page, totalRecords, 10);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<Comment> commentList = commentService.searchComment(criteria);
		
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
	public String commentForm() { 
		
		return "community/commentForm";
	}
	
	@PostMapping("/commentForm")
	public String save(CommentInsertForm form) {
		
		Comment comment = new Comment();
		BeanUtils.copyProperties(form, comment);
		commentService.addComment(comment);
		
		return "redirect:commentScore";
	}
	
	@GetMapping("")
	public String reply() {
		return "community/reply";
	}
	
}
