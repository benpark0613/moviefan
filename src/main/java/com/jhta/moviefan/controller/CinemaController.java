package com.jhta.moviefan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.form.ScheduleCriteria;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	static final Logger logger = LogManager.getLogger(CinemaController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	@GetMapping("/main")
	public String main(Model model) {
		List<City> cityList = cinemaService.getAllCityList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "cinema/main";
	}
	
	@GetMapping("/timetable")
	public String timetable(int cinemaNo, ScheduleCriteria criteria, Model model) {
		Cinema cinemaName = cinemaService.getCinemaNameByNo(cinemaNo);
		List<MovieTimeTableDto> movieTimeTableDtos = cinemaService.getMovieTimeTableByShowDate(criteria);
		
		//
		List<Dto> result = new ArrayList<>();
		for (MovieTimeTableDto item : movieTimeTableDtos) {
			Dto dto = getDto(result, item.getMovieNo(), item.getShowDate());
			if (dto == null) {
				dto = new Dto();
				dto.setMovieNo(item.getMovieNo());
				dto.setTitle(item.getTitle());
				dto.setShowDate(item.getShowDate());
				dto.setOpenDate(item.getOpenDate());
				dto.setRuntime(item.getRuntime());
				dto.setHallNo(item.getHallNo());
				dto.setHallName(item.getHallName());
				dto.setTotalSeats(item.getTotalSeats());
				
				result.add(dto);
			}
			
			Dto2 dto2 = new Dto2();
			dto2.setStartTime(item.getStartTime());
			dto2.setEndTime(item.getEndTime());
			dto2.setTotalSeats(item.getTotalSeats());
			//dto2.setReservedSteats(item.getReservedSteats());
			
			dto.getSchedules().add(dto2);
		}
		
		model.addAttribute("cinema", cinemaName);
		model.addAttribute("movieTimeTableDtos", result);
		
		return "cinema/timetable";
	}
	
	@GetMapping("/location")
	public String location(int cinemaNo, Model model) {
		Cinema cinema = cinemaService.getCinemaNameByNo(cinemaNo);
		
		model.addAttribute("cinema", cinema);
		
		return "cinema/location";
	}
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private Dto getDto(List<Dto> dtos, int movieNo, Date showDate) {
		for (Dto dto : dtos) {
			if (dto.getMovieNo() == movieNo && dto.getShowDate().getTime() == showDate.getTime()) {
				return dto;
			}
		}
		return null;
	}

	
	public class Dto  {
		private int movieNo;
		private String title;
		private Date openDate;
		private Date showDate;
		private int runtime;
		private int hallNo;
		private String hallName;
		private int totalSeats;
		private List<Dto2> schedules = new ArrayList<>();
		
		public int getMovieNo() {
			return movieNo;
		}
		public void setMovieNo(int movieNo) {
			this.movieNo = movieNo;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public Date getOpenDate() {
			return openDate;
		}
		public void setOpenDate(Date openDate) {
			this.openDate = openDate;
		}
		public Date getShowDate() {
			return showDate;
		}
		public void setShowDate(Date showDate) {
			this.showDate = showDate;
		}
		public int getRuntime() {
			return runtime;
		}
		public void setRuntime(int runtime) {
			this.runtime = runtime;
		}
		public int getHallNo() {
			return hallNo;
		}
		public void setHallNo(int hallNo) {
			this.hallNo = hallNo;
		}
		public String getHallName() {
			return hallName;
		}
		public void setHallName(String hallName) {
			this.hallName = hallName;
		}
		public int getTotalSeats() {
			return totalSeats;
		}
		public void setTotalSeats(int totalSeats) {
			this.totalSeats = totalSeats;
		}
		public List<Dto2> getSchedules() {
			return schedules;
		}
		public void setSchedules(List<Dto2> schedules) {
			this.schedules = schedules;
		}
	}
	
	
	public class Dto2 {
		private Date startTime;
		private Date endTime;
		private int totalSeats;
		private int reservedSteats;
		
		public Date getStartTime() {
			return startTime;
		}
		public void setStartTime(Date startTime) {
			this.startTime = startTime;
		}
		public Date getEndTime() {
			return endTime;
		}
		public void setEndTime(Date endTime) {
			this.endTime = endTime;
		}
		public int getTotalSeats() {
			return totalSeats;
		}
		public void setTotalSeats(int totalSeats) {
			this.totalSeats = totalSeats;
		}
		public int getReservedSteats() {
			return reservedSteats;
		}
		public void setReservedSteats(int reservedSteats) {
			this.reservedSteats = reservedSteats;
		}
	}
	
}
