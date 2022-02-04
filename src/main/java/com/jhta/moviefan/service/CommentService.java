package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.CommentDao;
import com.jhta.moviefan.vo.Comment;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	
	public void addComment(Comment comment) {
		commentDao.insertComment(comment);
	}
	
	public void updateCommentByNo(Comment comment) {
		commentDao.updateCommentByNo(comment);
	}
	
	public void deleteCommentByNo(Comment comment) {
		commentDao.deleteCommentByNo(comment);
	}
	
	public List<Comment> getCommentList() {
		return commentDao.getAllComments();
	}
	
	public List<Comment> searchCommentsByMovieNo(int movieNo) {
		return commentDao.searchCommentsByMovieNo(movieNo);
	}
	
	public List<Comment> searchCommentsByCustomerNo(int customeNo) {
		return commentDao.searchCommnetsByCustomerNo(customeNo);
	}
	
	public List<Comment> getMovieTitle(int movieNo) {
		return commentDao.getMovieTitleByMovieNo(movieNo);
	}
	
	public List<Comment> getCustomerId(int customerNo) {
		return commentDao.getCustomerIdBycustomerNo(customerNo);
	}
	
	

}
