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
	
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
	}
	
	public void updateCommentByNo(Comment comment) {
		commentDao.updateCommentByNo(comment);
	}
	
	public void deleteCommentByNo(Comment comment) {
		commentDao.deleteCommentByNo(comment);
	}
	
	public List<Comment> getAllComments() {
		return commentDao.getAllComments();
	}
	
	public List<Comment> searchCommentsByMovieNo(int movieNo) {
		return commentDao.searchCommentsByMovieNo(movieNo);
	}
	
	public List<Comment> searchCommentsByCustomerNo(int customeNo) {
		return commentDao.searchCommnetsByCustomerNo(customeNo);
	}
}
