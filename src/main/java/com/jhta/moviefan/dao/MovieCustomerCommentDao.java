package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.vo.MovieCustomerComment;

@Mapper
public interface MovieCustomerCommentDao {

	// comment(성근)
	MovieCustomerComment getMovieCustomerCommentByCommentNo(int commentNo);
	List<MovieCustomerComment> getAllMovieCustomerComments();
	void deleteMovieCustomerCommentByCommentNo(int commentNo);
	void insertMovieCustomerComment(MovieCustomerComment movieCustomerComment);
	void updateMovieCustomerComment(MovieCustomerComment movieCustomerComment);
	
//	int getMovieCustomerCommentsToTalRows(Criteria criteria);
//	List<MovieCustomerComment> searchMovieCustomerComments(Criteria criteria);
	
}
