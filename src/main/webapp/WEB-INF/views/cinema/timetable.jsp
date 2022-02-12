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
		
		.ui-widget-header {
		border: 0px solid #dddddd;
		background: #fff;
		}
		
		.ui-datepicker-calendar>thead>tr>th {
		font-size: 14px !important;
		}
		
		.ui-datepicker .ui-datepicker-header {
		position: relative;
		padding: 10px 0;
		}

		.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
		border: 0px solid #c5c5c5;
		background-color: transparent;
		font-weight: normal;
		color: #454545;
		text-align: center;
		}
		
		.ui-datepicker .ui-datepicker-title {
		margin: 0 0em;
		line-height: 16px;
		text-align: center;
		font-size: 14px;
		padding: 0px;
		font-weight: bold;
		}
		
		.ui-datepicker {
		display: none;
		background-color: #fff;
		border-radius: 4px;
		margin-top: 10px;
		margin-left: 0px;
		margin-right: 0px;
		padding: 20px;
		padding-bottom: 10px;
		width: 300px;
		box-shadow: 10px 10px 40px rgba(0,0,0,0.1);
		}
		    
		.ui-widget.ui-widget-content {
		    border: 1px solid #eee;
		}
		
		#datepicker:focus>.ui-datepicker {
		display: block;
		}
		
		.ui-datepicker-prev,
		.ui-datepicker-next {
		cursor: pointer;
		}
		
		.ui-datepicker-next {
		float: right;
		}
		
		.ui-state-disabled {
		cursor: auto;
		color: hsla(0, 0%, 80%, 1);
		}
		
		.ui-datepicker-title {
		text-align: center;
		padding: 10px;
		font-weight: 100;
		font-size: 20px;
		}
		
		.ui-datepicker-calendar {
		width: 100%;
		}
		
		.ui-datepicker-calendar>thead>tr>th {
		padding: 5px;
		font-size: 20px;
		font-weight: 400;
		}
		
		
		.ui-datepicker-calendar>tbody>tr>td>a {
		color: #000;
		font-size: 12px !important;
		font-weight: bold !important;
		text-decoration: none;
		    
		}
		
		
		.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
		cursor: auto;
		background-color: #fff;
		}
		    
		.ui-datepicker-calendar>tbody>tr>td {
		    border-radius: 100%;
		    width: 44px;
		    height: 30px;
		    cursor: pointer;
		    padding: 5px;
		    font-weight: 100;
		    text-align: center;
		    font-size: 12px;
		}
		    
		.ui-datepicker-calendar>tbody>tr>td:hover {
		    background-color: transparent;
		    opacity: 0.6;
		}
		
		.ui-state-hover,
		.ui-widget-content .ui-state-hover,
		.ui-widget-header .ui-state-hover,
		.ui-state-focus,
		.ui-widget-content .ui-state-focus,
		.ui-widget-header .ui-state-focus,
		.ui-button:hover,
		.ui-button:focus {
		border: 0px solid #cccccc;
		background-color: transparent;
		font-weight: normal;
		color: #2b2b2b;
		}
		
		.ui-widget-header .ui-icon {
		background-image: url('../resources/btns.png');
		}
		.ui-icon-circle-triangle-e {
		background-position: -20px 0px;
		background-size: 36px;
		}
		
		.ui-icon-circle-triangle-w {
		background-position: -0px -0px;
		background-size: 36px;
		}
		    
		.ui-datepicker-calendar>tbody>tr>td:first-child a{
		color: red !important;
		}
		    
		.ui-datepicker-calendar>tbody>tr>td:last-child a{
		color: #0099ff !important;
		}
		    
		.ui-datepicker-calendar>thead>tr>th:first-child {
		    color: red !important;
		}
		    
		.ui-datepicker-calendar>thead>tr>th:last-child {
		    color: #0099ff !important;
		}
		
		.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight {
		    border: 0px;
		    background: #f1f1f1;
		    border-radius: 50%;
		    padding-top: 10px;
		    padding-bottom: 10px;
		}
		
		
		.inp {padding:10px 10px; background-color:#f1f1f1; border-radius:4px; border:0px;}
		.inp:focus {outline:none; background-color:#eee;}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<input type="hidden" name="parameter" value="${param.cinemaNo }">
	<div id="cinema-name" class="fs-1 p-3 mt-3 mb-3">
		<span>${cinema.name }&nbsp;&nbsp;&nbsp;</span>
		<span><a type="button" class="btn btn-dark" href="main?cityNo=${param.cityNo }">목록으로 돌아가기</a></span>
	</div>
	
	<div id="movie-timetable" class="row justify-content-center mb-3">
		<div id="content" class="col-11 px-0">
			<c:choose>
				<c:when test="${empty movieTimeTableDtos }">
					<div id="warning" class="text-center mt-5 mb-5 fs-3">현재 상영중인 영화가 없습니다.</div>
				</c:when>
				<c:otherwise>
				<div style="width:400px; margin:0 auto; margin-top:100px; text-align:center;">
        <input type="text" name="showDate" value="" class="datepicker inp" readonly /> 
    </div>
					<!-- 안내버튼 -->
					<div class="row mb-0 justify-content-end hstack gap-2">
						<a href="/theater/price" id="price-info" class="col-2 btn btn-success" data-bs-toggle="modal" data-bs-target="#priceInfoModal">
						관람가격 안내</a>
<!-- 					<a href="/cinema/location" id="location-info" class="col-2 btn btn-success">위치/주차 안내</a> -->
					</div>
					<!-- 상영시간표 부분 -->
					<c:forEach var="timetable" items="${movieTimeTableDtos }">


						<div class="card mb-3">
							<div class="card-body row-12 p-0 mt-5">
								<!-- 영화정보 -->
	<div>상영일: <fmt:formatDate value="${timetable.showDate }" pattern="yyyy-MM-dd"/></div>
								<div class="border-0 border-bottom border-3 p-3">
									<span class="fs-2" id="movie-title">${timetable.title } &nbsp; &nbsp;</span>
			<%-- 					<span class="ml-3">${movieTimeTable.genre } | </span> --%>
									<span><fmt:formatDate value="${timetable.openDate }" pattern="yyyy-MM-dd"/> 개봉</span>
									<span>&nbsp;|&nbsp;${timetable.runtime }분</span>
								</div>
								<!-- 상영관정보 -->
								<div class="mt-4 mb-0 mx-5">
									<span class="fs-3" id="hall-name"><strong>${timetable.hallName }</strong></span>
									<span id="hall-name"> &nbsp;&nbsp;|&nbsp;&nbsp;총 100석</span>
<%-- 								<span>총 ${movieTimeTable.totalSeats }석</span> --%>
								</div>
								<!-- 상영시간 -->
								<div id="ticketing" class="row d-flex justify-content-start mt-1 mx-5 p-0">
									<c:forEach var="timetable" items="${timetable.schedules }">
										<div class="col-3 border text-center p-3 m-1 fs-4">
											<a href="#">
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
    dateFormat: "yy.mm.dd", // 날짜형태 예)yy년 m월 d일
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: "년"
  })

  $(".datepicker").datepicker({
    minDate: 0
  })
  
  
  $('input[name=showDate]').change(function () {
	  let a = $(this).val();
	  console.log(a);
	
})

</script>
</html>