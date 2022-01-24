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
	#price-info, #location-info {
		display: inline-block;
		width: 25%;
		height: 50%;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<!-- 점보트론 -->
	<div class="p-5 mb-4 bg-light rounded-3">
		<!-- 지역 선택 셀렉트박스로 바꿀까..? -->
		<button id="cinema-city" class="btn btn-dark">서울</button>
		<!-- 지역별 영화관 이름 -->
		<div class="container mt-4">
			<div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2">
				<c:forEach var="cinema" items="${cinemaList }">
		    		<div class="col">
						<div id="cinema-name" class="p-4 border bg-light text-center">
				      		<a href="#">${cinema.name }</a>
				      	</div>
		    		</div>
		  		</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 안내버튼 -->
	<div class="row h-50 justify-content-center hstack gap-2">
		<a href="/theater/price" id="price-info" class="col-2 btn-secondary">관람가격 안내</a>
		<a href="/theater/location" id="location-info" class="col-2 btn-secondary">위치/주차 안내</a>
	</div>
	
	<!-- 상영시간표 -->
	<div id="movie-timetable" class="row mt-5 mb-3">
		<table class="table">
			<thead>
				<tr>
					<th>
						영화제목
						<span>장르/ </span>
						<span>러닝타임/ </span>
						<span>개봉일</span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<span>상영관 이름/ </span>
							<span>총 좌석수</span>
						</div>
						<div class="d-flex align-items-center">
							<ul class="list-group list-group-horizontal">
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<span>상영관 이름/ </span>
							<span>총 좌석수</span>
						</div>
						<div class="d-flex align-items-center">
							<ul class="list-group list-group-horizontal">
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							  <li class="list-group-item mt-3 mb-3">상영시간<br>잔여좌석수</li>
							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<p class="border-top border-2 p-2 text-end">입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
	</div>


</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
</script>
</html>