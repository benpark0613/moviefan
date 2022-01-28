<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
	a {
		color: black;
		text-decoration: none;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<!-- 점보트론 -->
	<div class="p-5 mt-5 mb-5 bg-light rounded-3">
		<div class="container px-4">
			<!-- 지역 선택 -->
			<div class="col mx-2">
				<select id="city-select" name="city" class="form-select form-select-lg w-25 h-10 mb-3">
					<c:forEach var="city" items="${cityList }">
						<option value="20">${city.name }</option>
					</c:forEach>
				</select>
			</div>
			<!-- 영화관 선택 -->
			<div class="col">
				<div class="container mt-4">
					<div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2" id="cinemaBox">
						<c:forEach var="cinema" items="${cinemaList }">
				    		<div id="cinema-select" class="col">
								<div id="cinema" class="p-4 border bg-light text-center">
						      		<a href="#" id="${cinema.cityNo }">${cinema.name }</a>
						      	</div>
				    		</div>
				  		</c:forEach> 
				  		
				  		
				  		<%-- 
				  		<div id="cinema-select" class="col">
								<div id="cinema" class="p-4 border bg-light text-center">
						      		<a href="#" id="">MVF 강남점</a>
						      	</div>
				  		 --%>
				    	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 안내버튼 -->
	<div class="row mt-5 mb-5 justify-content-center hstack gap-2">
		<a href="/theater/price" id="price-info" class="col-2 btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
		관람가격 안내</a>
		<a href="/cinema/location" id="location-info" class="col-2 btn btn-success">위치/주차 안내</a>
	</div>
	<!-- 관람가격 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	<!-- 상영시간표 -->
	<div id="movie-timetable" class="row justify-content-center mt-5 mb-5">
		<c:forEach var="movie" items="${movieTimeTableList }">
		<div class="col-10 px-0">	
			<table class="table">
				<thead>
					<tr>
						<th>
							<span class="fs-2">${movie.title }</span>
							<span class="ml-3">${movie.genre } / </span>
							<span><fmt:formatDate value="${movie.openDate }" pattern="yyyy년 M월 d일"/> 개봉</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="mx-5 my-3">
								<span class="fs-4">${movie.hallName }</span>
								<span>총 ${movie.totalSeats }석</span>
							</div>
							<div class="d-flex align-items-center mx-5">
								<ul class="list-group list-group-horizontal">
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								  <li class="list-group-item mt-2 mb-3 text-center">상영시작시간<br>잔여좌석수</li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</c:forEach>
		<p class="text-end">* 입장 지연에 따른 관람 불편을 최소화하기 위해, 상영시간 10분 후부터 영화가 시작됩니다.</p>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$('#city-select').change(function () {
		let no = $(this).val();
		//alert(cityNo);
		
		let $box = $("#cinemaBox").empty();
		
		$.getJSON("/rest/cinema/list", {cityNo:no}, function (cinemaList) {
			//console.log(response);
			$.each (cinemaList, function(index, cinema) {
				//console.log(cinema)
				
				let content = '<div id="cinema-select" class="col">';
					content += '<div id="cinema" class="p-4 border bg-light text-center">';
		      		content += '<a href="#" id="' + cinema.cityNo + '">' + cinema.cinemaName + '</a>';
		      		content += '</div>';
    				content += '</div>';
    			
    			$box.append(content);
			})
		})
	})
	
	
	
		// 이벤트가 발생해서 함수가 실행되면(change)
		// 극장 리스트를 감싸는 div 엘리먼트를 선택하고
		// 극장 리스트를 div 엘리먼트에 append 한다.
		
		// cityno가 같은 a만 남기기?
	
		/*
			$('#city-select').change(function() {
				var $cityNo = $('[name=city]').val();
				var $cinemaCity = $('#cinema a');
				
				console.log($cinemaCity);
			})
		*/
		
			//var cinemaBox = $("#cinemaBox");
			
			//var cinema = '<div id="cinema-select" class="col">' 
			//	+ '<div id="cinema" class="p-4 border bg-light text-center">'
			//	+ '<a href="#" id="">MVF 강남점</a>'
			//	+ '</div>'
			//	+ '</div>';
		
			//cinemaBox.append(cinema);
		
		
</script>
</html>