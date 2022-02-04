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
	 <h3>${detailSchedule.cinemaName } | ${detailSchedule.hallName } | ${detailSchedule.startTime } ~ ${detailSchedule.endTime }</h3>
	 <div class="row justify-content-evenly mt-5 mb-5 align-center">
		 <!-- 영화 간단정보 표시 -->
		 <div class="card col-5">
		 	<img src="..." class="card-img-top" id="movie-image">
		 	<div class="card-body">
		    	<p class="card-text" id="movie-no"></p>
		    	<p class="card-text" id="movie-title"></p>
		    	<p class="card-text" id="movie-genre">액션</p>
		    	<p class="card-text" id="movie-runtime"></p>
		    	<p class="card-text" id="movie-open-date"></p>
		 	</div>
		 </div>
		 
		 
		 <!-- 수정폼 -->
		 <form class="col-7" id="modify-form" method="post" action="">
		 	<div class="row mb-3">
				<label for="movie-no" class="form-label">상영영화</label>
				<div class="col-sm-8">
					<!-- 상영중인 영화 리스트 -->
					<select class="form-select" id="movie-no" name="movieNo">
						<option value="" selected disabled>변경할 영화를 선택하세요.</option>
						<c:forEach var="movie" items="${movieList }">
							<option value="${movie.no }">${movie.title }</option>
						</c:forEach>
					</select>		 		
				</div>
				<div class="col-sm-3">
					<button type="button" class="btn btn-outline-primary align-items-end" id="btn-modify-movie">수정</button>
				</div>
		  	</div>
		 	<div class="row mb-3">
		    	<label for="show-date" class="form-label">상영일 변경</label>
		    	<div class="col-sm-8">
		      		<input type="date" class="form-control" id="show-date" name="showDate" value="">
		    	</div>
		    	<div class="col-sm-3">
					<button type="button" class="btn btn-outline-primary align-items-end" id="btn-modify-show-date">수정</button>
				</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="cinema-hall" class="form-label">상영관 변경</label>
		    	<div class="col-sm-8">
					<select class="form-select" id="hall-no" name="hallNo">
						<option value="1">1관</option>
						<option value="2">2관</option>
						<option value="3">3관</option>
					</select>
		    	</div>
		    	<div class="col-sm-3">
					<button type="button" class="btn btn-outline-primary align-items-end" id="btn-modify-hall">수정</button>
				</div>
		  	</div>
		  	
		  	<div class="col-sm-10 justify-content-evenly">
		  		<label for="show-time" class="form-label">상영시간 변경</label>
		  		<div class="row g-0 align-items-center mb-3">
					<!-- 시작시간 -->
					<div class="col-sm-4">
						<input type="time" class="form-control" id="start-time" name="startTime">
					</div>
					<span class="col-1 text-center">~</span>
					<!-- 종료시간 -->
					<div class="col-sm-4">
						<input type="time" class="form-control" id="end-time" name="endTime">
					</div>
			  		<div class="col-sm-2">
						<button type="button" class="btn btn-outline-primary align-items-end" id="btn-modify-show-time">수정</button>
					</div>
				</div>
		  	</div>
		  		
		  	<div class="row mb-3">
		    	<label for="show-status" class="form-label">상영상태 변경</label>
		    	<div class="col-sm-8">
		      		<select class="form-select" id="show-status" name="showStatus">
						<option value="Y">상영중</option>
						<option value="N">상영종료</option>
					</select>
		    	</div>
		    	<div class="col-sm-3">
					<button type="button" class="btn btn-outline-primary align-items-end" id="btn-modify-status">수정</button>
				</div>
		  	</div>
		</form>
	</div>	 
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
	$(function () {
		let showNo = $('#parameter').val();
		//console.log(showNo);
		
		$.getJSON("/rest/cinema/modify", {showNo:showNo}, function(detailSchedule) {
			$('#movie-title').text('제목: ' + detailSchedule.title);
			//$('#movie-genre').text(detailSchedule.title);		장르
			$('#movie-runtime').text("러닝타임: " + detailSchedule.runtime + " 분");
			$('#movie-open-date').text("개봉일: " + detailSchedule.openDate);
			$('#show-date').val(detailSchedule.showDate).attr("min", detailSchedule.openDate);
			
			$('#hall-no').val(detailSchedule.hallNo);
			$('#start-time').val(detailSchedule.startTime);
			$('#end-time').val(detailSchedule.endTime);
			//$('#show-status').val(detailSchedule.showDate);	상영상태
		})
		
// 		$('select[name=movieNo]').change(function() {
// 			var a = $(this).val();
// 			console.log("a: ", a);
// 		})
		
		
		let movieNo = $('#movie-no option:selected').val();
		console.log("movieNo: ", movieNo);
		
		
		$('#btn-modify-movie').click(function() {
			
			$('#movie-modify').attr('action', 'updateMovie').trigger('submit');
		});
		
		
	})
	
	

</script>
</html>