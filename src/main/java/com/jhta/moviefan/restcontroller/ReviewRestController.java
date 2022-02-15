package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.CommentDto;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.vo.CommentLikedCustomer;
import com.jhta.moviefan.vo.Customer;

@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	static final Logger logger = LogManager.getLogger(ReviewRestController.class);
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("updatelikecount")
	public ResponseDto<String> updateLikeCount(@LoginedCustomer Customer customer ,int commentNo, String movieTitle, CriteriaMovieComment criteria, String page) {
		ResponseDto<String> response = new ResponseDto<>();
		CommentLikedCustomer commentLikedCustomer = new CommentLikedCustomer();
		
		
		if(customer == null) {
			throw new RestLoginErrorException("로그인 후 이용하세요");
		}
		
		commentLikedCustomer.setCommentNo(commentNo);
		commentLikedCustomer.setCustomerNo(customer.getNo());
				
		List<CommentLikedCustomer> likeList = commentService.getAllLikedCommentByCustomerNo(customer.getNo());
		boolean isExist = false;
		for(CommentLikedCustomer list : likeList) {
			if(list.getCommentNo() == commentNo) {
				isExist = true;
				break;
			}
		}
		
		if(isExist) {
			commentService.deleteCommentLikedCustomer(commentLikedCustomer);
			commentService.updateCommentLike(commentNo, -1);
		}else {
			// 추천인 정보 저장
			commentService.insertCommentLikedCustomer(commentLikedCustomer);
			// 코멘트 +1 update
			commentService.updateCommentLike(commentNo, 1);
		}
		
		int totalRecords = commentService.getCommentTotalRow(criteria);
		Pagination pagination = new Pagination(page, totalRecords, 10);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		criteria.setOpt("영화명");
		criteria.setValue(movieTitle);
		
		List<CommentDto> commentList = commentService.searchComment(criteria);
		response.setStatus("OK");
		response.setItem(commentList);
		
		return response;
	}
	
}
