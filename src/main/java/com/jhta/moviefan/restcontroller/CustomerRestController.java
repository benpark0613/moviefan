package com.jhta.moviefan.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.dto.MyAccountCustomerCommentDto;
import com.jhta.moviefan.dto.NoticeDto;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.dto.RestMovieWishListDto;
import com.jhta.moviefan.dto.RestMyCommentDto;
import com.jhta.moviefan.dto.RestNoticeDto;
import com.jhta.moviefan.exception.MovieErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.form.CriteriaNotice;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieCustomerCommentService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.NoticeService;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerCinemaFavorites;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

@RestController
@RequestMapping("/rest/member")
public class CustomerRestController {
	
	static final Logger logger = LogManager.getLogger(CustomerRestController.class);
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MovieCustomerCommentService movieCustomerCommentService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 자주가는 극장
	@PostMapping("/deletemycinema") 
	public ResponseDto<String> deleteMyCinema(@LoginedCustomer Customer customer, @RequestParam(name = "cinemaNo", required = true) int cinemaNo) {
		ResponseDto<String> response = new ResponseDto<String>();
		CustomerCinemaFavorites form = new CustomerCinemaFavorites();
		form.setCustomerNo(customer.getNo());
		form.setCinemaNo(cinemaNo);
		
		customerService.deleteMyCinema(form);
		
		response.setStatus("OK");
		return response;
	}
	@PostMapping("/addmycinema")
	public ResponseDto<String> insertMyCinema(@LoginedCustomer Customer customer, @RequestParam(name = "cinemaNo", required = true) int cinemaNo) {
		ResponseDto<String> response = new ResponseDto<String>();
		System.out.println("cinemaNo값: " + cinemaNo);
		
		CustomerCinemaFavorites form = new CustomerCinemaFavorites();
		
		form.setCustomerNo(customer.getNo());
		form.setCinemaNo(cinemaNo);
		
		customerService.insertMyCinema(form);
		
		response.setStatus("OK");
		return response;
	}
	@GetMapping("/mycinema")
	public ResponseDto<?> getCityWithCinemaList(@LoginedCustomer Customer customer) {
		ResponseDto<?> response = new ResponseDto<>();
		List<CityWithCinemasDto> dtos = customerService.getCityWithCinemas();
		
		response.setStatus("OK");
		response.setItem(dtos);

		return response;
	}
	
	// 닉네임 변경
	@PostMapping("/check-nickname")
	public ResponseDto<String> checkNickName(@LoginedCustomer Customer customer, @RequestParam(name = "nickName", required = true) String nickName) {
		ResponseDto<String> response = new ResponseDto<String>();
		
		Customer savedCustomer = customerService.getCustomerByNickName(nickName);
		if (savedCustomer != null) {
			response.setStatus("FAIL");
			response.setError("중복되는 닉네임입니다.");
			return response;
		}
		
		response.setStatus("OK");
		response.setItem(List.of("사용 가능한 닉네임입니다."));
		return response;
	}
	@PostMapping("/update-nickname")
	public ResponseDto<String> updateNickName(@LoginedCustomer Customer customer, @RequestParam(name = "nickName", required = true) String nickName) {
		ResponseDto<String> response = new ResponseDto<String>();
		
		Customer newNickNameCustomer = customer;
		newNickNameCustomer.setNickName(nickName);
		
		customerService.updateCustomerInfo(customer, newNickNameCustomer);
		
		response.setStatus("OK");
		return response;
	}
	
	// 찜한 영화
	@GetMapping("/movie-wish-list")
	public RestMovieWishListDto movieWishList(@LoginedCustomer Customer customer, 
			@RequestParam(name = "page", required = false, defaultValue = "1") String page, CriteriaMyAccount criteriaMyAccount) {
		
		RestMovieWishListDto response = new RestMovieWishListDto();
		MovieImage movieImage = new MovieImage();
		List<MovieImage> movieImages = new ArrayList<MovieImage>();
		
		criteriaMyAccount.setCustomerNo(customer.getNo());
		int totalRecords = customerService.getTotalRows(criteriaMyAccount);
		Pagination pagination = new Pagination(page, totalRecords, 8);
		criteriaMyAccount.setBeginIndex(pagination.getBegin());
		criteriaMyAccount.setEndIndex(pagination.getEnd());
		
		List<Movie> wishMovies = customerService.searchCustomerMovieWishList(criteriaMyAccount);
		
		for (Movie wishMovie : wishMovies) {
			if (movieService.getMovieImagesByMovieNo(wishMovie.getNo()).isEmpty()) {
				movieImage.setMovieNo(wishMovie.getNo());
				movieImage.setFilename("default_image.png");
				movieImages.add(movieImage);
			} else {
				movieImages.addAll(movieService.getMovieImagesByMovieNo(wishMovie.getNo()));
			}
		}
		
		response.setStatus("OK");
		response.setPagination(pagination);
		response.setWishMovies(wishMovies);
		response.setMovieImages(movieImages);
		return response;
	}
	
