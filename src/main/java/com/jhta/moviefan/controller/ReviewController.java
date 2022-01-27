package com.jhta.moviefan.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.form.CommentInsertForm;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.vo.Comment;

@Controller
@RequestMapping("/community")
public class ReviewController {

	@Autowired
	CommentService commentService;
	
	@GetMapping("/commentScore")
	public String commentSocre(Model model) {
		List<Comment> comments = commentService.getCommentList();
		model.addAttribute("comments", comments);
		
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
	
}
