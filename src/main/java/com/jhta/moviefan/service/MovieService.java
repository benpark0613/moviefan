package com.jhta.moviefan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.vo.Movie;

@Service
@Transactional
public class MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	public Movie getMovieByMovieNo(int movieNo) {
		
		return movieDao.getMovieByMovieNo(movieNo);
	}

}
