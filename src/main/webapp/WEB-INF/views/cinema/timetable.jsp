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
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
   <!-- datepicker -->
	<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<link href="/resources/css/datepicker.css" rel="stylesheet">
	<style>
/* 		body { */
/* 			font-family: NanumBarunGothic; */
/* 			font-size: 16pt; */
/* 		} */
		a {
			color: black;
			text-decoration: none;
		}
		tr {
			border-color: white;
		}
		#show-datepicker {
			width:300px; 
			text-align:center;
		}
		#movie-title, #cinema-name, #hall-name {
			font-weight: bold;
		}
		.card {
			border: none;
		}
		#ticketing div {
			width: 210px;
  			height: 110px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<input type="hidden" name="parameter" value="${param.cinemaNo }">
	<div id="cinema-name" class="fs-1 p-3 mt-3 mb-3">
		<span>${cinema.name }&nbsp;&nbsp;</span>
		<span><a type="button" class="btn btn-dark" href="main?cityNo=${param.cityNo }">목록으로 돌아가기</a></span>
	</div>
	<!-- 날짜선택, 안내버튼 -->
	<div class="row mb-5 ">
		<div class="col">
			<div class="d-flex justify-content-between">
				<form id="form-search-show-date" method="get" action="timetable">
					<input id="cinema-no" type="hidden" name="cinemaNo" value="${param.cinemaNo }" />
					<input id="show-datepicker" type="text" name="showDate" value="${param.showDate }" class="datepicker inp" readonly />
				</form>
				<div>
					<a href="/theater/price" id="price-info" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#priceInfoModal">
					관람가격 안내</a>
					<a href="/cinema/location?cinemaNo=${param.cinemaNo }" id="location-info" class="btn btn-success">위치/주차 안내</a>
				</div>
			</div>
		</div>
	</div>
					
	<div id="movie-timetable" class="row justify-content-center mb-3">
		<div id="content" class="col-11 px-0">
			<c:choose>
				<c:when test="${empty movieTimeTableDtos }">
					<div id="warning" class="text-center mt-5 mb-5 fs-3">현재 상영중인 영화가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<!-- 상영시간표 부분 -->
					<c:forEach var="timetable" items="${movieTimeTableDtos }">
						<div class="card">
							<div class="card-body row-12 p-0 mt-3 mb-5">
								<!-- 영화정보 -->
								<div class="border-0 border-bottom border-3 p-3">
									<span class="fs-2" id="movie-title">${timetable.title } &nbsp; &nbsp;</span>
									<span><fmt:formatDate value="${timetable.openDate }" pattern="yyyy-MM-dd"/> 개봉</span>
									<span>&nbsp;|&nbsp;${timetable.runtime }분</span>
								</div>
								<!-- 상영관정보 -->
								<div class="mt-4 mb-0 mx-5">
									<span class="fs-3" id="hall-name"><strong>${timetable.hallName }</strong></span>
									<span id="hall-name"> &nbsp;&nbsp;|&nbsp;&nbsp;총 ${timetable.totalSeats }석</span>
								</div>
								<!-- 상영시간 -->
								<div id="ticketing" class="row d-flex justify-content-start mt-1 mx-5 p-0">
									<c:forEach var="timetable" items="${timetable.schedules }">
										<div class="col-3 border text-center p-3 m-1 fs-4">
											<a href="/ticket/booking">
												<strong>
													<fmt:formatDate value="${timetable.startTime }" pattern="HH:mm"/> ~ 
													<fmt:formatDate value="${timetable.endTime }" pattern="HH:mm"/> 
												</strong><br>80석
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
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
</div>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$.datepicker.setDefaults({
		closeText: "닫기",
	    prevText: "이전달",
	    nextText: "다음달",
	    currentText: "오늘",
	    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
	    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	    weekHeader: "주",
	    dateFormat: "yy.mm.dd",
	    firstDay: 0,
	    isRTL: false,
	    showMonthAfterYear: true,
	    yearSuffix: "년"
	})
	
	$(".datepicker").datepicker({
	    minDate: 0
	})
	
	$('input[name=showDate]').change(function () {
		let searchDate = $(this).val().replace(/\./g, '');
		let cinemaNo = $('input[name=cinemaNo]').val();

		$("#form-search-show-date").trigger('submit');
	});

</script>
</html>