package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.vo.Comment;
import com.jhta.moviefan.vo.CommentLikedCustomer;

@Mapper
public interface CommentDao {

	void insertComment(Comment comment);
	void updateCommentByNo(Comment comment);
	void deleteCommentByNo(Comment comment);
	List<Comment> getMovieTitleByMovieNo(int movieNo);
	List<Comment> getCustomerIdBycustomerNo(int customerNo);
	List<Comment> getAllComments();
	List<Comment> searchCommentsByMovieNo(int movieNo);
	List<Comment> searchCommnetsByCustomerNo(int customerNo);
	Comment getCommentByCommentNo(int commentNo);
	Comment commentAllRows();
	
	void updateCommentLike(int commentNo);
	void updateCommentLikeCustomer(CommentLikedCustomer commentLikedCustomer);
	List<Comment> getCommentPages(CriteriaMovieComment criteria);
	List<Comment> getAllCommentByIndex(Criteria criteria);
	List<Comment> searchComment(CriteriaMovieComment criteria);
	int getCommentTotalRow(CriteriaMovieComment criteria);
	int getCommentTotalRowByMovieNo(int movieNo);
}
