package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.MovieCustomerComment;

@Mapper
public interface MovieCustomerCommentDao {

	// comment(성근)
	// 조인이 많아 데이터를 뽑은 후 service에서 dto에 담은 후 페이지네이션 데이터를 갱신하려한다.
	// getMovieCustomerCommentByCustomerNo 에서는 row_number를 줘서 정렬만한다.
	List<MovieCustomerComment> getMovieCustomerCommentByCustomerNo(int customerNo);
	MovieCustomerComment getMovieCustomerCommentByCommentNo(int commentNo);
	List<MovieCustomerComment> getAllMovieCustomerComments();
	List<MovieCustomerComment> getMovieCustomerCommentsByMovieNo(int movieNo);
	void deleteMovieCustomerCommentByCommentNo(int commentNo);
	void insertMovieCustomerComment(MovieCustomerComment movieCustomerComment);
	void updateMovieCustomerComment(MovieCustomerComment movieCustomerComment);
	
//	int getMovieCustomerCommentsToTalRows(Criteria criteria);
//	List<MovieCustomerComment> searchMovieCustomerComments(Criteria criteria);
	
}
