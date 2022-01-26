<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
    <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">

	<div class="row">
		<div class="col">
			<h1>상영정보 수정폼</h1>
		</div>
	</div>
	 <!-- 선택한 상영정보 표시 -->
	 <h3>선택한 영화관 이름 | 상영관</h3>
	 <div class="row g-2">
		 <!-- 영화 간단정보, readonly -->
		 <div class="col-5 px-5 mx-2">
		 	<div class="row mb-3">
		 		<img src="/resources/images/movie/spiderman.png">
		 	</div>
			<div class="row mb-3">
		    	<label for="inputEmail3" class="col-sm-3 col-form-label">제목</label>
		    	<div class="col-sm-10">
		      		<input type="text" readonly class="form-control-plaintext" value="스파이더맨 : 노 웨이 홈" id="inputEmail3">
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="inputEmail3" class="col-sm-3 col-form-label">런타임</label>
		    	<div class="col-sm-10">
		      		<input type="text" readonly class="form-control-plaintext" value="148분" class="form-control-plaintext" id="inputEmail3">
		    	</div>
		  	</div>
		 </div>
		 <!-- 수정폼 -->
		 <div class="col-5 px-5 mx-2">
		 	<div class="row mb-3">
				<label for="exampleDataList" class="form-label">상영영화 변경</label>
				<div class="col-sm-10">
					<input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="영화 검색">
					<datalist id="datalistOptions">
						<option value="San Francisco">
					  	<option value="New York">
					  	<option value="Seattle">
					  	<option value="Los Angeles">
					  	<option value="Chicago">
					</datalist>		 		
				</div>
		  	</div>
		 	<div class="row mb-3">
		    	<label for="inputEmail3" class="form-label">상영일 변경</label>
		    	<div class="col-sm-10">
		      		<input type="date" class="form-control" id="inputEmail3">
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="inputEmail3" class="form-label">상영관 변경</label>
		    	<div class="col-sm-10">
					<select class="form-select">
						<option value="1관" selected>1관</option>
						<option value="2관">2관</option>
						<option value="3관">3관</option>
					</select>
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="inputEmail3" class="form-label">상영시간 변경</label>
		    	<div class="col-sm-10">
		      		<select class="form-select">
						<option value="10:00 ~ 12:00" selected>10:00 ~ 12:00</option>
						<option value="12:00 ~ 14:00">12:00 ~ 14:00</option>
						<option value="14:00 ~ 16:00">14:00 ~ 16:00</option>
					</select>
		    	</div>
		  	</div>
		  	<div class="row mb-3">
		    	<label for="inputEmail3" class="form-label">상영상태 변경</label>
		    	<div class="col-sm-10">
		      		<select class="form-select">
						<option value="Y" selected>상영중</option>
						<option value="N">상영종료</option>
					</select>
		    	</div>
		  	</div>
		</div>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>