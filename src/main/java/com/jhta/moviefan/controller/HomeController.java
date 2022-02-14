package com.jhta.moviefan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.HomeTrailerDetailDto;
import com.jhta.moviefan.dto.MovieDetailDto;
import com.jhta.moviefan.dto.MyAccountCustomerCommentDto;
import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.form.KakaoLoginForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieCustomerCommentService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieCustomerComment;

@Controller
public class HomeController {
	
	static final Logger LOGGER = LogManager.getLogger(HomeController.class);

	@Autowired
	private CustomerService customerService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	MovieCustomerCommentService commentService;
	
	@GetMapping(value = {"/", "/home", "/index"})
	public String home(Model model) {
		
		String result = "";
		String key = "f9dd7d979e07f9f15431b68f1cf1ae1d";

		Calendar calendar = new GregorianCalendar();
		calendar.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(calendar.getTime());
		try {
			URL url = new URL("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="
					+ key +"&targetDt=" + date);

			BufferedReader bufferedReader;
			bufferedReader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bufferedReader.readLine();

			JSONParser parse = new JSONParser();
			JSONObject jsonObject = (JSONObject) parse.parse(result);
			JSONObject jsonObject2 = (JSONObject) jsonObject.get("boxOfficeResult");
			JSONArray jsonObject3 = (JSONArray) jsonObject2.get("dailyBoxOfficeList");

			List<Movie> movieList = new ArrayList<>();
			List<Integer> wishLists = new ArrayList<>();
			for(int i=0; i<jsonObject3.size(); i++) {
				JSONObject movies = (JSONObject) jsonObject3.get(i);
				Movie movie = new Movie();

				int movieCd = (Integer.parseInt((String)movies.get("movieCd")));
				movie = movieService.getMovieByMovieNo(movieCd);
				int wishList = customerService.countCustomerMovieWishListByMovieNo(movieCd);
				wishLists.add(wishList);
				movieList.add(movie);
			}
			
			HomeTrailerDetailDto dto = movieService.getHomeMovieDetail();
			model.addAttribute("movieTrailer", dto);
			model.addAttribute("movie", movieList);
			model.addAttribute("wishList", wishLists);
			
			List<MyAccountCustomerCommentDto> commentsForHomes = commentService.getCustomerCommentForHome();
			List<MovieDetailDto> rankedMovies = commentService.getRankedMovieWithDetail();
			
			LOGGER.info("commentsForHomes의값 : " + commentsForHomes);
			
			model.addAttribute("commentsForHomes", commentsForHomes);
			model.addAttribute("rankedMovies", rankedMovies);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	// 카카오 로그인 요청 처리
	@PostMapping("**/kakao-login")
	public String loginWithKakao(KakaoLoginForm form) {
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		Customer savedCustomer = customerService.loginWithKakao(customer);
		
		SessionUtils.addAttribute("LOGINED_CUSTOMER", savedCustomer);
		
		return "redirect:/";
	}
	
	@GetMapping("**/logout")
	public String logout(@LoginedCustomer Customer customer) {
		SessionUtils.removeAttribute("LOGINED_CUSTOMER");
		
		return "redirect:/home";
	}
	
	// 회원가입과 관련된 요청핸들러 메소드
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/registerform")
	public String registerForm() {
		return "member/registerform";
	}
	
	@PostMapping("/register")
	public String register(CustomerRegisterForm form, RedirectAttributes redirectAttributes) {
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		
		customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
		customer.setLoginType("NORMAL");
		
		customerService.registerCustomer(customer);
		redirectAttributes.addFlashAttribute("customer", customer);
		
		return "redirect:/member/completed";
	}
	
	@GetMapping("/member/completed")
	public String registerCompleted() {
		return "member/completed";
	}
	
	// 회원정보찾기
	@GetMapping("/findid")
	public String findIdForm() {
		return "member/findid";
	}
	
	@PostMapping("/findid")
	public String findId(CustomerRegisterForm form, RedirectAttributes redirectAttributes) {
		Customer savedCustomer = customerService.getCustomerByEmail(form.getEmail());
		
		redirectAttributes.addFlashAttribute("customer", savedCustomer);
		return "redirect:/member/findcompleted";
	}
	
	@GetMapping("/member/findcompleted")
	public String findCompleted() {
		return "member/findcompleted";
	}
	
	@GetMapping("/findpassword")
	public String findPasswordForm() {
		return "member/findpassword";
	}
	
	@PostMapping("/findpassword")
	public String findPassword(CustomerRegisterForm form, RedirectAttributes redirectAttributes) {
		Customer savedCustomer = customerService.getCustomerById(form.getId());
		
		redirectAttributes.addFlashAttribute("customer", savedCustomer);
		return "redirect:/member/newpassword";
	}

	@PostMapping("**/newpassword")
	public String changePassword(CustomerRegisterForm form) {
		
		Customer savedCustomer = customerService.getCustomerByEmail(form.getEmail());
		savedCustomer.setPassword(bCryptPasswordEncoder.encode(form.getPassword()));
		
		customerService.updateCustomerPassword(savedCustomer);
		
		return "redirect:/member/myinfo/modifycompleted";
	}
	
	@GetMapping("/member/newpassword")
	public String newPassword() {
		return "member/newpassword";
	}
	
	@PostMapping("/home/registerTrailer")
	public String registerTrailer(String url) {
		movieService.updateHomeTrailer(url);
		
		return "redirect:/";
	}
	
}
