package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jhta.moviefan.dto.CommentDto;
import com.jhta.moviefan.form.CommentInsertForm;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.vo.CommentLikedCustomer;

@Mapper
public interface CommentDao {
	
	// 주성
	List<CommentDto> searchCommentsByMovieNo(int movieNo);
	List<CommentDto> getCommentPages(CriteriaMovieComment criteria);
	List<CommentDto> getAllCommentByIndex(Criteria criteria);
	List<CommentDto> searchComment(CriteriaMovieComment criteria);
	List<CommentDto> getAllComments();
	List<CommentLikedCustomer> getAllLikedCommentByCustomerNo(int customerNo);
	List<Integer> getCommentRatingByMovieNo(int movieNo);
	int getCommentTotalRow(CriteriaMovieComment criteria);
	int getCommentTotalRowByMovieNo(int movieNo);
	void updateMovieCustomerRating(@Param("movieNo") int movieNo, @Param("rating") int rating);
	void updateCommentLike(@Param("commentNo") int commentNo, @Param("count") int count);
	void updateCommentLikeCustomer(CommentLikedCustomer commentLikedCustomer);
	void insertComment(CommentInsertForm form);
	//댓글 추천인 저장
	void insertCommentLikedCustomer(CommentLikedCustomer commentLikedCustomer);
	//댓글 추천인 삭제
	void deleteCommentLikedCustomer(CommentLikedCustomer commentLikedCustomer);
	void deleteComment(int commentNo);
}
