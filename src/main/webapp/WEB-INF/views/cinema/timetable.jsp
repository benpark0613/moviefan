<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan :: 극장 및 상영정보</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style>
		body {
			font-family: NanumBarunGothic;
			font-size: 16pt;
		}
		a {
			color: black;
			text-decoration: none;
		}
		tr {
			border-color: white;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<input type="hidden" id="parameter" value="${param.cinemaNo }">
	<!-- 안내버튼 -->
	<div class="row mt-5 mb-5 justify-content-center hstack gap-2">
		<a href="/theater/price" id="price-info" class="col-2 btn btn-success" data-bs-toggle="modal" data-bs-target="#priceInfoModal">
		관람가격 안내</a>
		<a href="/cinema/location" id="location-info" class="col-2 btn btn-success">위치/주차 안내</a>
	</div>
	<!-- 관람가격 모달창 -->
	<div class="modal fade" id="priceInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	<div id="movie-timetable" class="row justify-content-center mt-5 mb-5">
		<div class="col-10 px-0">
			<c:forEach var="timetable" items="${movieTimeTableDtos }">
				<table class="table" id="schedule-list">
					<thead>
						<tr>
							<th>
								<span class="fs-2">${timetable.title } &nbsp; &nbsp;</span>
<%-- 							<span class="ml-3">${movieTimeTable.genre } | </span> --%>
								<span><fmt:formatDate value="${timetable.openDate }" pattern="yyyy-MM-dd"/> 개봉 &nbsp;|</span>
								<span>${timetable.runtime }분</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="show-info" data-td-hall-name="${timetable.hallName }">
								<div class="mx-5 my-3">
									<span class="fs-4" id="hall-name" data-span-hall-name="${timetable.hallName }"><strong>${timetable.hallName }</strong></span>
<%-- 								<span>총 ${movieTimeTable.totalSeats }석</span> --%>
								</div>
								<div class="d-flex align-items-center mx-5">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item mt-0 mb-3 text-center">
											<a href="#">
												<strong>
												<fmt:formatDate value="${timetable.startTime }" pattern="HH:mm"/> ~ 
												<fmt:formatDate value="${timetable.endTime }" pattern="HH:mm"/> 
												</strong>
												<br>잔여좌석수/전체좌석수
											</a>
										</li>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
		<p class="col-10 text-end mt-2">* 입장 지연에 따른 관람 불편을 최소화하기 위해, 상영시간 10분 후부터 영화가 시작됩니다.</p>
	</div>
</div>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	window.addEventListener('load', function () {
		let tdHallName = $('.show-info').attr('data-td-hall-name');
		let spanHallName = $('#hall-name').attr('data-span-hall-name');
		
// 		$('#schedule-list').each(function (index, item) {
// 			if (tdHallName === spanHallName) {
// 				console.log(item);
// 			}
// 		}) 
	})


</script>
</html>