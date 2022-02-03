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
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">

	<div class="row">
		<div class="col">
			<h1>상영일정 수정</h1>
		</div>
	</div>
	 <!-- 선택한 상영정보 표시 -->
	 <input type="hidden" id="parameter" name="showNo" value="${param.showNo }">
	 <h3>${detailSchedule.cinemaName } | ${detailSchedule.hallName } | ${detailSchedule.startTime } ~ ${detailSchedule.endTime } 상영</h3>
	 <div class="row justify-content-evenly mt-5 mb-5">
		 <!-- 영화 간단정보 -->
		 <div class="card col-4">
		 	<img src="..." class="card-img-top" name="movie-image">
		 	<div class="card-body">
		    	<p class="card-text" id="movie-title"></p>
		    	<p class="card-text" id="movie-genre">액션</p>
		    	<p class="card-text" id="movie-runtime"></p>
		    	<p class="card-text" id="movie-open-date"></p>
		 	</div>
		 </div>
		 <!-- 수정폼 -->
		 <form class="col-6" id="modify-form" method="post" action="update">
		 	<div class="row mb-3">
				<label for="movie-search" class="form-label">상영영화 변경</label>
				<div class="col-sm-10">
					<input class="form-control" list="movie-options" id="movie" name="movie" placeholder="변경할 영화를 검색하세요.">
					<!-- 상영중인 영화 리스트 -->
					<datalist id="movie-options">
						<c:forEach var="movie" items="${movieList }">
							<option value="${movie.title }">
						</c:forEach>
					</datalist>		 		
				</div>
		  	</div>
		 	<div class="row mb-3">
		    	<label for="show-date" class="form-label">상영일 변경</label>
		    	<div class="col-sm-10">
		      		<input type="date" class="form-control" id="show-date" name="showDate" value="">
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="cinema-hall" class="form-label">상영관 변경</label>
		    	<div class="col-sm-10">
					<select class="form-select" id="hall-name" name="hallName">
						<option value="1관" selected>1관</option>
						<option value="2관">2관</option>
						<option value="3관">3관</option>
					</select>
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="show-time" class="form-label">상영시간 변경</label>
		    	<div class="col-sm-10">
		      		<select class="form-select" id="show-time" name="showTime">
						<option value="10:00 ~ 12:40">10:00 ~ 12:40</option>
						<option value="13:00 ~ 15:40">13:00 ~ 15:40</option>
						<option value="16:00 ~ 18:40">16:00 ~ 18:40</option>
						<option value="19:00 ~ 21:40">19:00 ~ 21:40</option>
					</select>
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="show-status" class="form-label">상영상태 변경</label>
		    	<div class="col-sm-10">
		      		<select class="form-select" id="show-status" name="showStatus">
						<option value="Y" selected>상영중</option>
						<option value="N">상영종료</option>
					</select>
		    	</div>
		  	</div>
		  		<button class="btn btn-primary align-items-end" id="btn-modify">수정</button>
		  	
		</form>
		
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
	$(function () {
		let showNo = $('#parameter').val();
		
		$.getJSON("/rest/cinema/modify", {showNo:showNo}, function (detailSchedule) {
			$('#movie-title').text('제목: ' + detailSchedule.title);
			//$('#movie-genre').text(detailSchedule.title);		장르
			$('#movie-runtime').text("러닝타임: " + detailSchedule.runtime + " 분");
			$('#movie-open-date').text("개봉일: " + detailSchedule.openDate);
			$('#show-date').val(detailSchedule.showDate).attr("min", detailSchedule.openDate);
			$('#hall-name').val(detailSchedule.hallName);
			
			let showTime = '${detailSchedule.startTime} ~ ${detailSchedule.endTime}';
			$('#show-time').val(showTime);
			
			//$('#show-status').val(detailSchedule.showDate);	상영상태
		})
		
		// 변경할 영화의 개봉일보다 이른 날짜의 캘린더 비활성화하기
		// 현재 상영중인 영화 장르 표시하기
		// 상영상태 어떻게 할지
		
		
	});
	
	

</script>
</html>