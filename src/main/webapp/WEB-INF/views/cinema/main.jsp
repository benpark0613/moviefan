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
		
		<div class="container px-4">
			<div class="row gx-1">
			
			<!-- 지역 선택 -->
				<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
					<c:forEach var="cinema" items="${cinemaList }">
						<option value="{cinema.cityName }">1</option>
					</c:forEach>
				</select>
				<!-- 영화관 선택 -->  		
					<div class="col-8" id="cinema-list">
						<div class="container mt-4">
							<div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2">
								
								<c:forEach var="cinema" items="${cinemaList }">
						    		<div class="col">
										<div id="cinema" class="p-4 border bg-light text-center">
								      		<a href="#">${cinema.cinemaName }</a>
								      	</div>
						    		</div>
						  		</c:forEach>
						  		
							</div>
						</div>
					</div>
				
				
			</div>
		</div>
	</div>
	<!-- 안내버튼 -->
	<div class="row mt-5 mb-5 justify-content-center hstack gap-2">
		<a href="/theater/price" id="price-info" class="col-2 btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
		관람가격 안내</a>
		<a href="/cinema/location" id="location-info" class="col-2 btn btn-success">위치/주차 안내</a>
	</div>
	<!-- 관람가격 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title">관람가격 안내</h5>
	      		</div>
	      		<div class="row justify-content-center modal-body">
			        <table class="table w-75 text-center">
			        	<thead>
							<tr>
								<th>성인</th>
								<th>청소년</th>
								<th>경로우대</th>
							</tr>			
						</thead>
						<tbody>
							<tr>
								<td>10,000원</td>
								<td>8,000원</td>
								<td>6,000원</td>
							</tr>
						</tbody>
			        </table>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-dark" data-bs-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 상영시간표 -->
	<div id="movie-timetable" class="row mt-5 mb-5">
		<c:forEach var="movieTimeTable" items="${movieTimeTableList }">
			<table class="table">
				<thead>
						<tr>
							<th>
								<span class="fs-2">${movieTimeTable.title }</span>
								<span class="ml-3">${movieTimeTable.genre } / </span>
								<span><fmt:formatDate value="${movieTimeTable.openDate }" pattern="yyyy년 M월 d일"/> 개봉</span>
							</th>
						</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
		</c:forEach>
		<p class="text-end">* 입장 지연에 따른 관람 불편을 최소화하기 위해, 상영시간 10분 후부터 영화가 시작됩니다.</p>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
	$('#city')
	
</script>
</html>