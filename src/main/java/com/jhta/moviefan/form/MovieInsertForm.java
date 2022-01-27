package com.jhta.moviefan.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MovieInsertForm {

	private int no;
	private String title;
	private String titleEn;
	private String rate;
	private int runtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date openDate;
	private String summary;
	private String producer;
	
	
}
