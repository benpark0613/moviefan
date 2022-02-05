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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
		body {
			font-family: NanumBarunGothic;
			font-size: 16pt;
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
				</select>
   			</div>
 		</div>
   	</div>

	<!-- 선택한 영화관에서 현재 상영중인 영화 목록 -->
	<div id="list" class="row justify-content-center mt-5 mb-5">
		<form name="scheduleList" method="get" action="/schedule/modify">
			<table id="timetable" class="table">
				<thead>
			    	<tr>
			      		<th>상영번호</th>
			      		<th>상영관</th>
			      		<th>영화제목</th>
			      		<th>상영일</th>
			      		<th>상영시간</th>
			      		<th>상태</th>
			      		<th>수정</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  	
			    </tbody>
		    </table>
	    </form>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$(function () {

		let $firstSelect = $('#cinema-select').empty();
		let secondSelect = '<option value="" selected disabled>-- 지역을 먼저 선택하세요. --</option>';
		$firstSelect.append(secondSelect);
	
		// 지역이 변경될때마다 실행될 이벤트 핸들러 함수 
		$('#city-select').change(function () {
			let no = $(this).val();
			let $select = $("#cinema-select").empty();
			
			$.getJSON("/rest/cinema/list", {cityNo:no}, function (cinemaList) {
				// [{no:10, name:"신촌점"}, {no:11, name:"홍대점"}]
				$.each (cinemaList, function(index, cinema) {
					let option = '<option value="' + cinema.no + '">' + cinema.name + '</option>';
					
					$select.append(option);
				})
			})
		})
		
		// 상영관이 변경될 때마다 실행될 이벤트 핸들러 함수
		// http://localhost/rest/cinema/timetable?cinemaNo=342
		$('#cinema-select').change(function () {
			$('#timetable tbody').empty();
			let cinemaNo = $(this).val();
			
			$.getJSON("/rest/cinema/timetable", {cinemaNo:cinemaNo}, function (timetableList) {
				
				if (timetableList.length == 0) {
					let row = '<td class="text-center" colspan="8">해당 영화관의 상영일정이 존재하지 않습니다.</td>';
					$('#timetable tbody').append(row);
						
				} else {
					$.each (timetableList, function (index, timetable) {
						
						let	result = '<tr>'
							result += '<td>' + timetable.showNo + '</td>'
							result += '<td>' + timetable.hallName + '</td>'
							result += '<td>' + timetable.title + '</td>'
							result += '<td>' + moment(timetable.showDate).format('YYYY-MM-DD') + '</td>'
							result += '<td>' + moment(timetable.startTime).format('HH:mm') + ' ~ ' + moment(timetable.endTime).format('HH:mm') + '</td>'
							result += '<td>상영중</td>'
							result += '<td><a href="/admin/schedule/modify?showNo=' + timetable.showNo + '" class="btn btn-outline-primary btn-sm">수정</a></td>'
							result += '</tr>';
						
						$('#timetable tbody').append(result);
						
						moment(timetable.startTime).format('HH:mm')
						
// 						let date = moment(timetable.showDate).format('YYYY-MM-DD');
// 						$('#;
// 							result += '<td>' + moment(timetable.showDate).format('YYYY-MM-DD') + '</td>'
					})
				}
			})
		})
	})	

</script>
</html>