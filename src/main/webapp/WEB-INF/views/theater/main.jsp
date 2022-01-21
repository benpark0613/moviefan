<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan :: 극장</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<!-- 영화관 선택부분 -->
		<div id="theater-list" class="row container-fluid py-5">
			<ul class="col list-group">
				<c:forEach var="cinema" items="${cinemaList }">
					<li><button id="btn-cimena-name" data-city-name="${cinema.cityName }">${cinema.cityName }</button></li>
					
					<li class="list-group-item">${cinema.name }</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div class="row row justify-content-center hstack gap-1">
		<button type="button" class="col-2 btn btn-secondary">상영시간표</button>
	  	<button type="button" class="col-2 btn btn-secondary">위치/주차안내</button>
	</div>
	
	<!-- 상영시간표 -->
	<div id="movie-timetable" class="row mt-5 mb-3">
		<ul class="list-group list-group-flush">
			<!-- 영화 상영정보 -->
			<li id="movie-info" class="list-group-item mb-3">
				<div>
					<a>영화제목/ </a>
					<span>장르/ </span>
					<span>러닝타임/ </span>
					<span>개봉일</span>
				</div>
				<div>
					<span>상영관 이름/ </span>
					<span>총 좌석수</span>
				</div>
				<div>
					<ul id="movie-reservable" class="list-group list-group-horizontal">
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					</ul>
				</div>
			</li>
			
			<li class="list-group-item mb-3">
				<div>
					<a>영화제목/ </a>
					<span>장르/ </span>
					<span>러닝타임/ </span>
					<span>개봉일</span>
				</div>
				<div>
					<span>상영관 이름/ </span>
					<span>총 좌석수</span>
				</div>
				<div>
					<ul class="list-group list-group-horizontal">
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					</ul>
				</div>
			</li>
			
			<li class="list-group-item">
				<div>
					<a>영화제목/ </a>
					<span>장르/ </span>
					<span>러닝타임/ </span>
					<span>개봉일</span>
				</div>
				<div>
					<span>상영관 이름/ </span>
					<span>총 좌석수</span>
				</div>
				<div>
					<ul class="list-group list-group-horizontal">
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
					</ul>
				</div>
			</li>
			
		</ul>
		<p class="border-top border-2 p-2 text-end">입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	

</script>
</html>