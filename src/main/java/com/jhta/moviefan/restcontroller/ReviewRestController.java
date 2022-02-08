package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Comment;
import com.jhta.moviefan.vo.CommentLikedCustomer;
import com.jhta.moviefan.vo.Customer;

@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	static final Logger logger = LogManager.getLogger(ReviewRestController.class);
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("updatelikecount")
	public ResponseDto<String> updateLikeCount(int commentNo, int movieNo) {
		ResponseDto<String> response = new ResponseDto<>();
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		CommentLikedCustomer commentLikedCustomer = new CommentLikedCustomer();
		
		commentLikedCustomer.setCommentNo(commentNo);
		commentLikedCustomer.setCustomerNo(movieNo);
		logger.info("로그인 된 사용자 정보 : " + customer);
		
		if(customer == null) {
			throw new LoginErrorException("로그인 후 이용하세요");
		}
		// 회원번호로 영화에 댓글을 추천한 기록이 있으면 추천 불가
		commentService.updateCommentLike(commentNo);
		//commentService.updateCommentLikeCustomer(commentLikedCustomer);
		List<Comment> commentList = commentService.searchCommentsByMovieNo(movieNo);
		response.setStatus("OK");
		response.setItem(commentList);
		
		return response;
	}
}
