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
			<h1>상영일정 조회</h1>
		</div>
	</div>
	
	<!-- 지역, 영화관 선택 -->	
	<div class="row justify-content-center">
 		<div class="row g-2">
   			<div class="col-2">
				<select id="city-select" name="city" class="form-select">
					<option value="" selected disabled>-- 지역 --</option>
					<c:forEach var="city" items="${cityList }">
						<option value="${city.no }">${city.name }</option>
					</c:forEach>
				</select>
			</div>
   			<div class="col-3">
   				<select id="cinema-select" name="cinema" class="form-select">
					<option value="" selected disabled>-- 지역을 먼저 선택하세요. --</option>
   					<c:forEach var="cinema" items="${cinemaList }">
						<option value="${cinema.cityNo }">${cinema.name }</option>
   					</c:forEach>
				</select>
   			</div>
   		</div>
   	</div>

	<!-- 선택한 영화관에서 현재 상영중인 영화 목록 -->
	<div class="mt-5 mb-5">
		<div>
			<span>MVF 강변</span> :: <span>총 상영관 수</span>/  <span>현재 상영중인 영화 수</span>
		</div>
		<table class="table">
			<thead>
		    	<tr>
		      		<th>상영관 이름</th>
		      		<th>영화제목</th>
		      		<th>개봉일</th>
		      		<th>상영 시작일</th>
		      		<th>상영시간</th>
		      		<th>상영중</th>
		      		<th>수정</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		    	<tr>
		     	 	<td>1관</td>
		      		<td>스파이더맨 : 노 웨이 홈</td>
		      		<td>2022-01-25</td>
		      		<td>2022-01-26</td>
		      		<td>10:00 ~ 12:00</td>
		      		<td>Y</td>
		      		<td>
		      			<a href="/admin/schedule/modify" class="btn btn-outline-primary btn-sm">수정</a>
		      		</td>
		    	</tr>
		    	<tr>
		     	 	<td>2관</td>
		      		<td>특송</td>
		      		<td>2022-01-25</td>
		      		<td>2022-01-26</td>
		      		<td>10:00 ~ 12:00</td>
		      		<td>Y</td>
		      		<td>
		      			<a href="/admin/schedule/modify" class="btn btn-outline-primary btn-sm">수정</a>
		      		</td>
		    	</tr>
		    	<tr>
		     	 	<td>3관</td>
		      		<td>스파이더맨 : 노 웨이 홈</td>
		      		<td>2022-01-25</td>
		      		<td>2022-01-26</td>
		      		<td>10:00 ~ 12:00</td>
		      		<td>Y</td>
		      		<td>
		      			<a href="/admin/schedule/modify" class="btn btn-outline-primary btn-sm">수정</a>
		      		</td>
		    	</tr>
		    </tbody>
	    </table>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$(function () {
		let $firstSelect = $('#cinema-select').empty();
		let secondSelect = '<option value="" selected disabled>-- 지역을 먼저 선택하세요. --</option>';
		$firstSelect.append(secondSelect);
	})

	$('#city-select').change(function () {
		let no = $(this).val();
		
		let $select = $("#cinema-select").empty();
		
		$.getJSON("/rest/cinema/list", {cityNo:no}, function (cinemaList) {
			$.each (cinemaList, function(index, cinema) {
				
				let option = '<option value="${cinema.cityNo }">' + cinema.cinemaName + '</option>';
				
				$select.append(option);
			})
		})
	})

</script>
</html>