package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.MovieCustomerCommentDao;
import com.jhta.moviefan.dto.MovieDetailDto;
import com.jhta.moviefan.dto.MyAccountCustomerCommentDto;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieCustomerComment;

@Service
public class MovieCustomerCommentService {
	
	static final Logger LOGGER = LogManager.getLogger(MovieCustomerCommentService.class);

	@Autowired
	private MovieCustomerCommentDao movieCustomerCommentDao;
	@Autowired
	private MovieService movieService;
	@Autowired CustomerService customerService;
	
	public List<MyAccountCustomerCommentDto> getAllMyComments(Customer customer, Criteria criteria) {
		
		List<MovieCustomerComment> comments = movieCustomerCommentDao.getMovieCustomerCommentByCustomerNo(customer.getNo());
		
		List<MyAccountCustomerCommentDto> dtos = new ArrayList<>();
		
		for (MovieCustomerComment item : comments) {
			MyAccountCustomerCommentDto dto = new MyAccountCustomerCommentDto();
			MovieDetailDto movieDetailDto = movieService.getMovieDetail(item.getMovieNo());
			
			BeanUtils.copyProperties(item, dto);
			BeanUtils.copyProperties(movieDetailDto, dto);
			BeanUtils.copyProperties(customer, dto);
			
			if (!criteria.getOpt().isEmpty() && !criteria.getValue().isEmpty()) {
				if ("movieTitle".equals(criteria.getOpt()) 
						&& dto.getTitle().trim().toUpperCase().toUpperCase().contains(criteria.getValue())) {
					dtos.add(dto);
				}
				if ("movieActor".equals(criteria.getOpt())) {
					for (MovieActor actor : dto.getActors()) {
						if (actor.getActorName().trim().toUpperCase().toUpperCase().contains(criteria.getValue())) {
							dtos.add(dto);
						}
					}
				}
				if ("content".equals(criteria.getOpt())
						&& dto.getContent().trim().toUpperCase().contains(criteria.getValue().toUpperCase())) {
					dtos.add(dto);
				}
			} else {
				dtos.add(dto);
			}
		}
		return dtos; 
	}
	
	public void updateMyComment(MovieCustomerComment comment) {
		movieCustomerCommentDao.updateMovieCustomerComment(comment);
	}
	
	public List<MyAccountCustomerCommentDto> getCustomerCommentForHome() {
		
		List<MyAccountCustomerCommentDto> dtos = new ArrayList<>();
		List<Movie> rankedMovies = movieService.getMovieOrderByRating();
		
		LOGGER.info("rankedMovies 값: " + rankedMovies);
		
		for (Movie rankedMovie : rankedMovies) {
//			MovieDetailDto movieDetailDto = movieService.getMovieDetail(rankedMovie.getNo());
			List<MovieCustomerComment> comments = movieCustomerCommentDao.getMovieCustomerCommentsByMovieNo(rankedMovie.getNo());
			for (MovieCustomerComment item : comments) {
				Customer customer = customerService.getCustomerByNo(item.getCustomerNo());
				MyAccountCustomerCommentDto dto = new MyAccountCustomerCommentDto();
				BeanUtils.copyProperties(item, dto);
				BeanUtils.copyProperties(customer, dto);
//				BeanUtils.copyProperties(movieDetailDto, dto);
				dtos.add(dto);
			}
			
		}
		
		return dtos; 
	}
	
	public List<MovieDetailDto> getRankedMovieWithDetail() {
		
		List<MovieDetailDto> dtos = new ArrayList<>();
		List<Movie> rankedMovies = movieService.getMovieOrderByRating();
		
		for (Movie rankedMovie : rankedMovies) {
			MovieDetailDto movieDetailDto = movieService.getMovieDetail(rankedMovie.getNo());
			dtos.add(movieDetailDto);
		}
		
		return dtos; 
	}
	
	
}




















