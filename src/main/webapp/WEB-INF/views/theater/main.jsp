<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	a {
		color: black;
		text-decoration: none;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<!-- 점보트론 -->
	<div class="p-5 mt-5 mb-5 bg-light rounded-3">
		<!-- 지역 선택 - 셀렉트박스로 바꿀까..? -->
		<c:forEach var="movieTimeTable" items="${movieTimeTableList }">
			<button id="cinema-city" class="btn btn-dark fs-4"><strong>${movieTimeTable.cityName }</strong></button>
			<!-- 지역별 영화관 이름 -->
			<div class="container mt-4">
				<div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2">
		    		<div class="col">
						<div id="cinema-name" class="p-4 border bg-light text-center">
				      		<a href="#" class="fs-5"><strong>${movieTimeTable.cinemaName }</strong></a>
				      	</div>
		    		</div>
				</div>
			</div>
  		</c:forEach>
	</div>
	<!-- 안내버튼 -->
	<div class="row mt-5 mb-5 justify-content-center hstack gap-2">
		<a href="/theater/price" id="price-info" class="col-2 btn btn-success">관람가격 안내</a>
		<a href="/theater/location" id="location-info" class="col-2 btn btn-success">위치/주차 안내</a>
	</div>
	<!-- 상영시간표 -->
	<div id="movie-timetable" class="row mt-5 mb-5">
		<table class="table">
			<thead>
				<c:forEach var="movieTimeTable" items="${movieTimeTableList }">
					<tr>
						<th>
							<span class="fs-2">${movieTimeTable.title }</span>
							<span class="ml-3">${movieTimeTable.genre } / </span>
							<span><fmt:formatDate value="${movieTimeTable.releaseDate }" pattern="yyyy년 M월 d일"/> 개봉</span>
						</th>
					</tr>
				</c:forEach>
			</thead>
			<tbody>
				<c:forEach var="movieTimeTable" items="${movieTimeTableList }">
					<tr>
						<td>
							<div class="mx-5 my-3">
								<span class="fs-4">${movieTimeTable.hallName }</span>
								<span>총 ${movieTimeTable.totalSeats }석</span>
							</div>
							<div class="d-flex align-items-center mx-5">
								<ul class="list-group list-group-horizontal">
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								</ul>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p class="text-end">* 입장 지연에 따른 관람 불편을 최소화하기 위해, 상영시간 10분 후부터 영화가 시작됩니다.</p>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
</script>
</html>