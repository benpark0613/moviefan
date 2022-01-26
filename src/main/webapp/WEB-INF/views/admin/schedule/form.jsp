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
			<h1>상영스케줄 관리</h1>
		</div>
	</div>
	<!-- 시작 -->
	<div>
		<div class="row justify-content-around">
		
			<!-- 지역선택/ 극장선택/ 해당 극장에서 상영중인 영화목록 표시 -->
    		<div class="col-6 border">
    			<div class="col mx-2">
    				<!-- 지역선택 -->
					<select class="form-select">
						<option value="" selected>-- 지역선택 --</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
					</select>
					<!-- 해당 지역의 영화관 목록 -->
					<table class="table">
						<thead>
					    	<tr>
					      		<th>번호</th>
					      		<th>영화관 이름</th>
					      		<th>상영관 수</th>
					      		<th>상영중인 영화 수</th>
					    	</tr>
					  	</thead>
					  	<tbody>
					    	<tr>
					      		<td>1</td>
					     	 	<td>MVF 강변</td>
					      		<td>3</td>
					      		<td>5</td>
					    	</tr>
					    	<tr>
					      		<td>2</td>
					     	 	<td>MVF 강변</td>
					      		<td>3</td>
					      		<td>5</td>
					    	</tr>
					    	<tr>
					      		<td>3</td>
					     	 	<td>MVF 강변</td>
					      		<td>3</td>
					      		<td>5</td>
					    	</tr>
					    </tbody>
				    </table>
				    <!-- 선택한 영화관에서 현재 상영중인 영화 목록 -->
					<table class="table">
						<thead>
					    	<tr>
					      		<th>영화제목</th>
					      		<th>상영관 이름</th>
					      		<th>상영시간</th>
					    	</tr>
					  	</thead>
					  	<tbody>
					    	<tr>
					      		<td>스파이더맨 : 노 웨이 홈</td>
					     	 	<td>MVF 강변</td>
					      		<td>10:00 ~ 12:00</td>
					    	</tr>
					    	<tr>
					      		<td>스파이더맨 : 노 웨이 홈</td>
					     	 	<td>MVF 강변</td>
					      		<td>10:00 ~ 12:00</td>
					    	</tr>
					    	<tr>
					      		<td>스파이더맨 : 노 웨이 홈</td>
					     	 	<td>MVF 강변</td>
					      		<td>10:00 ~ 12:00</td>
					    	</tr>
					    </tbody>
				    </table>
				</div>
    		</div>
    		<!-- 수정폼 -->
    		<div class="col-6 border">
				<div class="row mb-3">
			    	<label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
			    	<div class="col-sm-10">
			      		<input type="email" class="form-control" id="inputEmail3">
			    	</div>
			  	</div>
			  
			  	<div class="row mb-3">
			    	<label for="inputEmail3" class="col-sm-2 col-form-label">영어제목</label>
			    	<div class="col-sm-10">
			      		<input type="email" class="form-control" id="inputEmail3">
			    	</div>
			  	</div>
			  	
			  	<div class="row mb-3">
			    	<label for="inputEmail3" class="col-sm-2 col-form-label">런타임</label>
			    	<div class="col-sm-10">
			      		<input type="email" class="form-control" id="inputEmail3">
			    	</div>
			  	</div>
			  	
    		</div>
    	
    	</div>
	</div>


</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>