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
			max-height: 430px !important;
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
		#ticket-btn-box a {
			border-color: #333; 
			width: 30px; 
			height: 30px;
		}
		/*
			좌석 CSS 설정
		*/
		#seat-box a, #seat-example-box a {
			background-color: #212529;
			color: #fff;
			border-radius: 0;
			border-color: #f8f9fa;
			width: 30px;
			height: 30px;
			margin-right: 0px;
			padding: 0;
		}
		#seat-box .btn.active, #seat-example-box .btn.active {
			background-color: #dc3545 !important;
		}
		#seat-box .btn.none, #seat-example-box .btn.none {
			background-color: #f8f9fa !important;
			color: #f8f9fa;
		}
		#seat-box .btn.light, #seat-example-box .btn.light {
			box-shadow: 0 0 0 3px #ed8c00 inset;
		}
		#seat-box .btn.wheelchair, #seat-example-box .btn.wheelchair {
			background-color: #00A300;
			border-radius: 10px 5px;
		}
		#seat-box .btn.sweetbox, #seat-example-box .btn.sweetbox {
			background-color: #FF0080;
			border-radius: 10px 5px;
		}
		/*
			오버레이 CSS 설정
		*/
		#overlay {
			position: fixed; /* Sit on top of the page content */
		 	width: 100%; /* Full width (cover the whole page) */
		  	height: 100%; /* Full height (cover the whole page) */
		  	top: 0;
		  	left: 0;
		  	right: 0;
		  	bottom: 0;
		  	background-color: rgba(0,0,0,0.5); /* Black background with opacity */
		  	z-index: 10000000 !important; /* Specify a stack order in case you're using a different order for other elements */
		  	cursor: pointer; /* Add a pointer on hover */
		}	
	</style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center d-none" id="overlay">
	<div class="spinner-border text-light" style="width: 15rem; height: 15rem; border: 1em solid; border-right-color: transparent;">
		<span class="visually-hidden">Loading...</span>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col-12">
			<h1 class="d-inline-flex" id="h1-page-title">영화선택</h1>
			<div class="d-inline-flex ms-2" id="spinner-box"></div>
		</div>
	</div>
	<div class="row">
		
		<!-- 영화선택 테이블 -->
	
		<table class="table table-bordered mb-0" id="table-movie">
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
											<a class="list-group-item bg-light border-light" data-city-no="${city.no }" data-cinema-no="${cinema.no }" data-cinema-name="${cinema.name }" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
										</c:when>
										<c:otherwise>
											<c:set var="name" value="${cinema.name }"/>
											<a class="list-group-item bg-light border-light d-none" data-city-no="${city.no }" data-cinema-no="${cinema.no }" data-cinema-name="${cinema.name }" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
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
						<div class="d-flex justify-content-center align-items-center" id="time-list-box" style="height: 430px;">
							<span>영화, 극장, 날짜를 선택해주세요.</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 좌석선택 테이블 -->
		
		<table class="table table-bordered mb-0 d-none" id="table-seat">
			<thead>
				<tr>
					<th class="col-12 bg-dark text-center text-white border-start-0 border-end-0" colspan="4">인원/좌석</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-6 bg-light border-start-0" colspan="2" id="ticket-btn-box">
						<span class="text-danger float-end">* 최대 6명 선택 가능</span>
						<div class="mb-1" id="adult-ticket-box">
							<span class="align-middle fw-bold" style="display: inline-block; width: 70px;">일반</span>
							<a class="btn btn-sm fw-bold active" href="#">0</a>
							<a class="btn btn-sm fw-bold" href="#">1</a>
							<a class="btn btn-sm fw-bold" href="#">2</a>
							<a class="btn btn-sm fw-bold" href="#">3</a>
							<a class="btn btn-sm fw-bold" href="#">4</a>
							<a class="btn btn-sm fw-bold" href="#">5</a>
							<a class="btn btn-sm fw-bold" href="#">6</a>
							<a class="btn btn-sm fw-bold disabled" href="#">7</a>
							<a class="btn btn-sm fw-bold disabled" href="#">8</a>
						</div>
						<div class="mb-1" id="youth-ticket-box">
							<span class="align-middle fw-bold" style="display: inline-block; width: 70px;">청소년</span>
							<a class="btn btn-sm fw-bold active" href="#">0</a>
							<a class="btn btn-sm fw-bold" href="#">1</a>
							<a class="btn btn-sm fw-bold" href="#">2</a>
							<a class="btn btn-sm fw-bold" href="#">3</a>
							<a class="btn btn-sm fw-bold" href="#">4</a>
							<a class="btn btn-sm fw-bold" href="#">5</a>
							<a class="btn btn-sm fw-bold" href="#">6</a>					
							<a class="btn btn-sm fw-bold disabled" href="#">7</a>
							<a class="btn btn-sm fw-bold disabled" href="#">8</a>			
						</div>
						<div class="mb-1" id="senior-ticket-box">
							<span class="align-middle fw-bold" style="display: inline-block; width: 70px;">경로</span>
							<a class="btn btn-sm fw-bold active" href="#">0</a>
							<a class="btn btn-sm fw-bold" href="#">1</a>
							<a class="btn btn-sm fw-bold" href="#">2</a>
							<a class="btn btn-sm fw-bold" href="#">3</a>
							<a class="btn btn-sm fw-bold" href="#">4</a>
							<a class="btn btn-sm fw-bold" href="#">5</a>
							<a class="btn btn-sm fw-bold" href="#">6</a>	
							<a class="btn btn-sm fw-bold disabled" href="#">7</a>
							<a class="btn btn-sm fw-bold disabled" href="#">8</a>		
						</div>
					</td>
					<td class="col-6 bg-light border-end-0" colspan="2">
						<span class="align-middle" id="seat-cinema-name">CGV강남</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle" id="seat-hall-name">5관(Laser) 10층</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle">남은좌석 <span class="fw-bold text-danger" id="seat-available">161</span>/<span class="fw-bold" id="seat-total">/172</span></span>
						<span class="d-block fs-3 fw-bold "><span id="seat-show-date">2022.01.24(월)</span> <span id="seat-start-time">09:00</span> ~ <span id="seat-end-time">11:38</span></span>
					</td>
				</tr>
				<tr>
					<td class="col-9 bg-light border-start-0" colspan="3" id="td-seat-map" style="opacity: 0.4; pointer-events: none;">
						<div class="d-flex justify-content-center">
							<div class="text-center" style="background-color: #212529; color: #fff; width: 700px;">SCREEN</div>
						</div>
						<div class="d-flex justify-content-center my-5">
							<div class="" id="seat-box">
							</div>
						</div>
					</td>
					<td class="col-3 bg-light border-end-0">
						<div id="seat-example-box">
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 active" href="#"></a> <span>선택</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 disabled" href="#"></a> <span>예매완료</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 disabled" href="#"><i class="bi bi-x-lg"></i></a> <span>선택불가</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 disabled" href="#"><i class="bi bi-arrow-left-right"></i></a> <span>거리두기 좌석</span></div>
							<br/>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 light" href="#"></a> <span>Light Zone</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1" href="#"></a> <span>일반석</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 wheelchair" href="#"></a> <span>장애인석</span></div>
							<div class="d-flex align-items-center mb-2"><a class="btn me-1 sweetbox" href="#"></a> <span>SWEETBOX</span></div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;" id="booking-nav">
			<div class="col d-flex justify-content-start align-items-center d-none" id="prev-btn-box">
				<a class="btn btn-lg" href="#" style="background-color: #333; color: #fff;">
					<i class="bi bi-caret-left-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>영화선택</strong>
				</a>
			</div>
			<div class="col-1 d-flex justify-content-center align-items-center d-none" id="movie-image-box">
			</div>
			<div class="col d-flex justify-content-center align-items-center">
				<div id="movie-detail-box">
					<span class="fs-3">영화선택</span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col-3 d-flex justify-content-center align-items-center">
				<span class="fs-3" id="span-select-cinema">극장선택</span>
				<div class="d-none" id="booking-detail-box" style="width: 230px;">
					<span class="d-block"><span style="display: inline-block; width: 70px;">극장</span><strong id="strong-cinema-name"></strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">일시</span><strong id="strong-show-date"></strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">상영관</span><strong id="strong-cinema-hall"></strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong id="strong-ticket-count"></strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3" id="span-select-seat"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
			</div>
			<div class="col d-flex justify-content-center align-items-center d-none" id="seat-detail-box">
				<div>
					<span class="d-block">좌석명: <span id="seat-type">일반석</span></span>
					<span class="d-block">좌석번호: <span id="seat-row-column">C1,C2</span></span>
				</div>
			</div>
			<div class="vr p-0 my-4 d-none" id="vr"></div>
			<div class="col d-flex justify-content-center align-items-center d-none" id="ticket-price-box">
				<div>
					<span class="d-block">일반: 10,000원 X 2</span>
					<span class="d-block">총금액: <strong class="text-danger">20,000원</strong></span>
				</div>
			</div>
			<div class="col d-flex justify-content-end align-items-center" id="next-btn-box">
				<a class="btn btn-lg disabled" href="#" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>
			</div>
		</div>
	</div>
