package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dao.CustomerDao;
import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.exception.MyCinemaErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.exception.RestRegisterErrorException;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerCinemaFavorites;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;

@Service
public class CustomerService {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private CinemaDao cinemaDao;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 관리자 여부
	public boolean isAdmin(int customerNo) {
		Customer savedCustomer = customerDao.getCustomerByNo(customerNo);
		if ("Y".equals(savedCustomer.getIsAdmin())) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	// 일반 회원가입
	public Customer registerCustomer(Customer customer) {
		Customer savedCustomer = customerDao.getCustomerById(customer.getId());
		if (savedCustomer != null) {
			throw new RestRegisterErrorException("중복되는 아이디입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByEmail(customer.getEmail());
		if (savedCustomer != null) {
			throw new RestRegisterErrorException("중복되는 이메일입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByNickName(customer.getNickName());
		if (savedCustomer != null) {
			throw new RestRegisterErrorException("중복되는 닉네임입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByPhoneNumber(customer.getPhoneNumber());
		if (savedCustomer != null) {
			throw new RestRegisterErrorException("중복되는 전화번호입니다.");
		}
		
		customerDao.insertCustomer(customer);
		
		return customer;
	}

	// 회원정보 수정 체크
	public void checkCustomer(Customer customer, Customer newInfo) {
		LOGGER.info("customer의 값: " + customer);
		LOGGER.info("newInfo의 값: " + newInfo);
		
		if (!customer.getEmail().equals(newInfo.getEmail())) {
			Customer savedCustomer = customerDao.getCustomerByEmail(newInfo.getEmail());
			if (savedCustomer != null) {
				throw new RestRegisterErrorException("중복되는 이메일입니다.");
			}
		}
		if (!customer.getNickName().equals(newInfo.getNickName())) {
			Customer savedCustomer = customerDao.getCustomerByNickName(newInfo.getNickName());
			if (savedCustomer != null) {
				throw new RestRegisterErrorException("중복되는 닉네임입니다.");
			}
		}
		if (!customer.getPhoneNumber().equals(newInfo.getPhoneNumber()) ) {
			Customer savedCustomer =  customerDao.getCustomerByPhoneNumber(newInfo.getPhoneNumber());
			if (savedCustomer != null) {
				throw new RestRegisterErrorException("중복되는 전화번호입니다.");
			}
		}
	}
	
	// 일반 로그인
	public Customer login(String id, String password) {
		Customer savedCustomer = customerDao.getCustomerById(id);
		
		if (savedCustomer == null) {
			throw new RestLoginErrorException("아이디가 존재하지 않습니다.");
		}
		if (!"NORMAL".equals(savedCustomer.getLoginType())) {
			throw new RestLoginErrorException("사이트에 가입된 사용자가 아닙니다.\n카카오 로그인을 이용해주세요.");
		}
		if ("Y".equals(savedCustomer.getIsWithdrawal())) {
			throw new RestLoginErrorException("탈퇴처리된 사용자입니다.");
		}
		if ("Y".equals(savedCustomer.getIsBanned())) {
			throw new RestLoginErrorException("이용 정지된 아이디입니다.");
		}
		if (!bCryptPasswordEncoder.matches(password, savedCustomer.getPassword())) {
			throw new RestLoginErrorException("비밀번호가 일치하지 않습니다.");	
		}
		
		return savedCustomer;
	}
	
	/**
	 * 카카오 로그인시 사용되는 로직
	 * @param customer 카카오 로그인 폼으로 전달된 객체
	 * @return 처음 로그인한 사용자는 DB에 사용자정보를 저장한 후에, 저장한 사용자 정보를 반환한다. 
	 * 		   다음에 로그인할 때에는 DB에 저장된 사용자 정보를 조회해서 바로 사용자 정보를 반환한다.
	 */
	public Customer loginWithKakao(Customer customer) {
		Customer savedCustomer = customerDao.getCustomerById(customer.getId());
		if (savedCustomer == null) {
			customer.setLoginType("KAKAO");
			customerDao.insertCustomer(customer);
			Customer newKakaoCustomer = customerDao.getCustomerById(customer.getId());
			LOGGER.info("처음 로그인한 사용자: " + newKakaoCustomer);
			return newKakaoCustomer;
		}
		return savedCustomer;
	}
	
	// 회원 찾기
	public Customer getCustomerByNo(int customerNo) {
		Customer savedCustomer = customerDao.getCustomerByNo(customerNo);
		return savedCustomer;
	}
	public Customer getCustomerById(String id) {
		Customer savedCustomer = customerDao.getCustomerById(id);
		return savedCustomer;
	}
	public Customer getCustomerByNickName(String nickName) {
		Customer savedCustomer = customerDao.getCustomerByNickName(nickName);
		return savedCustomer;
	}
	public Customer getCustomerByEmail(String email) {
		Customer savedCustomer = customerDao.getCustomerByEmail(email);
		return savedCustomer;
	}
	public Customer getCustomerByPhoneNumber(String phoneNumber) {
		Customer savedCustomer = customerDao.getCustomerByPhoneNumber(phoneNumber);
		return savedCustomer;
	}
	
	// 회원정보 업데이트
	public void updateCustomerInfo(Customer customer, Customer newInfo) {
		checkCustomer(customer, newInfo);
		
		if (!bCryptPasswordEncoder.matches(customer.getPassword(), newInfo.getPassword())) {
			newInfo.setPassword(bCryptPasswordEncoder.encode(newInfo.getPassword()));
		}
		newInfo.setNo(customer.getNo());
		customerDao.updateCustomer(newInfo);
	}
	// 회원비밀번호 업데이트
	public void updateCustomerPassword(Customer savedCustomer) {
		customerDao.updateCustomer(savedCustomer);
	}
	// 회원정보 삭제
	public void deleteCustomerInfo(int customerNo) {
		customerDao.deleteCustomerByNo(customerNo);
	}
	
	// 찜한 영화 관련 메소드
	public List<Movie> getAllCustomerMovieWishList(int customerNo) {
		List<CustomerMovieWishList> customerMovieWishList = customerDao.getAllCustomerMovieWishListByCustomerNo(customerNo);
		
		List<Movie> movies = new ArrayList<Movie>();

		for (CustomerMovieWishList item : customerMovieWishList) {
			Movie movie = movieDao.getMovieByMovieNo(item.getMovieNo());
			movies.add(movie);
		}
		
		return movies;
	}
	public int getTotalRows(CriteriaMyAccount criteriaMyAccount) {
		return customerDao.getCustomerMovieWishListTotalRows(criteriaMyAccount);
	}
	public List<Movie> searchCustomerMovieWishList(CriteriaMyAccount criteriaMyAccount) {
		List<CustomerMovieWishList> customerMovieWishList = customerDao.searchCustomerMovieWishList(criteriaMyAccount);
		
		List<Movie> movies = new ArrayList<Movie>();
		
		for (CustomerMovieWishList item : customerMovieWishList) {
			Movie movie = movieDao.getMovieByMovieNo(item.getMovieNo());
			movies.add(movie);
		}
		
		return movies;
	}
	public int countCustomerMovieWishListByMovieNo(int movieNo) {
		return customerDao.countCustomerMovieWishListByMovieNo(movieNo);
	}
	
	public void insertCustomerMovieWishListByMovieNo(CustomerMovieWishList wishList) {
		customerDao.insertCustomerMovieWishListByMovieNo(wishList);
	}
	
	// 찜한 극장 관련 메소드
	public List<Cinema> getCustomerFavoriteCinemaList(int customerNo) {
		List<Cinema> myCinemaList = new ArrayList<Cinema>();
		
		List<CustomerCinemaFavorites> customerCinemaFavorites = customerDao.getCustomerCinemaFavoritesByCustomerNo(customerNo);
		
		for (CustomerCinemaFavorites customerCinemaFavorite  : customerCinemaFavorites) {
			myCinemaList.add(cinemaDao.getCinemaByCinemaNo(customerCinemaFavorite.getCinemaNo()));
		}
		return myCinemaList;
	}
	public List<CityWithCinemasDto> getCityWithCinemas() {
		List<City> cities = cinemaDao.getAllCities();
		List<CityWithCinemasDto> dtos = new ArrayList<CityWithCinemasDto>();
		
		for (City city : cities) {
			CityWithCinemasDto dto = new CityWithCinemasDto();
			dto.setNo(city.getNo());
			dto.setName(city.getName());
			dto.setCinemas(cinemaDao.getCinemaListByCityNo(city.getNo()));
			dtos.add(dto);
		}
		return dtos;
	}
	@Transactional
	public void insertMyCinema(CustomerCinemaFavorites form) {
		List<CustomerCinemaFavorites> savedFavorites = customerDao.getCustomerCinemaFavoritesByCustomerNo(form.getCustomerNo());
		if (savedFavorites.size() == 3) {
			throw new MyCinemaErrorException("자주가는 극장은 최대 3곳까지 설정할 수 있습니다.");
		}
		for (CustomerCinemaFavorites saved : savedFavorites) {
			if (saved.getCinemaNo() == form.getCinemaNo()) {
				throw new MyCinemaErrorException("이미 자주가는 극장으로 등록한 영화관 입니다.");
			}
		}
		customerDao.insertMyCinema(form);
	}

	public void deleteMyCinema(CustomerCinemaFavorites form) {
		List<CustomerCinemaFavorites> savedFavorites = customerDao.getCustomerCinemaFavoritesByCustomerNo(form.getCustomerNo());
		if (savedFavorites.size() == 0) {
			throw new MyCinemaErrorException("자주가는 극장으로 등록한 영화관만 선택하실 수 있습니다.");
		}
		customerDao.deleteMyCinema(form);
	}
	
	public List<CustomerMovieWishList> getCustomerWishListByCustomerNo(int customerNo){
		return customerDao.getAllCustomerMovieWishListByCustomerNo(customerNo);
	}
	
	public String getMyWishList(int customerNo, int movieNo) {
		List<CustomerMovieWishList> wishList = customerDao.getAllCustomerMovieWishListByCustomerNo(customerNo);
		String value = "";
		for(CustomerMovieWishList wish : wishList) {
			if(wish.getMovieNo() == movieNo) {
				value = "Y";
			}
		}
		return value;
	}
	
	public void deleteCustomerMovieWishListByMovieNo(CustomerMovieWishList wishList) {
		customerDao.deleteCustomerMovieWishListByMovieNo(wishList);
	}
	
//	 한줄평
//	public void name() {
//		
//	}

}






















