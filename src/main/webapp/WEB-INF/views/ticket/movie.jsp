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
	<style type="text/css">
		/*
			스크롤바 CSS 설정
		*/
		.list-group {
		    max-height: 500px !important;
		    overflow-y: auto !important;
		}
		#movie-list-box::-webkit-scrollbar-track,
		#date-list-box::-webkit-scrollbar-track,
		#cinema-list-box::-webkit-scrollbar-track {
			-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			border-radius: 10px;
			background-color: #F5F5F5;
		}
		#movie-list-box::-webkit-scrollbar,
		#date-list-box::-webkit-scrollbar, 
		#cinema-list-box::-webkit-scrollbar {
			width: 5px;
			background-color: #F5F5F5;
		}
		#movie-list-box::-webkit-scrollbar-thumb,
		#date-list-box::-webkit-scrollbar-thumb, 
		#cinema-list-box::-webkit-scrollbar-thumb {
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
			<h1>영화선택</h1>
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
									<a class="list-group-item list-group-item-action bg-light border-light d-flex align-items-center" data-movie-no="${movie.no }" href="#">
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
										<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light active" data-city-no="${city.no }" href="#">${city.name }(${fn:length(city.cinemas)})</a>
									</c:when>
									<c:otherwise>
										<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" data-city-no="${city.no }" href="#">${city.name }(${fn:length(city.cinemas)})</a>
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
											<c:set var = "name" value = "${cinema.name }"/>
											<a class="list-group-item list-group-item-action bg-light border-light" data-city-no="${city.no }" data-cinema-no="${cinema.no }" data-bs-toggle="list" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
										</c:when>
										<c:otherwise>
											<c:set var = "name" value = "${cinema.name }"/>
											<a class="list-group-item list-group-item-action bg-light border-light d-none" data-city-no="${city.no }" data-cinema-no="${cinema.no }" data-bs-toggle="list" href="#"><span class="fw-bold">${fn:replace(name, 'MVF ', '')}</span></a>
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
										<a class="list-group-item list-group-item-action bg-light border-light text-center disabled" id="" data-bs-toggle="list" href="#">
											<span class="d-block fw-bold" style="height: 15px;">${date.year }</span>
											<span class="d-block fw-bold fs-2" style="height: 35px;">${date.month }</span>
										</a>
									</c:when>
									<c:otherwise>
										<c:set var="year" value="${date.year }" />
										<c:set var="month" value="${date.month }" />
										<c:if test="${prevYear ne year  || prevMonth ne month }">
											<c:set var="prevYear" value="${date.year }"/>
											<c:set var="prevMonth" value="${date.month }" />
											<a class="list-group-item list-group-item-action bg-light border-light text-center disabled" id="" data-bs-toggle="list" href="#">
												<span class="d-block fw-bold" style="height: 15px;">${date.year }</span>
												<span class="d-block fw-bold fs-2" style="height: 35px;">${date.month }</span>
											</a>
										</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${date.day eq 7 }">
										<a class="list-group-item list-group-item-action bg-light border-light text-center text-primary" id="" data-bs-toggle="list" href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:when>
									<c:when test="${date.day eq 1 }">
										<a class="list-group-item list-group-item-action bg-light border-light text-center text-danger" id="" data-bs-toggle="list" href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:when>
									<c:otherwise>
										<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
											<span class="float-start fw-bold"><fmt:formatDate value="${date.date }" pattern="E" /></span>
											<span class="float-end fw-bold"><fmt:formatDate value="${date.date }" pattern="d" /></span>
										</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</td>
					<td class="col-3 bg-light border-start-0 align-middle text-center">
							<span>영화, 극장, 날짜를 선택해주세요.</span>
					</td>
					<!-- <td class="col-4 bg-light border-end-0">
						<div class="py-2">
							<p>2D(라스트 특가)5관(Laser) 10층(총172석)</p>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
						</div>
						<div class="py-2">
							<p>2D(라스트 특가)5관(Laser) 10층(총172석)</p>
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
	$(function() {
		
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
		
		$("#movie-list-box").on("click", ".list-group-item", function(event) {
			event.preventDefault();
			var isSelected = $(this).hasClass("active");
			if (!isSelected) {
				$("#movie-list-box a").removeClass("active");
				$(this).addClass("active");				
				var movieNo = $(this).attr("data-movie-no");
				console.log(movieNo);
			}
		});
		
	});

	
	function getMovieList() {
		
	}
	
	function getCityList() {
		
	}
	
	function getCinemaList() {
		
	}
	
	function getDateList() {
		
	}








</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>