	// 공지사항
	@GetMapping("/notice-list")
	public RestNoticeDto getNoticeList(@LoginedCustomer Customer customer, CriteriaNotice criteriaNotice,
			@RequestParam(name = "page", required = false, defaultValue = "1") String page) {
		
		int totalRecords = noticeService.getTotalRows(criteriaNotice);
		Pagination pagination = new Pagination(page, totalRecords);
		criteriaNotice.setBeginIndex(pagination.getBegin());
		criteriaNotice.setEndIndex(pagination.getEnd());
		
		List<NoticeDto> noticeDtos = noticeService.getNoticeDtos(criteriaNotice);
		
		RestNoticeDto restNoticeDto = new RestNoticeDto();
		restNoticeDto.setStatus("OK");
		restNoticeDto.setNoticeDtos(noticeDtos);
		restNoticeDto.setPagination(pagination);
		
		return restNoticeDto;
	}
	@GetMapping("/detail")
	public RestNoticeDto getNoticeDetail(@LoginedCustomer Customer customer, @RequestParam(name = "no", required = true) int no) {
		
		RestNoticeDto restNoticeDto = new RestNoticeDto();
		restNoticeDto.setNoticeDtos(List.of(noticeService.getNoticeDto(no)));
		restNoticeDto.setStatus("OK");

		return restNoticeDto;
	}
	@GetMapping("/delete-wishmovie")
	public ResponseDto<String> deleteWishMovie(@LoginedCustomer Customer customer, @RequestParam(name = "movieNo", required = true) int movieNo) {
		CustomerMovieWishList wishList = new CustomerMovieWishList();
		wishList.setCustomerNo(customer.getNo());
		wishList.setMovieNo(movieNo);
		customerService.deleteCustomerMovieWishListByMovieNo(wishList);
		
		ResponseDto<String> response = new ResponseDto<String>();
		response.setStatus("OK");
		
		return response;
	}
	
	// 한줄평
	@GetMapping("/mycomments")
	public RestMyCommentDto getMyComments(@LoginedCustomer Customer customer, Criteria criteria,
			@RequestParam(name = "page", required = false, defaultValue = "1") String currentPage) {
		List<MyAccountCustomerCommentDto> dtos = movieCustomerCommentService.getAllMyComments(customer, criteria);
		
		int totalRecords = dtos.size();
		
		RestMyCommentDto response = new RestMyCommentDto();
		if (totalRecords == 0) {
			throw new MovieErrorException("검색결과가 없습니다.");
		}
		
		Pagination pagination = new Pagination(currentPage, totalRecords, 5);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<MyAccountCustomerCommentDto> orderedDtos = new ArrayList<>();
		for (int i = criteria.getBeginIndex() - 1; i <= criteria.getEndIndex() - 1; i++) {
			logger.info("dtos.size()는?: " + dtos.size());
			if (dtos.size() <= i) {
				continue;
			}
			orderedDtos.add(dtos.get(i));
		}
		
		response.setStatus("OK");
		response.setDtos(orderedDtos);
		response.setPagination(pagination);
		
		
		
		return response;
	}
	
	@PostMapping("/checkpassword")
	public ResponseDto<String> checkPassword(@LoginedCustomer Customer customer, 
			@RequestParam(name = "id", required = true) String id,
			@RequestParam(name = "password", required = true) String password) {
		
		Customer savedCustomer = customerService.getCustomerById(id);
		
		if (!bCryptPasswordEncoder.matches(password, savedCustomer.getPassword())) {
			throw new RestLoginErrorException("비밀번호가 일치하지 않습니다.");	
		}
		
		ResponseDto<String> response = new ResponseDto<String>();
		response.setStatus("OK");
		return response;
		
	}
	
	
//	@PostMapping("/updatecomment")
//	public ResponseDto<?> updateMyComment(@LoginedCustomer Customer customer, MovieCustomerComment comment) {
//		
//		
//	}
}



















