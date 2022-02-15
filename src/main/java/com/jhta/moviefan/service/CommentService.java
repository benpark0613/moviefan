package com.jhta.moviefan.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	
	public void updateCommentLike(@Param("commentNo") int commentNo, @Param("count") int count) {
		commentDao.updateCommentLike(commentNo, count);
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
	
	public List<CommentLikedCustomer> getAllLikedCommentByCustomerNo(int customerNo){
		
		return commentDao.getAllLikedCommentByCustomerNo(customerNo);
	}
	
	public void deleteCommentLikedCustomer(CommentLikedCustomer commentLikedCustomer) {
		commentDao.deleteCommentLikedCustomer(commentLikedCustomer);
	}
	
	public void updateMovieCustomerRating(@Param("movieNo") int movieNo) {
		
		List<Integer> list = commentDao.getCommentRatingByMovieNo(movieNo);
		int sum = 0;
		for(int rating : list) {
			sum += rating;
		}
		int count = commentDao.getCommentTotalRowByMovieNo(movieNo);
		int result = 0;
		if(count == 0) {
			result = 0;
		}else {
			result = sum /count;
		}
		commentDao.updateMovieCustomerRating(movieNo, result);
		
	}
	
	public void deleteComment(int commentNo) {
		commentDao.deleteComment(commentNo);
	}
}
