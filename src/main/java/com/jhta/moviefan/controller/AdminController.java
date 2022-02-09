package com.jhta.moviefan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.form.NoticeInsertForm;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.NoticeService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.City;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.Notice;
import com.jhta.moviefan.vo.NoticeCategory;
import com.jhta.moviefan.vo.NoticeImage;
import com.jhta.moviefan.vo.Show;

@Controller
@RequestMapping("/admin")
public class AdminController {

	static final Logger logger = LogManager.getLogger(AdminController.class);

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private NoticeService noticeService;

	@GetMapping("home")
	public String home() {
		return "admin/home";
	}

	@GetMapping("dashboard")
	public String index() {
		return "admin/home";
	}

	@GetMapping("movie/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, Model model) {
		logger.info("요청 페이지번호 : " + page);

		int totalRecords = movieService.getMoviesTotalRows();
		Pagination pagination = new Pagination(page, totalRecords);

		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();

		List<Movie> movies = movieService.getMovies(beginIndex, endIndex);

		model.addAttribute("movies", movies);
		model.addAttribute("pagination", pagination);

		return "admin/movie/list";
	}

	@GetMapping("movie/search")
	public String search() {
		return "admin/movie/search";
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
	public String modify(int showNo, Model model) {
		MovieTimeTableDto detailSchedule = cinemaService.getMovieTimeTableByShowNo(showNo);

		model.addAttribute("detailSchedule", detailSchedule);

		return "admin/schedule/modify";
	}

	@PostMapping("/schedule/update")
	public String update(Show show) {
		cinemaService.updateSchedule(show);

		return "redirect:/admin/schedule/modify?showNo=" + show.getNo();
	}

	// 공지사항
	@GetMapping("/notice/list")
	public String getNoticeList(@LoginedCustomer Customer customer,
			@RequestParam(name = "page", required = false, defaultValue = "1") String page, Criteria criteria,
			Model model) {
		
		logger.info("customer의 값: " + customer);
		logger.info("세션에 저장된 값: " + SessionUtils.getAttribute("LOGINED_CUSTOMER"));
		
		int totalRecords = noticeService.getTotalRows(criteria);
		Pagination pagination = new Pagination(page, totalRecords);

		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<Notice> noticeList = noticeService.searchNoticeList(criteria);
		List<NoticeCategory> categories = noticeService.getAllNoticeCategories();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		
		return "admin/notice/list";
	}
	@GetMapping("/notice/detail")
	public String getNoticeDetail(@LoginedCustomer Customer customer, @RequestParam(name = "no", required = true) int no, Model model) {
		Notice notice = noticeService.getNoticeDetailByNoticeNo(no);
		NoticeImage noticeImage = noticeService.getNoticeImageByNoticeNo(notice.getNo());
		List<NoticeCategory> noticeCategories = noticeService.getAllNoticeCategories();
		
		model.addAttribute("categories", noticeCategories);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeImage", noticeImage);
		return "admin/notice/detail";
	}

	@GetMapping("/notice/write")
	public String writeNotice(@LoginedCustomer Customer customer) {
		return "write";
	}
	@Transactional
	@PostMapping("/notice/insert")
	public String insertNotice(@LoginedCustomer Customer customer, NoticeInsertForm form) throws IOException {
		String saveDirectory = "C:\\workspace\\workspace-moviefan\\moviefan\\src\\main\\webapp\\resources\\images\\admin";
		
		logger.info("customer의 값: " + customer);
		logger.info("어드민 홈 > 세션에 저장된 값: " + SessionUtils.getAttribute("LOGINED_CUSTOMER"));


		NoticeImage noticeImage = new NoticeImage();
		MultipartFile multipartFile = form.getUpfile();
		if (!multipartFile.isEmpty()) {
			String fileName = multipartFile.getOriginalFilename();
			noticeImage.setImage(fileName);
			InputStream in = multipartFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
			FileCopyUtils.copy(in, out);
		}
		
		Notice notice = new Notice();

		logger.info("customer의 값: " + customer);
		form.setCustomerNo(customer.getNo());
		BeanUtils.copyProperties(form, notice);
		noticeService.insertNewNotice(notice, noticeImage);

		return "redirect:/admin/notice/list";
	}
	
	@GetMapping("/notice/update")
	public String getNoticeUpdateForm(@RequestParam(name = "no", required = true) int noticeNo, Model model) {
		Notice notice = noticeService.getNoticeDetailByNoticeNo(noticeNo);
		model.addAttribute("notice", notice);
		return "update";
	}
	@PostMapping("/notice/update")
	public String updateNotice(@LoginedCustomer Customer customer, @RequestParam(name = "no", required = true) int noticeNo, 
			NoticeInsertForm form) {
		Notice notice = new Notice();
		BeanUtils.copyProperties(form, notice);
		notice.setNo(noticeNo);
		
		noticeService.updateNotice(notice);
		return "redirect:/admin/notice/detail?no=" + noticeNo;
	}
	
	@GetMapping("/notice/delete")
	public String deleteNotice(@LoginedCustomer Customer customer, @RequestParam(name = "no", required = true) int noticeNo) {
		Notice notice = noticeService.getNoticeDetailByNoticeNo(noticeNo);
		notice.setIsDeleted("Y");
		noticeService.updateNotice(notice);
		
		return "redirect:/admin/notice/list";
	}

}



















