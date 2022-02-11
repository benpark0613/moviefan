<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
	<style type="text/css">
		/*
			스크롤바 CSS 설정
		*/
		.list-group {
		    max-height: 500px !important;
		    overflow-y: auto !important;
		}
		#time-list-box {
			max-height: 450px !important;
		    overflow-y: auto !important;
		}
		#movie-list-box::-webkit-scrollbar-track,
		#date-list-box::-webkit-scrollbar-track,
		#cinema-list-box::-webkit-scrollbar-track,
		#time-list-box::-webkit-scrollbar-track {
			-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			border-radius: 10px;
			background-color: #F5F5F5;
		}
		#movie-list-box::-webkit-scrollbar,
		#date-list-box::-webkit-scrollbar, 
		#cinema-list-box::-webkit-scrollbar,
		#time-list-box::-webkit-scrollbar {
			width: 5px;
			background-color: #F5F5F5;
		}
		#movie-list-box::-webkit-scrollbar-thumb,
		#date-list-box::-webkit-scrollbar-thumb, 
		#cinema-list-box::-webkit-scrollbar-thumb,
		#time-list-box::-webkit-scrollbar-thumb {
			border-radius: 10px;
			-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
			background-color: #555;
		} 
		/*
			리스트 CSS 설정
		*/
		.list-group-item.active {
			color: #fff !important;
    		background-color: #212529 !important;
		}
		.list-group-item:hover {
			color: #333;
		}
		#city-list-box .list-group-item.active {
			color: #333 !important;
			background-color: #f8f9fa !important;
		}
		/*
			버튼 CSS 설정
		*/
		.btn {
			transition: none !important;
		}
		.btn.active {
			color: #fff !important;
    		background-color: #212529 !important;
		}
		.btn:focus {
		 	outline: none !important;
			box-shadow: none !important;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col-12">
			<h1 class="d-inline-flex">영화선택</h1>
			<div class="d-inline-flex ms-2" id="spinner-box"></div>
		</div>
	</div>
	<div class="row">
		<table class="table table-bordered mb-0">
			<thead>
				<tr>
					<th class="col-3 bg-dark text-center text-white border-start-0">영화</th>
					<th class="col-4 bg-dark text-center text-white" colspan="2">극장</th>
					<th class="col-1 bg-dark text-center text-white">날짜</th>
					<th class="col-4 bg-dark text-center text-white border-end-0">시간</th>
				</tr>
			</thead>
			<tbody style="height: 550px;">
				<tr>
				<c:choose>
					<c:when test="${empty movies }">
						<td class="col-3 bg-light border-start-0 align-middle text-center">
							<span>상영중인 영화가 없습니다.</span>
						</td>
					</c:when>
					<c:otherwise>
						<td class="col-3 bg-light border-start-0">
							<div class="list-group rounded-0" id="movie-list-box">
								<c:forEach var="movie" items="${movies }" varStatus="loop">
									<a class="list-group-item bg-light border-light d-flex align-items-center" data-movie-no="${movie.no }" href="#">
										<c:choose>
											<c:when test="${movie.rate == '전체관람가' }"><span class="badge bg-success rounded-pill me-1">전체</span></c:when>
											<c:when test="${movie.rate == '12세이상관람가' }"><span class="badge bg-primary rounded-pill me-1">12</span></c:when>
											<c:when test="${movie.rate == '15세이상관람가' }"><span class="badge bg-warning rounded-pill me-1">15</span></c:when>
											<c:when test="${movie.rate == '청소년관람불가' }"><span class="badge bg-danger rounded-pill me-1">청불</span></c:when>
										</c:choose>
										<span class="fw-bold">${movie.title }</span>
									</a>
								</c:forEach>  
							</div>
						</td>
					</c:otherwise>
					</c:choose>
					<td class="col-2 bg-light pe-0 border-end-0">
						<div class="list-group rounded-0" id="city-list-box">
							<c:forEach var="city" items="${cities }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.count eq 1 }">
										<a class="list-group-item bg-secondary bg-opacity-10 border-light text-end active" data-city-no="${city.no }" href="#">${city.name }(${fn:length(city.cinemas)})</a>
									</c:when>
									<c:otherwise>
										<a class="list-group-item bg-secondary bg-opacity-10 border-light text-end" data-city-no="${city.no }" href="#">${city.name }(${fn:length(city.cinemas)})</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</td>
					<td class="col-2 bg-light ps-0 border-start-0">
						<div class="list-group rounded-0" id="cinema-list-box">
							<c:forEach var="city" items="${cities }" varStatus="loop">
								<c:forEach var="cinema" items="${city.cinemas }">
									<c:choose>
										<c:when test="${loop.count eq 1 }">
											<c:set var="name" value="${cinema.name }"/>
											<a class="list-group-item bg-light border-light" data-city-no="${city.no }" data-cinema-no="${cinema.no }" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
										</c:when>
										<c:otherwise>
											<c:set var="name" value="${cinema.name }"/>
											<a class="list-group-item bg-light border-light d-none" data-city-no="${city.no }" data-cinema-no="${cinema.no }" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:forEach>
						</div>
					</td>
					<td class="col-1 bg-light">
						<div class="list-group rounded-0" id="date-list-box">
							<c:forEach var="date" items="${dates }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.count eq 1 }">
										<c:set var="prevYear" value="${date.year }"/>
										<c:set var="prevMonth" value="${date.month }" />
										<div class="bg-light border-light text-center text-secondary text-opacity-10 fw-bold">
											<span class="d-block" style="height: 15px;">${date.year }</span>
											<span class="d-block fs-2" style="height: 45px;">${date.month }</span>
										</div>
									</c:when>
									<c:otherwise>
										<c:set var="year" value="${date.year }" />
										<c:set var="month" value="${date.month }" />
										<c:if test="${prevYear ne year  || prevMonth ne month }">
											<c:set var="prevYear" value="${date.year }"/>
											<c:set var="prevMonth" value="${date.month }" />
											<div class="bg-light border-light text-center text-secondary text-opacity-10 fw-bold">
												<span class="d-block" style="height: 15px;">${date.year }</span>
												<span class="d-block fs-2" style="height: 45px;">${date.month }</span>
											</div>
										</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${date.day eq 7 }">
										<fmt:formatDate var="showDate" value="${date.date }" pattern="yyyy-MM-dd" />
										<a class="list-group-item bg-light border-light text-center text-primary" data-show-date="${showDate }" href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:when>
									<c:when test="${date.day eq 1 }">
										<fmt:formatDate var="showDate" value="${date.date }" pattern="yyyy-MM-dd" />
										<a class="list-group-item bg-light border-light text-center text-danger"  data-show-date="${showDate }"  href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:when>
									<c:otherwise>
										<fmt:formatDate var="showDate" value="${date.date }" pattern="yyyy-MM-dd" />
										<a class="list-group-item bg-light border-light text-center" data-show-date="${showDate }" href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</td>
					<td class="col-4 bg-light border-end-0">
						<div class="mt-2 ps-1 fw-bold">
							<i class="bi bi-brightness-high-fill text-warning"></i> 조조 
							<i class="bi bi-moon-fill text-primary"></i> 심야
						</div>
						<hr>
						<div class="text-center" id="time-list-box">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<span>영화, 극장, 날짜를 선택해주세요.</span>
						</div>
					</td>
					<!-- <td class="col-4 bg-light border-end-0">
						<div class="ps-1 fw-bold">
							<i class="bi bi-brightness-high-fill text-warning"></i> 조조 
							<i class="bi bi-moon-fill text-primary"></i> 심야
						</div>
						<hr>
						<div class="mb-3" id="">
							<div class="ps-1 mb-2">2D(라스트 특가)5관(Laser) 10층(총172석)</div>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;"><i class="bi bi-brightness-high-fill text-warning"></i>155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
						</div>
						<hr>
						<div class="mb-3" id="">
							<div class="ps-1 mb-2">2D(라스트 특가)5관(Laser) 10층(총172석)</div>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
						</div>
					</td> -->
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3">영화선택</span>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3">극장선택</span>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-lg disabled" href="/ticket/seat" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>
			</div>
		</div>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col-1 d-flex justify-content-center align-items-center">
				<img src="/resources/images/84949_185.jpg" style="width: 74px; height:104px;">
			</div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block"><strong>스파이더맨-노웨이홈</strong></span>
					<span class="d-block"><strong>2D(라스트특가)</strong></span>
					<span class="d-block"><strong>12세 관람가</strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col-3 d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block"><span style="display: inline-block; width: 70px;">극장</span><strong>CGV 강남</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">일시</span><strong>2022.1.24(월) 18:00</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">상영관</span><strong>5관(Laser) 10층</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong></strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-danger btn-lg" href="/ticket/seat"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	moment.locale('ko');
	$(function() {
		$("#movie-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#movie-list-box a").removeClass("active");
				$(this).addClass("active");				
				var movieNo = $(this).attr("data-movie-no");
				var cinemaNo = $("#cinema-list-box a.active").attr("data-cinema-no");
				var showDate = $("#date-list-box a.active").attr("data-show-date");
				if ($("#cinema-list-box a.active").length == 0) {
					getCinemas(movieNo, showDate);
				}
				if ($("#date-list-box a.active").length == 0) {
					getShowDates(movieNo, cinemaNo);
				}
				if ($("#cinema-list-box a.active").length != 0 && $("#date-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
				}
			}
		});
		
		$("#city-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#city-list-box a").removeClass("active");
				$(this).addClass("active");				
				var cityNo = $(this).attr("data-city-no");
				$("#cinema-list-box a").addClass("d-none");
				$("#cinema-list-box a[data-city-no=" + cityNo + "]").removeClass("d-none");
			}
		});
		
		$("#cinema-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#cinema-list-box a").removeClass("active");
				$(this).addClass("active");				
				var movieNo = $("#movie-list-box a.active").attr("data-movie-no");
				var cinemaNo = $(this).attr("data-cinema-no");
				var showDate = $("#date-list-box a.active").attr("data-show-date");
				if ($("#movie-list-box a.active").length == 0) {
					getMovies(cinemaNo, showDate);
				}
				if ($("#date-list-box a.active").length == 0) {
					getShowDates(movieNo, cinemaNo);
				}
				if ($("#movie-list-box a.active").length != 0 && $("#date-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
				}
			}
		});
		
		$("#date-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#date-list-box a").removeClass("active");
				$(this).addClass("active");			
				var movieNo = $("#movie-list-box a.active").attr("data-movie-no");
				var cinemaNo = $("#cinema-list-box a.active").attr("data-cinema-no");
				var showDate = $(this).attr("data-show-date");
				if ($("#movie-list-box a.active").length == 0) {
					getMovies(cinemaNo, showDate);
				}
				if ($("#cinema-list-box a.active").length == 0) {
					getCinemas(movieNo, showDate);
				}
				if ($("#movie-list-box a.active").length != 0 && $("#cinema-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
				}
			}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	});
	
	function getMovies(cinemaNo = null, showDate = null) {
		var $spinnerBox = $("#spinner-box").empty();
		var $movieListBox = $("#movie-list-box").empty();
		$.ajax({
			type: "get",
			url: "/rest/ticket/movie",
			data: {
				cinemaNo: cinemaNo,
				showDate: showDate
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-md" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$spinnerBox.append(row);
			},
			success: function(movies) {
				$spinnerBox.empty();
				for (var i = 0; i < movies.moviesAvailable.length; i++) {
					var movieNo = movies.moviesAvailable[i].no;
					var row = '<a class="list-group-item list-group-item-action bg-light border-light d-flex align-items-center" data-movie-no="' + movieNo + '" href="#">';
					if (movies.moviesAvailable[i].rate == "전체관람가") {
						row += '<span class="badge bg-success rounded-pill me-1">전체</span>';
					} else if (movies.moviesAvailable[i].rate == "12세이상관람가") {
						row += '<span class="badge bg-primary rounded-pill me-1">12</span>';
					} else if (movies.moviesAvailable[i].rate == "15세이상관람가") {
						row += '<span class="badge bg-warning rounded-pill me-1">15</span>';
					} else if(movies.moviesAvailable[i].rate == "청소년관람불가") {
						row += '<span class="badge bg-danger rounded-pill me-1">청불</span>';
					}
					row += '<span class="fw-bold">' + movies.moviesAvailable[i].title + '</span>';
					row += '</a>';
					$movieListBox.append(row);
				}
				for (var i = 0; i < movies.moviesNowPlaying.length; i++) {
					var movieNo = movies.moviesNowPlaying[i].no;
					 if ($("#movie-list-box a[data-movie-no=" + movieNo + "]").length == 0) {
						var row = '<a class="list-group-item list-group-item-action bg-light border-light d-flex align-items-center disabled opacity-50" data-movie-no="' + movieNo + '" href="#">';
						if (movies.moviesNowPlaying[i].rate == "전체관람가") {
							row += '<span class="badge bg-success rounded-pill me-1">전체</span>';
						} else if (movies.moviesNowPlaying[i].rate == "12세이상관람가") {
							row += '<span class="badge bg-primary rounded-pill me-1">12</span>';
						} else if (movies.moviesNowPlaying[i].rate == "15세이상관람가") {
							row += '<span class="badge bg-warning rounded-pill me-1">15</span>';
						} else if(movies.moviesNowPlaying[i].rate == "청소년관람불가") {
							row += '<span class="badge bg-danger rounded-pill me-1">청불</span>';
						}
						row += '<span class="fw-bold">' + movies.moviesNowPlaying[i].title + '</span>';
						row += '</a>';
						$movieListBox.append(row);
					 }
				}
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getCinemas(movieNo = null, showDate = null) {
		var $spinnerBox = $("#spinner-box").empty();
		var $cityListBox = $("#city-list-box").empty();
		var $cinemaListBox = $("#cinema-list-box").empty();
		$.ajax({
			type: "get",
			url: "/rest/ticket/cinema",
			data: {
				movieNo: movieNo,
				showDate: showDate
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-md" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$spinnerBox.append(row);
			},
			success: function(cinemas) {
				$spinnerBox.empty();
				for (var i = 0; i < cinemas.citiesWithCinemas.length; i++) {
					var cityNo = cinemas.citiesWithCinemas[i].no;
					var cityName = cinemas.citiesWithCinemas[i].name;
					// var cinemaCount = cinemas.citiesWithCinemas[i].cinemas.length;
					var row = '';
					if (i == 0) {
						row += '<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light text-end active" data-city-no="' + cityNo + '" href="#">' + cityName + '(0)</a>';
					} else {
						row += '<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light text-end" data-city-no="' + cityNo + '" href="#">' + cityName + '(0)</a>';
					}
					$cityListBox.append(row);
				}
				for (var i = 0; i < cinemas.citiesWithCinemasAvailable.length; i++) {
					var cityNo = cinemas.citiesWithCinemasAvailable[i].no;
					var cityName = cinemas.citiesWithCinemasAvailable[i].name;
					var cinemaCount = cinemas.citiesWithCinemasAvailable[i].cinemas.length;
					$("#city-list-box a[data-city-no=" + cityNo + "]").empty().append(cityName + '(' + cinemaCount + ')');
					if (cinemaCount != 0) {
						for (var j = 0; j < cinemaCount; j++) {
							var cinemaNo = cinemas.citiesWithCinemasAvailable[i].cinemas[j].no;
							var cinemaName = cinemas.citiesWithCinemasAvailable[i].cinemas[j].name.replace('MVF ', '');
							var row = '';
							if (i == 0) {
								row += '<a class="list-group-item list-group-item-action bg-light border-light" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" href="#"><span class="fw-bold">' + cinemaName + '</span></a>';
							} else {
								row += '<a class="list-group-item list-group-item-action bg-light border-light d-none" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" href="#"><span class="fw-bold">' + cinemaName + '</span></a>';
							}
							$cinemaListBox.append(row);
						}
					}
				}
				for (var i = 0; i < cinemas.citiesWithCinemas.length; i++) {
					var cityNo = cinemas.citiesWithCinemas[i].no;
					var cityName = cinemas.citiesWithCinemas[i].name;
					var cinemaCount = cinemas.citiesWithCinemas[i].cinemas.length;
					for (var j = 0; j < cinemaCount; j++) {
						var cinemaNo = cinemas.citiesWithCinemas[i].cinemas[j].no;
						var cinemaName = cinemas.citiesWithCinemas[i].cinemas[j].name.replace('MVF', '');
						if (i == 0) {
							if ($("#cinema-list-box a[data-cinema-no=" + cinemaNo + "]").length == 0) {
								var row = '<a class="list-group-item list-group-item-action bg-light border-light disabled opacity-50" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" href="#"><span class="fw-bold">' + cinemaName + '</span></a>';
								$cinemaListBox.append(row);
							}	
						} else {
							if ($("#cinema-list-box a[data-cinema-no=" + cinemaNo + "]").length == 0) {
								var row = '<a class="list-group-item list-group-item-action bg-light border-light d-none disabled opacity-50" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" href="#"><span class="fw-bold">' + cinemaName + '</span></a>';
								$cinemaListBox.append(row);
							}
						}
					}
				}
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getShowDates(movieNo = null, cinemaNo = null) {
		var $spinnerBox = $("#spinner-box").empty();
		var $dateListBox = $("#date-list-box").empty();
		$.ajax({
			type: "get",
			url: "/rest/ticket/date",
			data: {
				movieNo: movieNo,
				cinemaNo: cinemaNo
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-md" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$spinnerBox.append(row);
			},
			success: function(showDates) {
				$spinnerBox.empty();
				var prevYear;
				var prevMonth;
				for (var i = 0; i < showDates.showDatesNowPlaying.length; i++) {
					var year = showDates.showDatesNowPlaying[i].year;
					var month = showDates.showDatesNowPlaying[i].month;
					var day =  showDates.showDatesNowPlaying[i].day;
					var date =  showDates.showDatesNowPlaying[i].date;
					if (i == 0) {
						prevYear = year;
						prevMonth = month;
						var row = '<div class="bg-light border-light text-center text-secondary text-opacity-10 fw-bold">';
						row += '<span class="d-block" style="height: 15px;">' + year + '</span>';
						row += '<span class="d-block fs-2" style="height: 45px;">' + month + '</span>';
						$dateListBox.append(row);
					} else {
						if (prevYear != year || prevMonth != month) {
							prevYear = year;
							prevMonth = month;
							var row = '<div class="bg-light border-light text-center text-secondary text-opacity-10 fw-bold">';
							row += '<span class="d-block" style="height: 15px;">' + year + '</span>';
							row += '<span class="d-block fs-2" style="height: 45px;">' + month + '</span>';
							$dateListBox.append(row);
						}
					}
					if (day == 7) {
						 var row = '<a class="list-group-item list-group-item-action bg-light border-light text-center text-primary disabled opacity-50" data-show-date="' + moment(date).format('YYYY-MM-DD') + '" href="#">';
						 row += '<span class="float-start fw-bold">' + moment(date).format('dd') + '</span>';
						 row += '<span class="float-end fw-bold">' + moment(date).format('D') + '</span>';
						 row += '</a>';
						 $dateListBox.append(row);
					} else if (day == 1) {
						var row = '<a class="list-group-item list-group-item-action bg-light border-light text-center text-danger disabled opacity-50" data-show-date="' + moment(date).format('YYYY-MM-DD') + '" href="#">';
						row += '<span class="float-start fw-bold">' + moment(date).format('dd') + '</span>';
						row += '<span class="float-end fw-bold">' + moment(date).format('D') + '</span>';
						row += '</a>';
						$dateListBox.append(row);
					} else {
						var row = '<a class="list-group-item list-group-item-action bg-light border-light text-center disabled opacity-50" data-show-date="' + moment(date).format('YYYY-MM-DD') + '" href="#">';
						row += '<span class="float-start fw-bold">' + moment(date).format('dd') + '</span>';
						row += '<span class="float-end fw-bold">' + moment(date).format('D') + '</span>';
						row += '</a>';
						$dateListBox.append(row);
					}
				}
				for (var i = 0; i < showDates.showDatesAvailable.length; i++) {
					var date =  showDates.showDatesAvailable[i].date;
					var showDate = moment(date).format('YYYY-MM-DD');
					$("#date-list-box a[data-show-date=" + showDate + "]").removeClass("disabled").removeClass("opacity-50");
				}
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});	
	}
	
	function getShowTimes(movieNo, cinemaNo, showDate) {
		var $spinnerBox = $("#spinner-box").empty();
		var $tdShowTime = $("#td-time").removeClass("align-middle").removeClass("text-center").empty();
		$.ajax({
			type: "get",
			url: "/rest/ticket/time",
			data: {
				movieNo: movieNo,
				cinemaNo: cinemaNo,
				showDate: showDate
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-md" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$spinnerBox.append(row);
			},
			success: function(showTimes) {
				$spinnerBox.empty();
				
				
				
				
				
				
				
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		})
		
		
		
		
		
		
		
		
	}
		
		
	








</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>