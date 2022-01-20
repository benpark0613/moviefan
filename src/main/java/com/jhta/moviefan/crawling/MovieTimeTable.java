package com.jhta.moviefan.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieTimeTable {

	public static void main(String[] args) throws IOException {
		
		String url = "http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx";
		Document doc = Jsoup.connect(url).get();
		//System.out.println(doc);
		
		Elements el = doc.getElementsByAttributeValue("class", "col-times");
		System.out.println(el);
	}
}
