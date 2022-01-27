package com.jhta.moviefan.controller;

import static com.jhta.moviefan.utils.ParameterStringBuilder.getParamsString;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.jhta.moviefan.form.MovieInsertForm;
import com.jhta.moviefan.vo.Genre;
import com.jhta.moviefan.vo.MovieImage;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	
	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@GetMapping("home")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("dashboard")
	public String index() {
		return "admin/home";
	}
	
	@GetMapping("movie/list")
	public String movie() {
		return "admin/movie/list";
	}
	
	@GetMapping("movie/search")
	public String searchMovie() {
		return "admin/movie/search";
	}
	
	@PostMapping("/movie/insert")
	public String insertMovie(MovieInsertForm form) throws IOException {
		String saveDirectory = "C:\\workspace\\workspace-moviefan\\moviefan\\src\\main\\webapp\\resources\\images\\movie";
		
		logger.debug("입력폼 정보: " + form);
		
		List<MovieImage> movieImages = new ArrayList<>();
		List<MultipartFile> images = form.getImages();
		for (MultipartFile multipartFile : images) {
			if (!multipartFile.isEmpty()) {
				String filename = multipartFile.getOriginalFilename();
				
				MovieImage movieImage = new MovieImage();
				movieImage.setMovieNo(form.getNo());
				movieImage.setFilename(filename);
				movieImages.add(movieImage);
				
				// 업로드된 첨부파일을 프로젝트내의 images 폴더에 저장하기
				// MultipartFile객체는 임시디렉토리에 임시파일상태로 저장된 첨부파일을 읽어오는 스트림을 제공한다.
				InputStream in = multipartFile.getInputStream();
				// 지정된 폴더에 첨부파일명으로 파일을 출력하는 스트림 생성하기
				FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
				// Spring에서 제공하는 FileCopyUtils.copy(InputStream in, OutputStream out)를 메소드를 사용해서
				// temp폴더에 임시파일로 저장되어 있는 첨부파일을 읽어서 지정된 경로의 폴더로 복사한다.
				FileCopyUtils.copy(in, out);
			}
		}
		
		System.out.println(form);
		
		List<Genre> genres = new ArrayList<>();
		if (form.getGenres().length > 0) {
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/search/actor")
	public String searchActors() throws IOException {
		
		String requestUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json";
		
		Map<String, String> parameters = new HashMap<>(); 
		parameters.put("key", "f5eef3421c602c6cb7ea224104795888");
		parameters.put("peopleNm", "톰 홀랜드");
		parameters.put("filmoNames", "스파이더맨: 노 웨이 홈");

		URL url = new URL(requestUrl+getParamsString(parameters));

		InputStream in = url.openStream();
		
		Gson gson = new Gson();
		HashMap<?, ?> map = gson.fromJson(new InputStreamReader(in), HashMap.class);
		
		System.out.println(map);
		
		return "admin/movie/search";
	}
	
	@GetMapping("/movie/modify")
	public String updateMovie() {
		return "admin/movie/modifyform";
	}
	
	@GetMapping("/schedule/list")
	public String list(Model model) {
		List<City> cityList = cinemaService.getAllCityList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "admin/schedule/list";
	}
	
	@GetMapping("/schedule/modify")
	public String modify() {
		return "admin/schedule/modify";
	}
}
