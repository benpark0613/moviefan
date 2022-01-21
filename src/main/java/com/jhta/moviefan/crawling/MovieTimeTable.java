package com.jhta.moviefan.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class MovieTimeTable {

	public static void main(String[] args) throws IOException {
		
		String url = "http://www.cgv.co.kr/theaters/";
		Document doc = Jsoup.connect(url).get();
		System.out.println(doc);
		
	}
}
