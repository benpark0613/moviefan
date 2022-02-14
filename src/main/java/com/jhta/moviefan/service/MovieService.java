package com.jhta.moviefan.service;

import static com.jhta.moviefan.utils.ParameterStringBuilder.getParamsString;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.dto.HomeTrailerDetailDto;
import com.jhta.moviefan.dto.HomeTrailerDto;
import com.jhta.moviefan.dto.MovieDetailDto;
import com.jhta.moviefan.dto.MovieWithImagesDto;
import com.jhta.moviefan.exception.MovieErrorException;
import com.jhta.moviefan.form.MovieInsertForm;
import com.jhta.moviefan.form.MovieUpdateForm;
import com.jhta.moviefan.vo.Actor;
import com.jhta.moviefan.vo.Director;
import com.jhta.moviefan.vo.Genre;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieDirector;
import com.jhta.moviefan.vo.MovieGenre;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MoviePerson;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieRate;

@Service
@Transactional
public class MovieService {
	
	static final Logger logger = LogManager.getLogger(MovieService.class);
	
	@Autowired
	private MovieDao movieDao;
	
	public int getMoviesTotalRows() {
		return movieDao.getMoviesTotalRows();
	}
	
	public List<Movie> getMovies(int beginIndex, int endIndex) {
		return movieDao.getMovies(beginIndex, endIndex);
	}
	
	public List<Movie> getMoviesNowPlaying(Map<String, Object> request) {
		return movieDao.getMoviesNowPlaying(request);
	}
	
	public MovieWithImagesDto getMovieWithImages(int movieNo) {
		MovieWithImagesDto movieWithImages = new MovieWithImagesDto();
		
		Movie movie = movieDao.getMovieByMovieNo(movieNo);
		List<MovieImage> images = movieDao.getMovieImagesByMovieNo(movieNo);
		BeanUtils.copyProperties(movie, movieWithImages);
		movieWithImages.setImages(images);
		
		return movieWithImages;
	}
	
	public MovieDetailDto getMovieDetail(int movieNo) {
		MovieDetailDto movieDetail = new MovieDetailDto();
		
		Movie movie = movieDao.getMovieByMovieNo(movieNo);
		List<MovieGenre> genres = movieDao.getMovieGenresByMovieNo(movieNo);
		List<MovieDirector> directos = movieDao.getMovieDirectorsByMovieNo(movieNo);
		List<MovieActor> actors = movieDao.getMovieActorsByMovieNo(movieNo);
		List<MovieImage> images = movieDao.getMovieImagesByMovieNo(movieNo);
		List<MovieTrailer> trailers = movieDao.getMovieTrailersByMovieNo(movieNo);
		
		BeanUtils.copyProperties(movie, movieDetail);
		movieDetail.setGenres(genres);
		movieDetail.setDirectors(directos);
		movieDetail.setActors(actors);
		movieDetail.setImages(images);
		movieDetail.setTrailers(trailers);
		
		return movieDetail;
	}
	
	public List<Movie> getAllMovies() {
		return movieDao.getAllMovies();
	}
	
	public Movie getMovieByMovieNo(int movieNo) {
		return movieDao.getMovieByMovieNo(movieNo);
	}
	public List<MovieImage> getMovieImagesByMovieNo(int movieNo) {
		return movieDao.getMovieImagesByMovieNo(movieNo);
	}
	
	public List<MovieTrailer> getMovieTrailersByMovieNo(int movieNo) {
		return movieDao.getMovieTrailersByMovieNo(movieNo);
	}
	
	public Genre getGenreByName(String genreName) {
		return movieDao.getGenreByName(genreName);
	}
	
	public List<MovieGenre> getMovieGenresByMovieNo(int movieNo) {
		return movieDao.getMovieGenresByMovieNo(movieNo);
	}
	
	public Director getDirectorByNo(int directorNo) {
		return movieDao.getDirectorByNo(directorNo);
	}
	
	public Actor getActorByNo(int actorNo) {
		return movieDao.getActorByNo(actorNo);
	}
	
	public void insertActor(Actor actor) {
		movieDao.insertActor(actor);
	}

	public void insertMovieActor(MovieActor movieActor) {
		movieDao.insertMovieActor(movieActor);
	}
	
	public void insertDirector(Director director) {
		movieDao.insertDirector(director);
	}
	
	public void insertMovieDirector(MovieDirector movieDirector) {
		movieDao.insertMovieDirector(movieDirector);
	}
	
