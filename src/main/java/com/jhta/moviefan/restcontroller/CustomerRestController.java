package com.jhta.moviefan.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.dto.NoticeDto;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.dto.RestMovieWishListDto;
import com.jhta.moviefan.dto.RestNoticeDto;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.form.CriteriaNotice;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.NoticeService;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerCinemaFavorites;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

@RestController
@RequestMapping("/rest/member")
public class CustomerRestController {
	
	static final Logger logger = LogManager.getLogger(CustomerRestController.class);
	
	@Autowired
	CustomerService customerService;
	@Autowired
	MovieService movieService;
	@Autowired
	CinemaService cinemaService;
	@Autowired
	NoticeService noticeService;
	
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
		
		customer.setNickName(nickName);
		customerService.updateCustomerInfo(customer);
		
		response.setStatus("OK");
		return response;
	}
	
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
	
	@GetMapping("/notice-list")
	public RestNoticeDto getNoticeList(@LoginedCustomer Customer customer, CriteriaNotice criteriaNotice,
			@RequestParam(name = "page", required = false, defaultValue = "1") String page) {
		
		logger.info("criteriaNotice 값1:" + criteriaNotice);
		int totalRecords = noticeService.getTotalRows(criteriaNotice);
		logger.info("totalRecords 값:" + totalRecords);
		Pagination pagination = new Pagination(page, totalRecords);
		logger.info("criteriaNotice 값2:" + criteriaNotice);
		criteriaNotice.setBeginIndex(pagination.getBegin());
		criteriaNotice.setEndIndex(pagination.getEnd());
		logger.info("criteriaNotice 값3:" + criteriaNotice);
		
		List<NoticeDto> noticeDtos = noticeService.getNoticeDtos(criteriaNotice);
		
		RestNoticeDto restNoticeDto = new RestNoticeDto();
		restNoticeDto.setStatus("OK");
		restNoticeDto.setNoticeDtos(noticeDtos);
		restNoticeDto.setPagination(pagination);
		
		logger.info("restNoticeDto 값: " + restNoticeDto);
		
		return restNoticeDto;
	}
	
	@GetMapping("/detail")
	public RestNoticeDto getNoticeDetail(@LoginedCustomer Customer customer, @RequestParam(name = "no", required = true) int no) {
		
		RestNoticeDto restNoticeDto = new RestNoticeDto();
		restNoticeDto.setStatus("OK");
		restNoticeDto.setNoticeDtos(List.of(noticeService.getNoticeDto(no)));

		return restNoticeDto;
		
		
	}
	
}



















