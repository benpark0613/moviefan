package com.jhta.moviefan.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.form.ScheduleUpdateForm;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/admin")
public class AdminController {

	static final Logger logger = LogManager.getLogger(AdminController.class);

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private MovieService movieService;
	
	@GetMapping("home")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("dashboard")
	public String index() {
		return "admin/home";
	}
	
	@GetMapping("movie/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			Model model) {
		logger.info("요청 페이지번호 : " + page);
		
		int totalRecords = movieService.getMoviesTotalRows();
		Pagination pagination = new Pagination(page, totalRecords);
		
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		List<Movie> movies = movieService.getMovies(beginIndex, endIndex);
		
		model.addAttribute("movies", movies);
		model.addAttribute("pagination", pagination);
		
		return "admin/movie/list";
	}
	
	@GetMapping("movie/search")
	public String search() {
		return "admin/movie/search";
	}
	
	@GetMapping("/schedule/list")
	public String list(Model model) {
		List<City> cityList = cinemaService.getAllCityList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "admin/schedule/list";
	}
	
	@GetMapping("/schedule/timetable")
	public String timetable(int cinemaNo, Model model) {
		List<MovieTimeTableDto> movieTimeTableDtos = cinemaService.getMovieTimeTableByCinemaNo(cinemaNo);
		
		model.addAttribute("movieTimeTableDtos", movieTimeTableDtos);
		
		return "admin/schedule/list";
	}
	
	@GetMapping("/schedule/modify")
	public String modify(int showNo, Model model) {
		List<Movie> movieList = movieService.getAllMovies();
		MovieTimeTableDto detailSchedule = cinemaService.getMovieTimeTableByShowNo(showNo);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("detailSchedule", detailSchedule);
		
		return "admin/schedule/modify";
	}
	
	@PostMapping("/schedule/updateMovie")
	public String update(int showNo, int movieNo) {
		
		cinemaService.updateSchedule(showNo, movieNo);
		
		
		return "redirect:schedule/modify";
	}
	
	
	
}