	public void insertRate(MovieRate rate) {
		movieDao.insertMovieRate(rate);
	}
	
	public void insertMovieGenre(MovieGenre movieGenre) {
		movieDao.insertMovieGenre(movieGenre);
	}
	
	public void insertMovieImage(MovieImage movieImage) {
		movieDao.insertMovieImage(movieImage);
	}
	
	public void insertMovieTrailer(MovieTrailer movieTrailer) {
		movieDao.insertMovieTrailer(movieTrailer);
	}
	
	public void insertMovie(MovieInsertForm form) {
		String saveDirectory = "C:\\workspace\\workspace-moviefan\\moviefan\\src\\main\\webapp\\resources\\images\\movie";
		
		Movie movie = movieDao.getMovieByMovieNo(form.getNo());
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
		movie.setProductionYear(form.getProductionYear());
		movie.setProducer(form.getProducer());
		movie.setSummary(form.getSummary());
		movieDao.insertMovie(movie);
		
		// MOVIE_GENRE 테이블 INSERT
		for (int i = 0; i < genres.length; i++) {
			Genre genre = movieDao.getGenreByName(genres[i]);
			MovieGenre movieGenre = new MovieGenre();
			movieGenre.setMovieNo(movie.getNo());
			movieGenre.setGenreNo(genre.getNo());
			movieGenre.setGenreName(genre.getName());
			movieDao.insertMovieGenre(movieGenre);
		}
		
		// DIRECTOR, MOVIE_DIRECTOR 테이블 INSERT
		if (directors != null) {
			for (int i = 0; i < directors.length; i++) {
				Director director = new Director();
				director.setName(directors[i]);
				try {
					director = (Director)getMoviePersonDetail(director, movie.getTitle());
				} catch (IOException e) {
					throw new MovieErrorException("영화진흥위원회 API로부터 감독정보를 불러오는데 실패하였습니다.");
				}
				
				// 이미 등록된 감독인 경우 저장하지 않는다
				if (movieDao.getDirectorByNo(director.getNo()) == null) {
					movieDao.insertDirector(director);
				}
				
				MovieDirector movieDirector = new MovieDirector();
				movieDirector.setMovieNo(movie.getNo());
				movieDirector.setDirectorNo(director.getNo());
				movieDirector.setDirectorName(director.getName());
				movieDirector.setDirectorNameEn(director.getNameEn());
				movieDao.insertMovieDirector(movieDirector);
			}
		}
		
		// ACTOR, MOVIE_ACTOR 테이블 INSERT
		if (actors != null) {
			for (int i = 0; i < actors.length; i++) {
				Actor actor = new Actor(); 
				actor.setName(actors[i]);
				try {
					actor = (Actor)getMoviePersonDetail(actor, movie.getTitle());
				} catch (IOException e) {
					throw new MovieErrorException("영화진흥위원회 API로부터 배우정보를 불러오는데 실패하였습니다.");
				}

				// 이미 등록된 배우인 경우 저장하지 않는다
				if (movieDao.getActorByNo(actor.getNo()) == null) {
					movieDao.insertActor(actor);
				}

				MovieActor movieActor = new MovieActor();
				movieActor.setMovieNo(movie.getNo());
				movieActor.setActorNo(actor.getNo());
				movieActor.setActorName(actor.getName());
				movieActor.setActorNameEn(actor.getNameEn());
				movieActor.setActorPriority(i);
				movieDao.insertMovieActor(movieActor);
			}
		}
		
		// 영화이미지 파일 업로드, MOVIE_IMAGE 테이블 INSERT 
		List<MultipartFile> images = form.getImages();
		for (MultipartFile multipartFile : images) {
			if (!multipartFile.isEmpty()) {
				try {
					String filename = multipartFile.getOriginalFilename();
	
					InputStream in = multipartFile.getInputStream();
					FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
					FileCopyUtils.copy(in, out);
	
					MovieImage movieImage = new MovieImage();
					movieImage.setMovieNo(movie.getNo());
					movieImage.setFilename(filename);
					movieDao.insertMovieImage(movieImage);
	
					in.close();
					out.close();
				} catch (IOException e) {
					throw new MovieErrorException("이미지 파일을 업로드에 실패하였습니다.");
				}
			}
		}
		
		// MOVIE_TRAILER 테이블 INSERT
		if (trailerTitles != null && trailerUrls != null) {
			for (int i = 0; i < trailerTitles.length; i++) {
				MovieTrailer movieTrailer = new MovieTrailer();
				movieTrailer.setMovieNo(movie.getNo());
				movieTrailer.setTitle(trailerTitles[i]);
				movieTrailer.setUrlAddress(trailerUrls[i]);
				movieDao.insertMovieTrailer(movieTrailer);
			}
		}
	}
	
