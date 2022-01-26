package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Comment;

@Mapper
public interface CommentDao {

	void insertComment(Comment comment);
	void updateCommentByNo(Comment comment);
	void deleteCommentByNo(Comment comment);
	List<Comment> getAllComments();
	List<Comment> searchCommentsByMovieNo(int movieNo);
	List<Comment> searchCommnetsByCustomerNo(int customerNo);
	Comment getCommentByCommentNo(int commentNo);
}
