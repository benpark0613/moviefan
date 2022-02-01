package com.jhta.moviefan.form;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MovieUpdateForm {

	private int no;
	private String summary;
	private List<MultipartFile> images;
	private String[] filenames;
	private String[] trailerTitles;
	private String[] trailerUrls;
	
	public MovieUpdateForm() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

	public String[] getFilenames() {
		return filenames;
	}

	public void setFilenames(String[] filenames) {
		this.filenames = filenames;
	}

	public String[] getTrailerTitles() {
		return trailerTitles;
	}

	public void setTrailerTitles(String[] trailerTitles) {
		this.trailerTitles = trailerTitles;
	}

	public String[] getTrailerUrls() {
		return trailerUrls;
	}

	public void setTrailerUrls(String[] trailerUrls) {
		this.trailerUrls = trailerUrls;
	}

	@Override
	public String toString() {
		return "MovieUpdateForm [no=" + no + ", summary=" + summary + ", images=" + images + ", filenames="
				+ Arrays.toString(filenames) + ", trailerTitles=" + Arrays.toString(trailerTitles) + ", trailerUrls="
				+ Arrays.toString(trailerUrls) + "]";
	}
	
	
}
