<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
    <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
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
/*  		body {  */
/*  			font-family: NanumBarunGothic;  */
/*  		} */
		.card {
			border: none;
		}
		.pagination a {
		    color: black;
		    border: none;
		}
		.pagination > li.disabled > a {
		    font-weight: lighter;
		    color: #EEEEEE;
		    border: none;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col">
			<h1>상영일정 수정</h1>
			<div class="d-flex d-flex justify-content-between">
				<div class="mt-1">
					<h3>
						${detailSchedule.cinemaName } &nbsp;|&nbsp; ${detailSchedule.hallName } &nbsp;|&nbsp;
						<fmt:formatDate value="${detailSchedule.showDate }" pattern="yyyy-MM-dd" /> &nbsp;|&nbsp;
						<fmt:formatDate value="${detailSchedule.startTime }" pattern="HH:ss" /> ~ <fmt:formatDate value="${detailSchedule.endTime }" pattern="HH:ss" />
					</h3>
				</div>
				<div>
					<a type="button" class="btn btn-dark" href="list?page=${param.page }&cityNo=${detailSchedule.cityNo }&cinemaNo=${detailSchedule.cinemaNo }">목록으로 돌아가기</a>
				</div>
			</div>
		</div>
	</div>
	 <!-- 선택한 상영정보 표시 -->
	 <div class="row d-flex justify-content-evenly mt-5 mb-5 align-center">
		 <!-- 영화 간단정보 표시 -->
		 <div class="card col-5">
		 	<img src="/resources/images/movie/moviePoster/${detailSchedule.movieNo }.jpg" class="card-img-top" id="movie-image">
		 </div>
		 <div class="col-5 mt-5">
	 		<h4>${detailSchedule.title }</h4>
			<table class="table mb-5">
				<tbody>
					<tr>
						<th class="col-3">장르</th><td id="movie-genre">액션</td>
					</tr>
					<tr>
						<th class="col-3">러닝타임</th><td id="movie-runtime">${detailSchedule.runtime } 분</td>
					</tr>
					<tr>
						<th class="col-3">개봉일</th><td id="movie-open-date"><fmt:formatDate value="${detailSchedule.openDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 수정폼 -->
			<div>
			 <form id="modify-form" method="post" action="update">
				 <input type="hidden" name="no" value="${detailSchedule.showNo }" />
				 <input type="hidden" name="movieNo" value="${detailSchedule.movieNo }" />
			 	<div class="row-sm-10 mb-3">
			    	<label for="show-date" class="form-label">상영일</label>
			    	<div class="col">
			      		<input type="date" class="form-control" id="show-date" name="showDate" 
			      		value="<fmt:formatDate value="${detailSchedule.showDate}" pattern="yyyy-MM-dd" />" 
			      		min="<fmt:formatDate value="${detailSchedule.openDate}" pattern="yyyy-MM-dd" />">
			    	</div>
			  	</div>
			  	<div class="row-sm-10 mb-3">
			    	<label for="cinema-hall" class="form-label">상영관</label>
			    	<div class="col">
						<select class="form-select" id="hall-no" name="hallNo">
							<option value="1" ${detailSchedule.hallNo eq 1 ? 'selected' : ''}>1관</option>
							<option value="2" ${detailSchedule.hallNo eq 2 ? 'selected' : ''}>2관</option>
							<option value="3" ${detailSchedule.hallNo eq 3 ? 'selected' : ''}>3관</option>
							<option value="4" ${detailSchedule.hallNo eq 4 ? 'selected' : ''}>4관</option>
							<option value="5" ${detailSchedule.hallNo eq 5 ? 'selected' : ''}>5관</option>
						</select>
			    	</div>
			  	</div>
			  	<div class="row-sm-10">
			  		<label for="show-time" class="form-label">상영시간</label>
			  		<div class="col d-flex justify-content-between mb-3" id="time-check">
						<!-- 시작시간 -->
						<div class="col-sm-5">
							<input type="datetime" class="form-control" id="start-time" name="startTime" value="<fmt:formatDate value="${detailSchedule.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
						</div>
							<span class="col-sm-1 text-center">~</span>
						<!-- 종료시간 -->
						<div class="col-sm-5">
							<input type="datetime" class="form-control" id="end-time" name="endTime" value="<fmt:formatDate value="${detailSchedule.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
						</div>
					</div>
			  	</div>
			  	<div class="row-sm-10 d-flex justify-content-end">
					<button type="submit" class="btn btn-primary align-items-end mt-5" id="btn-modify-status">수정</button>
				</div>
			</form>
			</div>
		</div>
	</div>	 
</div>
</body>
<script type="text/javascript">

	$('#btn-modify-status').click(function (e) {
		e.preventDefault();
		
		let start = $('input[name=startTime]').val();
		let end = $('input[name=endTime]').val();
		// 시작시간이 종료시간 이전인 경우
		if (moment(start).isBefore(end)) {
			alert('정상적으로 수정되었습니다.');
			$("#modify-form").trigger("submit");
		} else {
			// 시작시간이 종료시간 이후인 경우
			$('input[name=endTime]').focus();
			alert('상영 시작시간보다 종료시간이 더 빠릅니다.\n다시 입력해주세요.');
		}
	})
	
</script>
</html>