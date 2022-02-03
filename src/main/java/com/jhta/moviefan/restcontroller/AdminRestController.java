package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.MovieDetailDto;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.form.MovieInsertForm;
import com.jhta.moviefan.form.MovieUpdateForm;
import com.jhta.moviefan.service.MovieService;

@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {

	static final Logger logger = LogManager.getLogger(AdminRestController.class);
	
	@Autowired
	private MovieService movieService;
	
	
	@GetMapping("movie/detail")
	public MovieDetailDto detail(int movieNo) {
		MovieDetailDto movie = movieService.getMovieDetail(movieNo);
		return movie;
	}
	
	@PostMapping("movie/insert")
	public ResponseDto<?> insert(MovieInsertForm form) {
		movieService.insertMovie(form);
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		response.setItem(List.of(form.getNo()));
		return response;
	}
	
	
	@PostMapping("movie/update")
	public ResponseDto<?> update(MovieUpdateForm form) {
		movieService.updateMovieDetail(form);
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		response.setItem(List.of(form.getNo()));
		return response;
	}
}
