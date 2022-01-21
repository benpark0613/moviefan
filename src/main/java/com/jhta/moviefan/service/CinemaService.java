package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dto.CinemaDto;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaDao cinemaDao;
	
	public List<CinemaDto> getAllCinemaList() {
		return cinemaDao.getAllCinemas();
	}
}