	public void updateMovieDetail(MovieUpdateForm form) {
		String saveDirectory = "C:\\workspace\\workspace-moviefan\\moviefan\\src\\main\\webapp\\resources\\images\\movie";
		
		int no = form.getNo();
		String summary = form.getSummary();
		List<MultipartFile> images = form.getImages();
		String[] filenames = form.getFilenames();
		String[] trailerTitles = form.getTrailerTitles();
		String[] trailerUrls = form.getTrailerUrls();
		
		// MOVIE 테이블 UPDATE
		Movie movie = movieDao.getMovieByMovieNo(no);
		movie.setSummary(summary);
		movieDao.updateMovie(movie);
		
		// 폼에서 전달받은 이미지목록에 기존에 저장되어 있는 이미지가 존재 하는지 확인한다.
		// 존재하지 않다면 파일을 삭제한 뒤 MOVIE_IMAGE 테이블에서 해당 레코드를 삭제한다.
		List<MovieImage> movieImages = movieDao.getMovieImagesByMovieNo(no);
		for (MovieImage movieImage : movieImages) {
			boolean isExist = false;
			String filename = movieImage.getFilename();
			
			if (filenames != null) {
				for (int i = 0; i < filenames.length; i++) {
					if (filename.equals(filenames[i])) {
						isExist = true;
					}
				}
			}
			
			if (!isExist) {
				String filePath = saveDirectory + "\\" + filename;
				File file = new File(filePath);
				if (file.isFile() && file.exists()) {
					file.delete();
				}
				movieDao.deleteMovieImage(movieImage.getFilename());
			}
		}
		
		// 영화이미지 파일 업로드, MOVIE_IMAGE 테이블 INSERT
		for (MultipartFile multipartFile : images) {
			if (!multipartFile.isEmpty()) {
				try {
					String filename = multipartFile.getOriginalFilename();
					
					InputStream in = multipartFile.getInputStream();
					FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
					FileCopyUtils.copy(in, out);
					
					MovieImage movieImage = new MovieImage();
					movieImage.setMovieNo(movie.getNo());
					movieImage.setFilename(filename);
					movieDao.insertMovieImage(movieImage);
	
					in.close();
					out.close();
				} catch(IOException e) {
					throw new MovieErrorException("이미지 파일 업로드에 실패하였습니다.");
				}
			}
		}
		
		// 먼저 MOVIE_TRAILER 테이블에서 해당되는 영화의 모든 레코드를 삭제한뒤 폼에서 전달받은 트레일러 목록을 INSERT 한다.
		movieDao.deleteMovieTrailer(no);
		if (trailerTitles != null && trailerUrls != null) {
			for (int i = 0; i < trailerTitles.length; i++) {
				MovieTrailer movieTrailer = new MovieTrailer();
				movieTrailer.setMovieNo(movie.getNo());
				movieTrailer.setTitle(trailerTitles[i]);
				movieTrailer.setUrlAddress(trailerUrls[i]);
				movieDao.insertMovieTrailer(movieTrailer);
			}
		}
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
	
	public List<Movie> getMovieOrderByRating(){
		return movieDao.getMovieOrderByRating();
	}
	
	public void updateHomeTrailer(String url) {
		movieDao.updateHomeTrailerToN();
		movieDao.updateHomeTrailer(url);
	}
	
	public HomeTrailerDetailDto getHomeMovieDetail() {
		return movieDao.getHomeMovieDetail();
	}
	
	public List<HomeTrailerDto> getHomeTrailer(){
		List<HomeTrailerDto> dtoList = new ArrayList<>();
		List<Movie> movieList = movieDao.getAllMovies();
		for(Movie movie : movieList) {
			HomeTrailerDto dto = new HomeTrailerDto();
			dto.setTitle(movie.getTitle());
			dto.setTitleEn(movie.getTitleEn());
			dto.setOpenDate(movie.getOpenDate());
			dto.setSummary(movie.getSummary());
			dto.setTrailers(movieDao.getMovieTrailersByMovieNo(movie.getNo()));
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<Movie> getMovieByDate(String date){
		return movieDao.getMovieByDate(date);
	}
	
}
