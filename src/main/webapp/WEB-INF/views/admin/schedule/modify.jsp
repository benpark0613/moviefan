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
		body {
			font-family: NanumBarunGothic;
			font-size: 16pt;
		}
		.card {
			border: none;
		}
		.wrapper {
			 margin-left:auto; 
    		margin-right:auto;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">

	<div class="row">
		<div class="col">
			<h1>상영일정 수정</h1>
			<h3>
				${detailSchedule.cinemaName } &nbsp;|&nbsp; ${detailSchedule.hallName } &nbsp;|&nbsp;
				<fmt:formatDate value="${detailSchedule.startTime}" pattern="HH:ss" /> ~ <fmt:formatDate value="${detailSchedule.endTime}" pattern="HH:ss" /> 상영
			</h3>
		</div>
	</div>
	 <!-- 선택한 상영정보 표시 -->
	 <div class="row justify-content-evenly mt-5 mb-5 align-center">
		 <!-- 영화 간단정보 표시 -->
		 <div class="card col-5">
		 	<img src="/resources/images/movie/moviePoster/${detailSchedule.movieNo }.jpg" class="card-img-top" id="movie-image">
		 	<div class="card-body">
		 		<h4 class="card-title">${detailSchedule.title }</h4>
				<table class="table">
					<tbody>
						<tr>
							<th>장르</th><td id="movie-genre">액션</td>
						</tr>
						<tr>
							<th>러닝타임</th><td id="movie-runtime">${detailSchedule.runtime } 분</td>
						</tr>
						<tr>
							<th>개봉일</th><td id="movie-open-date"><fmt:formatDate value="${detailSchedule.openDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</tbody>
				</table>
		 	</div>
		 </div>
		 
		 <!-- 수정폼 -->
		 <form class="col-7" id="modify-form" method="post" action="update">

			 <input type="hidden" name="showNo" value="${detailSchedule.showNo }" />
			 <input type="hidden" name="movieNo" value="${detailSchedule.movieNo }" />
		 
		 	<div class="row mb-3">
		    	<label for="show-date" class="form-label">상영일</label>
		    	<div class="col-sm-8">
		      		<input type="date" class="form-control" id="show-date" name="showDate" 
		      		value="<fmt:formatDate value="${detailSchedule.showDate}" pattern="yyyy-MM-dd" />" 
		      		min="<fmt:formatDate value="${detailSchedule.openDate}" pattern="yyyy-MM-dd" />">
		    	</div>
		  	</div>
		  	
		  	<div class="row mb-3">
		    	<label for="cinema-hall" class="form-label">상영관</label>
		    	<div class="col-sm-8">
					<select class="form-select" id="hall-no" name="hallNo">
						<option value="1" ${detailSchedule.hallNo eq 1 ? 'selected' : ''}>1관</option>
						<option value="2" ${detailSchedule.hallNo eq 2 ? 'selected' : ''}>2관</option>
						<option value="3" ${detailSchedule.hallNo eq 3 ? 'selected' : ''}>3관</option>
					</select>
		    	</div>
		  	</div>
		  	
		  	<div class="col-sm-10 justify-content-evenly">
		  		<label for="show-time" class="form-label">상영시간</label>
		  		<div class="row g-0 align-items-center mb-3">
					<!-- 시작시간 -->
					<div class="col-sm-4">
						<input type="datetime" class="form-control" id="start-time" name="startTime" value="<fmt:formatDate value="${detailSchedule.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
					</div>
						<span class="col-sm-1 text-center">~</span>
					<!-- 종료시간 -->
					<div class="col-sm-4">
						<input type="datetime" class="form-control" id="end-time" name="endTime" value="<fmt:formatDate value="${detailSchedule.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
					</div>
				</div>
		  	</div>

	    	<div class="col-sm-3 ms-0">
				<button type="submit" class="btn btn-primary align-items-end mt-5" id="btn-modify-status">수정</button>
			</div>
			
		</form>
		
	</div>	 
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

// $('#btn-modify-status').click(function () {
// 	let showDate = $('input[name=showSelect]').val()
// 	let startTime = showDate + ' ' + $('input[name=startSelect]').val()+':00';
// 	let endTime = showDate + ' ' + $('input[name=endSelect]').val()+':00';
	
// 	$('#modify-form').submit();
// })
	
// 	console.log('상영일: ', showDate);
// 	console.log('시작시간: ', startTime);
// 	console.log('종료시간: ', endTime);
	
	
// 	// 변환한 상영날짜
// 	function formatShowdate() {
// 		let date = $('#show-select').val()+' 00:00:00';
// 		$('input[name=showDate]').val(date)
// 	}
	
// 	// 변환한 영화 시작시간
// 	function formatStartTime() {
// 		let date = $('#show-select').val();
// 		let start = date + ' ' + $('input[name=startSelect]').val()+':00';
// 		$('input[name=startTime]').val(start);
// 	}
	
// 	// 변환한 영화 종료시간
// 	function formatEndTime() {
// 		let date = $('#show-select').val();
// 		let end = date + ' ' + $('input[name=endSelect]').val()+':00';
// 		$('input[name=endTime]').val(end);
// 	}

</script>
</html>