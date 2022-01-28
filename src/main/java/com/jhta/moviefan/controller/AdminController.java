package com.jhta.moviefan.controller;

import static com.jhta.moviefan.utils.ParameterStringBuilder.getParamsString;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
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
import com.google.gson.internal.LinkedTreeMap;
import com.jhta.moviefan.form.MovieInsertForm;
import com.jhta.moviefan.vo.Genre;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieDirector;
import com.jhta.moviefan.vo.MovieGenre;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MoviePerson;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.exception.MovieErrorException;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Actor;
import com.jhta.moviefan.vo.City;
import com.jhta.moviefan.vo.Director;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private MovieService movieService;
	
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
		logger.debug("입력폼 정보: " + form);
		String saveDirectory = "C:\\workspace\\workspace-moviefan\\moviefan\\src\\main\\webapp\\resources\\images\\movie";

		Movie movie = movieService.getMovieByMovieNo(form.getNo());
		
		if (movie != null) {
			throw new MovieErrorException("이미 등록된 영화입니다.");
		}

		String[] genres = form.getGenres();
		String[] directors = form.getDirectors();
		String[] actors = form.getActors();
		String[] trailerTitles = form.getTrailerTitles();
		String[] trailerUrls = form.getTrailerUrls();

		// MOVIE 테이블 INSERT
		movie = new Movie();
		movie.setNo(form.getNo());
		movie.setTitle(form.getTitle());
		movie.setTitleEn(form.getTitleEn());
		movie.setRate(form.getRate());
		movie.setRuntime(form.getRuntime());
		movie.setOpenDate(form.getOpenDate());
		movie.setProducer(form.getProducer());
		movie.setSummary(form.getSummary());
		movieService.insertMovie(movie);

		// MOVIE_GENRE 테이블 INSERT
		for (int i = 0; i < genres.length; i++) {
			Genre genre = movieService.getGenreByName(genres[i]);
			MovieGenre movieGenre = new MovieGenre();
			movieGenre.setMovieNo(movie.getNo());
			movieGenre.setGenreNo(genre.getNo());
			movieGenre.setGenreName(genre.getName());
			movieService.insertMovieGenre(movieGenre);
		}
		
		// DIRECTOR, MOVIE_DIRECTOR 테이블 INSERT
		if (directors != null) {
			for (int i = 0; i < directors.length; i++) {
				Director director = new Director();
				director.setName(directors[i]);
				director = (Director)getMoviePersonDetail(director, movie.getTitle());
				
				// 이미 등록된 감독인 경우 저장하지 않는다
				if (movieService.getDirectorByNo(director.getNo()) == null) {
					movieService.insertDirector(director);
				}
				
				MovieDirector movieDirector = new MovieDirector();
				movieDirector.setMovieNo(movie.getNo());
				movieDirector.setDirectorNo(director.getNo());
				movieDirector.setDirectorName(director.getName());
				movieDirector.setDirectorNameEn(director.getNameEn());
				movieService.insertMovieDirector(movieDirector);
			}
		}
		
		// ACTOR, MOVIE_ACTOR 테이블 INSERT
		if (actors != null) {
			for (int i = 0; i < actors.length; i++) {
				Actor actor = new Actor(); 
				actor.setName(actors[i]);
				actor = (Actor)getMoviePersonDetail(actor, movie.getTitle());
				
				// 이미 등록된 배우인 경우 저장하지 않는다
				if (movieService.getActorByNo(actor.getNo()) == null) {
					movieService.insertActor(actor);
				}
				
				MovieActor movieActor = new MovieActor();
				movieActor.setMovieNo(movie.getNo());
				movieActor.setActorNo(actor.getNo());
				movieActor.setActorName(actor.getName());
				movieActor.setActorNameEn(actor.getNameEn());
				movieActor.setActorPriority(i);
				movieService.insertMovieActor(movieActor);
			}
		}
		
		// 영화이미지 파일 업로드, MOVIE_IMAGE 테이블 INSERT 
		List<MultipartFile> images = form.getImages();
		for (MultipartFile multipartFile : images) {
			if (!multipartFile.isEmpty()) {
				String filename = multipartFile.getOriginalFilename();
				
				InputStream in = multipartFile.getInputStream();
				FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
				FileCopyUtils.copy(in, out);
				
				MovieImage movieImage = new MovieImage();
				movieImage.setMovieNo(movie.getNo());
				movieImage.setFilename(filename);
				movieService.insertMovieImage(movieImage);

				in.close();
				out.close();
			}
		}
		
		// MOVIE_TRAILER 테이블 INSERT
		if (trailerTitles != null && trailerUrls != null) {
			for (int i = 0; i < trailerTitles.length; i++) {
				MovieTrailer movieTrailer = new MovieTrailer();
				movieTrailer.setMovieNo(movie.getNo());
				movieTrailer.setTitle(trailerTitles[i]);
				movieTrailer.setUrlAddress(trailerUrls[i]);
				movieService.insertMovieTrailer(movieTrailer);
			}
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/modify")
	public String updateMovie() {
		return "admin/movie/modifyform";
	}
	
	/**
	 * 영화인객체와 영화제목을 전달받아 영화진흥위원회 오픈 API에서 영화인목록 정보를 조회한 다음<br>
	 * 영화인 코드와 이름, 영어이름을 객체에 저장하여 반환한다.  
	 * @param moviePerson 영화인
	 * @param movieTitle 영화제목
	 * @return 영화인 정보
	 * @throws IOException
	 */
	private MoviePerson getMoviePersonDetail(MoviePerson moviePerson, String movieTitle) throws IOException {
		String requestUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json";
		String key = "f5eef3421c602c6cb7ea224104795888";
		
		Map<String, String> parameters = new HashMap<>(); 
		parameters.put("key", key);
		parameters.put("peopleNm", moviePerson.getName());
		parameters.put("filmoNames", movieTitle);
		
		URL url = new URL(requestUrl+getParamsString(parameters));
		InputStream in = url.openStream();
		
		Gson gson = new Gson();
		LinkedTreeMap<?, ?> map = gson.fromJson(new InputStreamReader(in), LinkedTreeMap.class);
		LinkedTreeMap<?, ?> peopleListResult = (LinkedTreeMap<?, ?>)map.get("peopleListResult");
		List<?> peopleList = (List<?>) peopleListResult.get("peopleList");
		LinkedTreeMap<?, ?> person = (LinkedTreeMap<?, ?>)peopleList.get(0);
		int personNo = Integer.parseInt((String)person.get("peopleCd"));
		String personName = (String)person.get("peopleNm");
		String personNameEn = (String)person.get("peopleNmEn");
		
		moviePerson.setNo(personNo);
		moviePerson.setName(personName);
		moviePerson.setNameEn(personNameEn);
		
		in.close();
		
		return moviePerson;
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
	public String modify() {
		return "admin/schedule/modify";
	}
	
}