</div>

<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col d-flex justify-content-start align-items-center">
				<a class="btn btn-lg" href="/ticket/movie" style="background-color: #333; color: #fff;"><i class="bi bi-caret-left-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>영화선택</strong></a>
			</div>
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
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong>일반 2명</strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block">좌석명: 일반석</span>
					<span class="d-block">좌석번호: C1,C2</span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block">일반: 10,000원 X 2</span>
					<span class="d-block">총금액: <strong class="text-danger">20,000원</strong></span>
				</div>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-danger btn-lg" href="/ticket/checkout"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>결제선택</strong></a>
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
				var cityNo = $("#city-list-box a.active").attr("data-city-no");
				var cinemaNo = $("#cinema-list-box a.active").attr("data-cinema-no");
				var showDate = $("#date-list-box a.active").attr("data-show-date");
				if ($("#cinema-list-box a.active").length != 0 && $("#date-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
					getCinemas(movieNo, showDate, cityNo, cinemaNo);
					getShowDates(movieNo, cinemaNo, showDate);
				} else {
					getCinemas(movieNo, showDate, cityNo, cinemaNo);
					getShowDates(movieNo, cinemaNo, showDate);
				}
				getMovieDetail(movieNo);
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
				if ($("#movie-list-box a.active").length != 0 && $("#date-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
					getMovies(cinemaNo, showDate, movieNo);
					getShowDates(movieNo, cinemaNo, showDate);
				} else {
					getMovies(cinemaNo, showDate, movieNo);
					getShowDates(movieNo, cinemaNo, showDate);
				}
				var cinemaName = $(this).attr("data-cinema-name");
				$("#span-select-cinema").remove();
				$("#booking-detail-box").removeClass("d-none");
				$("#strong-cinema-name").empty().text(cinemaName);
			}
		});
		
		$("#date-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#date-list-box a").removeClass("active");
				$(this).addClass("active");			
				var movieNo = $("#movie-list-box a.active").attr("data-movie-no");
				var cityNo = $("#city-list-box a.active").attr("data-city-no");
				var cinemaNo = $("#cinema-list-box a.active").attr("data-cinema-no");
				var showDate = $(this).attr("data-show-date");
				if ($("#movie-list-box a.active").length != 0 && $("#cinema-list-box a.active").length != 0) {
					getShowTimes(movieNo, cinemaNo, showDate);
					getMovies(cinemaNo, showDate, movieNo);
					getCinemas(movieNo, showDate, cityNo, cinemaNo);
				} else {
					getMovies(cinemaNo, showDate, movieNo);
					getCinemas(movieNo, showDate, cityNo, cinemaNo);
				}
				$("#span-select-cinema").remove();
				$("#booking-detail-box").removeClass("d-none");
				var showDay = moment(showDate).format('dd');
				$("#strong-show-date").empty().text(moment(showDate).format('YYYY.MM.DD') + "(" + showDay + ")");
			}
		});
		
		$("#time-list-box").on("click", ".btn", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#time-list-box a").removeClass("active");
				$(this).addClass("active");	
				var showTime = $(this).text();
				var cinemaHall = $(this).attr("data-cinema-hall");
				var showDate = $("#date-list-box a.active").attr("data-show-date");
				var showDay = moment(showDate).format('dd');
				$("#strong-show-date").empty().text(moment(showDate).format('YYYY.MM.DD') + "(" + showDay + ") " + showTime);
				$("#strong-cinema-hall").empty().text(cinemaHall);
				$("#next-btn-box").empty().append('<a class="btn btn-danger btn-lg" href="/ticket/seat"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>');
			}
		});
		
		$("#booking-nav").on("click", "#next-btn-box .btn-danger", function(event) {
			event.preventDefault();
			$("#h1-page-title").text("좌석선택");
			$("#prev-btn-box").removeClass("d-none");
			$("#span-select-seat").empty().append('<i class="bi bi-chevron-right"></i> 좌석선택');
			$("#next-btn-box").empty().append('<a class="btn btn-lg disabled" href="/ticket/checkout" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>결제선택</strong></a>');
			var cinemaName = $("#cinema-list-box a.active").attr("data-cinema-name");
			var hallName = $("#time-list-box a.active").attr("data-cinema-hall");
			var showDate = $("#date-list-box a.active").attr("data-show-date");
			var startTime = $("#time-list-box a.active").attr("data-start-time");
			var endTime = $("#time-list-box a.active").attr("data-end-time");
			var totalSeatsAvailable = $("#time-list-box a.active").attr("data-seat-available");
			var totalSeats = $("#time-list-box a.active").attr("data-seat-total");
			$("#seat-cinema-name").text(cinemaName);
			$("#seat-hall-name").text(hallName);
			$("#seat-available").text(totalSeatsAvailable);
			$("#seat-total").text(totalSeats);
			var showDay = moment(showDate).format('dd');
			$("#seat-show-date").text(moment(showDate).format('YYYY.MM.DD') + "(" + showDay + ")");
			$("#seat-start-time").text(startTime);
			$("#seat-end-time").text(endTime);

			$("#adult-ticket-box a").removeClass("active");
			$("#adult-ticket-box a:first-of-type").addClass("active");
			$("#youth-ticket-box a").removeClass("active");
			$("#youth-ticket-box a:first-of-type").addClass("active");
			$("#senior-ticket-box a").removeClass("active");
			$("#senior-ticket-box a:first-of-type").addClass("active");
			
			var showNo = $("#time-list-box a.active").attr("data-show-no");
			getSeats(showNo);
		});
		
		$("#booking-nav").on("click", "#prev-btn-box .btn", function(event) {
			event.preventDefault();
			$("#h1-page-title").text("영화선택");
			$("#table-movie").removeClass("d-none");
			$("#table-seat").addClass("d-none");
			$("#prev-btn-box").addClass("d-none");
			$("#span-select-seat").removeClass("d-none").empty().append('<span class="fs-3" id="span-select-seat"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>');
			$("#next-btn-box").empty().append('<a class="btn btn-danger btn-lg" href="/ticket/seat"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>');
		});
		
		var adult = 0;
		var youth = 0;
		var senior = 0;
		
		$("#ticket-btn-box").on("click", ".btn", function(event) {
			if ((adult + youth + senior) > 0) {
				$("#td-seat-map").removeAttr("style");
			} else if ((adult + youth + senior) == 0) {
				$("#td-seat-map").css("opacity", "0.4");
				$("#td-seat-map").css("pointer-events", "none");
			}
		});
		
		$("#adult-ticket-box").on("click", ".btn", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#adult-ticket-box a").removeClass("active");
				$(this).addClass("active");	
				adult = parseInt($(this).text());
			}
		});
		
		$("#youth-ticket-box").on("click", ".btn", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#youth-ticket-box a").removeClass("active");
				$(this).addClass("active");	
				youth = parseInt($(this).text());
			}
		});
		
		$("#senior-ticket-box").on("click", ".btn", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#senior-ticket-box a").removeClass("active");
				$(this).addClass("active");	
				senior = parseInt($(this).text());
			}
		});
		
		$("#seat-box").on("click", ".btn", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				if ((adult + youth + senior) > $("#seat-box a.active").length) {
					$(this).addClass("active");

					var seatNo = $(this).attr("data-seat-no");
					var seatRow = $(this).attr("data-seat-row");
					var seatColumn = $(this).attr("data-seat-column");
					var seatType = $(this).attr("data-seat-type");
					
					
					
				}
			}
		});
		
		
		
		
		
		
	});
	
	function getMovies(cinemaNo = null, showDate = null, movieNoSelected = null) {
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
				if (movieNoSelected != null) {
					$("#movie-list-box a[data-movie-no=" + movieNoSelected + "]").addClass("active");
				}
				$spinnerBox.empty();
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getCinemas(movieNo = null, showDate = null, cityNoSelected = null, cinemaNoSelected = null) {
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
				for (var i = 0; i < cinemas.citiesWithCinemas.length; i++) {
					var cityNo = cinemas.citiesWithCinemas[i].no;
					var cityName = cinemas.citiesWithCinemas[i].name;
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
							var cinemaName = cinemas.citiesWithCinemasAvailable[i].cinemas[j].name;
							var row = '';
							if (i == 0) {
								row += '<a class="list-group-item list-group-item-action bg-light border-light" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" data-cinema-name="' + cinemaName + '" href="#"><span class="fw-bold">' + cinemaName.replace('MVF ', ''); + '</span></a>';
							} else {
								row += '<a class="list-group-item list-group-item-action bg-light border-light d-none" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" data-cinema-name="' + cinemaName + '" href="#"><span class="fw-bold">' + cinemaName.replace('MVF ', ''); + '</span></a>';
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
						var cinemaName = cinemas.citiesWithCinemas[i].cinemas[j].name;
						if (i == 0) {
							if ($("#cinema-list-box a[data-cinema-no=" + cinemaNo + "]").length == 0) {
								var row = '<a class="list-group-item list-group-item-action bg-light border-light disabled opacity-50" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" data-cinema-name="' + cinemaName + '" href="#"><span class="fw-bold">' + cinemaName.replace('MVF', ''); + '</span></a>';
								$cinemaListBox.append(row);
							}	
						} else {
							if ($("#cinema-list-box a[data-cinema-no=" + cinemaNo + "]").length == 0) {
								var row = '<a class="list-group-item list-group-item-action bg-light border-light d-none disabled opacity-50" data-city-no="' + cityNo + '" data-cinema-no="' + cinemaNo + '" data-cinema-name="' + cinemaName + '" href="#"><span class="fw-bold">' + cinemaName.replace('MVF', ''); + '</span></a>';
								$cinemaListBox.append(row);
							}
						}
					}
				}
				if (cityNoSelected != null) {
					$("#city-list-box a").removeClass("active");
					$("#city-list-box a[data-city-no=" + cityNoSelected + "]").addClass("active");				
					$("#cinema-list-box a").addClass("d-none");
					$("#cinema-list-box a[data-city-no=" + cityNoSelected + "]").removeClass("d-none");
				}
				if (cinemaNoSelected != null) {
					$("#cinema-list-box a[data-cinema-no=" + cinemaNoSelected + "]").addClass("active");
				}
				$spinnerBox.empty();
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getShowDates(movieNo = null, cinemaNo = null, showDateSelected = null) {
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
				if (showDateSelected != null) {
					$("#date-list-box a[data-show-date=" + showDateSelected + "]").addClass("active");
				}
				$spinnerBox.empty();
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});	
	}
	
	function getShowTimes(movieNo, cinemaNo, showDate) {
		var $timeListBox = $("#time-list-box").empty().addClass("d-flex");
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
				$timeListBox.append(row);
			},
			success: function(showTimes) {
				$timeListBox.empty().removeClass("d-flex");
				var cinemaHalls = showTimes.showTimesAvailable;
				for (var i = 0; i < cinemaHalls.length; i++) {
					var shows = cinemaHalls[i].shows;
					var hallName = cinemaHalls[i].name;
					var totalSeats = cinemaHalls[i].totalSeats;
					var row = '<div class="mb-3">' + '<div class="ps-1 mb-2"><span class="fw-bold">' + hallName + '</span> <span class="text-secondary">(총' + totalSeats + '석)</span></div>';
					for (var j = 0; j < shows.length; j++) {
						var showNo = shows[j].no;
						var startTime = shows[j].startTime;
						var endTime = shows[j].endTime;
						var totalSeatsAvailable = shows[j].totalSeatsAvailable;
						if (totalSeatsAvailable == 0) {
							row += '<a class="btn bg-secondary bg-opacity-10 border-light rounded-0 disabled" data-show-no="' + showNo + '" data-cinema-hall="' + hallName + '" data-start-time="' + moment(startTime).format('HH:mm') + '" data-end-time="' + moment(endTime).format('HH:mm') + '" data-seat-total="' + totalSeats + '" data-seat-available="' + totalSeatsAvailable + '" href="#"><strike>' + moment(startTime).format('HH:mm') + '</strike></a>';
							row += '<span class="align-middle text-success ps-1" style="display: inline-block; width: 70px;"> ' + totalSeatsAvailable + '석</span>';
						} else {
							row += '<a class="btn bg-secondary bg-opacity-10 border-light rounded-0" data-show-no="' + showNo + '" data-cinema-hall="' + hallName + '" data-start-time="' + moment(startTime).format('HH:mm') + '" data-end-time="' + moment(endTime).format('HH:mm') + '" data-seat-total="' + totalSeats + '" data-seat-available="' + totalSeatsAvailable + '" href="#">' + moment(startTime).format('HH:mm') + '</a>';
							row += '<span class="align-middle text-success ps-1" style="display: inline-block; width: 70px;"> ' + totalSeatsAvailable + '석</span>';
						}
					}
					row += '</div>';
					if (i + 1 < cinemaHalls.length) {
						row += '<hr>';
					}
					$timeListBox.append(row);
				}
			},
			error: function() {
				$timeListBox.removeClass("d-flex");
				alert("오류가 발생하였습니다.");
			}
		});
	}
		
	function getMovieDetail(movieNo) {
		var $spinnerBox = $("#spinner-box").empty();
		var $movieImageBox = $("#movie-image-box").empty();
		var $movieDetailBox = $("#movie-detail-box").empty();
		$.ajax({
			type: "get",
			url: "/rest/ticket/movie/detail",
			data: {
				movieNo: movieNo
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-md" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$spinnerBox.append(row);
			},
			success: function(movieDetail) {
				if (movieDetail.images.length > 0) {
					var row = '<img src="/resources/images/movie/' + movieDetail.images[0].filename + '" style="width: 90px; height:125px;">';
					$movieImageBox.append(row).removeClass("d-none");
				}
				var row = '<span class="d-block"><strong>' + movieDetail.title + '</strong></span>';
				row += '<span class="d-block"><strong>' + movieDetail.runtime + '분</strong></span>';
				row += '<span class="d-block"><strong>' + movieDetail.rate + '</strong></span>';
				$movieDetailBox.append(row);
				$spinnerBox.empty();
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getSeats(showNo) {
		var $seatBox = $("#seat-box").empty();
		
		$.ajax({
			type: "get",
			url: "/rest/ticket/seat",
			data: {
				showNo: showNo
			},
			dataType: "json",
			beforeSend: function() {
				$("#overlay").removeClass("d-none");
			},
			success: function(showSeats) {
				var seats = showSeats.seats;
				var totalRows = showSeats.seatsTotalRows;
				
				var j = 0;
				for (var i = 0; i < totalRows; i++) {
					var column = 1;
					var section = 1;
					var row = '<div>';
					var isDone = false;
					while (!isDone) {
						if (column == 1) {
							row += '<a class="btn bg-light text-secondary fw-bold border-top border-bottom" href="#">' + seats[j].seatRow + '</a>';
						}
						while (seats[j].seatSection != section) {
							row += '<a class="btn disabled none" href="#"></a>';
							section++;
						}
						while (seats[j].seatColumn != column) {
							row += '<a class="btn disabled none" href="#"></a>';
							column++;
						}
						if (seats[j].isReserved == "N") {
							if (seats[j].seatType == "LIGHT") {
								row += '<a class="btn light" data-seat-no="' + seats[j].seatNo + '" data-seat-row="' + seats[j].seatRow + '" data-seat-column="' + seats[j].seatColumn + '" data-seat-type="' + seats[j].seatType + '" href="#">' + seats[j].seatColumn + '</a>';
							} else if (seats[j].seatType == "STANDARD") {
								row += '<a class="btn" data-seat-no="' + seats[j].seatNo + '" data-seat-row="' + seats[j].seatRow + '" data-seat-column="' + seats[j].seatColumn + '" data-seat-type="' + seats[j].seatType + '" href="#">' + seats[j].seatColumn + '</a>';
							} else if (seats[j].seatType == "WHEELCHAIR") {
								row += '<a class="btn wheelchair" data-seat-no="' + seats[j].seatNo + '" data-seat-row="' + seats[j].seatRow + '" data-seat-column="' + seats[j].seatColumn + '" data-seat-type="' + seats[j].seatType + '" href="#">' + seats[j].seatColumn + '</a>';
							} else if (seats[j].seatType == "SWEETBOX") {
								row += '<a class="btn sweetbox" data-seat-no="' + seats[j].seatNo + '" data-seat-row="' + seats[j].seatRow + '" data-seat-column="' + seats[j].seatColumn + '" data-seat-type="' + seats[j].seatType + '" href="#">' + seats[j].seatColumn + '</a>';
							} else if (seats[j].seatType == "DISTANCE") {
								row += '<a class="btn disabled" href="#"><i class="bi bi-arrow-left-right"></i></a>';
							}
						} else if (seats[j].isReserved == "Y") {
							row += '<a class="btn disabled" href="#">' + seats[j].seatColumn + '</a>';
						}
						if (j + 1 == seats.length || seats[j].seatRow != seats[j + 1].seatRow) {
							isDone = true;
						}
						column++;
						j++;
					}					
					row += '</div>';
					$seatBox.append(row);
				}
				$("#overlay").addClass("d-none");
				$("#table-movie").addClass("d-none");
				$("#table-seat").removeClass("d-none");
			},
			error: function() {
				$("#overlay").addClass("d-none");
				alert("오류가 발생하였습니다.");
			}
		});
	}
	






</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>