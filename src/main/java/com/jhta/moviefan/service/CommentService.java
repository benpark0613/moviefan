package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.CommentDao;
import com.jhta.moviefan.dto.CommentDto;
import com.jhta.moviefan.form.CommentInsertForm;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.vo.CommentLikedCustomer;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	
	// 주성
	public List<CommentDto> searchCommentsByMovieNo(int movieNo) {
		return commentDao.searchCommentsByMovieNo(movieNo);
	}
	
	public List<CommentDto> getAllComments(){
		return commentDao.getAllComments();
	}
	
	public List<CommentDto> getCommentPages(CriteriaMovieComment criteria){
		return commentDao.getCommentPages(criteria);
	}
	
	public List<CommentDto> getAllCommentByIndex(Criteria criteria){
		return commentDao.getAllCommentByIndex(criteria);
	}
	
	public List<CommentDto> searchComment(CriteriaMovieComment criteria){
		return commentDao.searchComment(criteria);
	}
	
	public void updateCommentLike(int commentNo) {
		commentDao.updateCommentLike(commentNo);
	}
	
	public int getCommentTotalRow(CriteriaMovieComment criteria) {
		return commentDao.getCommentTotalRow(criteria);
	}
	
	public int getCommentTotalRowByMovieNo(int movieNo) {
		return commentDao.getCommentTotalRowByMovieNo(movieNo);
	}
	
	public void updateCommentLikeCustomer(CommentLikedCustomer commentLikedCustomer) {
		commentDao.updateCommentLikeCustomer(commentLikedCustomer);
	}
	
	public void insertComment(CommentInsertForm form) {
		commentDao.insertComment(form);
	}
	
	public void insertCommentLikedCustomer(CommentLikedCustomer commentLikedCustomer) {
		commentDao.insertCommentLikedCustomer(commentLikedCustomer);
	}
}
