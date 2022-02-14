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
		/*
			좌석 CSS 설정
		*/
		#seat a {
			background-color: #333;
			color: #fff;
			border-radius: 0;
			border-color: #f8f9fa;
			width: 30px;
			height: 30px;
			margin-right: -4px;
			padding: 0;
		}
		#seat .btn.active {
			background-color: #dc3545 !important;
		}
		#seat .btn.none {
			background-color: #f8f9fa !important;
			color: #f8f9fa;
		}	
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col-12">
			<h1 class="d-inline-flex" id="h1-page-title">영화선택</h1>
			<div class="d-inline-flex ms-2" id="spinner-box"></div>
		</div>
	</div>
	<div class="row">
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
				</tr>
			</tbody>
		</table>
		
		
		
		
		
		
		
		<table class="table table-bordered mb-0 d-none" id="table-seat">
			<thead>
				<tr>
					<th class="col-12 bg-dark text-center text-white border-start-0 border-end-0" colspan="4">인원/좌석</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-6 bg-light border-start-0" colspan="2">
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">일반</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>
						</div>
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">청소년</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>						
						</div>
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">경로</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>						
						</div>
					</td>
					<td class="col-6 bg-light border-end-0" colspan="2">
						<span class="align-middle">CGV강남</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle">5관(Laser) 10층</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle">남은좌석 <strong class="text-danger">161</strong>/172</span>
						<span class="d-block fs-3"><strong>2022.01.24(월) 09:00 ~ 11:38</strong></span>
					</td>
				</tr>
				<tr>
					<td class="col-9 bg-light border-start-0" colspan="3">
						<div class="d-flex justify-content-center">
							<div class="text-center" style="background-color: #333; color: #fff; width: 700px;">SCREEN</div>
						</div>
						<div class="d-flex justify-content-center my-5">
							<div class="" style="width: 452px; height: 400px;" id="seat">
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">A</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">B</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">C</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">D</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">E</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">F</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">G</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">H</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">I</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">J</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">K</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">L</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">M</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
							</div>
						</div>
					</td>
					<td class="col-3 bg-light border-end-0">
						<span class="d-block">선택</span>
						<span class="d-block">예매완료</span>
						<span class="d-block">선택불가</span>
					</td>
				</tr>
			</tbody>
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;" id="booking-nav">
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
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong></strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
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
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong></strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-lg disabled" href="/ticket/checkout" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>결제선택</strong></a>
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
				$("#movie-image-box").remove();
				var row = '<div class="col-1 d-flex justify-content-center align-items-center" id="movie-image-box">' 
					+ '</div>';
				$("#booking-nav").prepend(row);
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
				var showDate = $("#strong-show-date").text();
				$("#strong-show-date").empty().text(showDate + " " + showTime);
				$("#strong-cinema-hall").empty().text(cinemaHall);
				var row = '<a class="btn btn-danger btn-lg" href="/ticket/seat"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>';
				$("#next-btn-box").empty().append(row);
			}
		});
		
		$("#next-btn-box").on("click", ".btn-danger", function(event) {
			event.preventDefault();
			$("#h1-page-title").text("좌석선택");
			$("#table-movie").addClass("d-none");
			$("#table-seat").removeClass("d-none");
			var row = '<div class="col d-flex justify-content-start align-items-center">'
				+ '<a class="btn btn-lg" href="#" style="background-color: #333; color: #fff;"><i class="bi bi-caret-left-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>영화선택</strong></a>';
				+ '</div>';
			$("#booking-nav").prepend(row);
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
				if (movieNoSelected != null) {
					$("#movie-list-box a[data-movie-no=" + movieNoSelected + "]").addClass("active");
				}
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
				$spinnerBox.empty();
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
				if (showDateSelected != null) {
					$("#date-list-box a[data-show-date=" + showDateSelected + "]").addClass("active");
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
		var $timeListBox = $("#time-list-box").removeClass("text-center").empty();
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
				var cinemaHalls = showTimes.showTimesAvailable;
				
				for (var i = 0; i < cinemaHalls.length; i++) {
					var shows = cinemaHalls[i].shows;
					var row = '<div class="mb-3">' + '<div class="ps-1 mb-2"><span class="fw-bold">' + cinemaHalls[i].name + '</span> <span class="text-secondary">(총' + cinemaHalls[i].totalSeats + '석)</span></div>';
					for (var j = 0; j < shows.length; j++) {
						var showNo = shows[j].no;
						var startTime =shows[j].startTime;
						var endTime = shows[j].endTime;
						var totalSeatsAvailable = shows[j].totalSeatsAvailable;
						if (totalSeatsAvailable == 0) {
							row += '<a class="btn bg-secondary bg-opacity-10 border-light rounded-0 disabled" data-show-no="' + showNo + '" data-cinema-hall="' + cinemaHalls[i].name + '" href="#"><strike>' + moment(startTime).format('hh:mm') + '</strike></a>';
							row += '<span class="align-middle text-success ps-1" style="display: inline-block; width: 70px;"> ' + totalSeatsAvailable + '석</span>';
						} else {
							row += '<a class="btn bg-secondary bg-opacity-10 border-light rounded-0" data-show-no="' + showNo + '" data-cinema-hall="' + cinemaHalls[i].name + '" href="#">' + moment(startTime).format('hh:mm') + '</a>';
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
				$spinnerBox.empty();
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
				$spinnerBox.empty();
				if (movieDetail.images.length > 0) {
					var row = '<img src="/resources/images/movie/' + movieDetail.images[0].filename + '" style="width: 90px; height:125px;">';
					$movieImageBox.append(row);
				}
				var row = '<span class="d-block"><strong>' + movieDetail.title + '</strong></span>';
				row += '<span class="d-block"><strong>' + movieDetail.runtime + '분</strong></span>';
				row += '<span class="d-block"><strong>' + movieDetail.rate + '</strong></span>';
				$movieDetailBox.append(row);
			},
			error: function() {
				$spinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	






</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>