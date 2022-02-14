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
/* 		body { */
/* 			font-family: NanumBarunGothic; */
/* 			font-size: 16pt; */
/* 		} */
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
	<!-- 수정폼에서 되돌아왔을 때의 파라미터 값으로, 바로 이전에 클릭했던 셀렉트박스값 2개가 선택되어 있도록 하는 부분 -->
	<div class="col">
		<input type="hidden" id="param-page" name="paramPage" value="${param.page }">
		<input type="hidden" id="param-cityNo" name="paramCityNo" value="${param.cityNo }">
		<input type="hidden" id="param-cinemaNo" name="paramCinemaNo" value="${param.cinemaNo }">
	</div>
	<div class="row">
		<div class="col">
			<h1>상영일정 조회</h1>
		</div>
	</div>
	<!-- 지역, 영화관 선택부분 -->	
	<div class="row justify-content-center">
 		<div class="row g-2">
 			<!-- 검색버튼을 클릭하면 input hidden의 페이지번호, 지역번호, 상영관번호를 컨트롤러로 전달 -->
	 		<form id="form-search-schedule" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="list">
		 		<div class="col">
		 			<!-- 셀렉트박스 선택옵션이 바뀔 때마다 바뀐 옵션의 value값이 들어있는 부분 -->
		 			<input type="hidden" name="page" value="1">
			 		<input type="hidden" name="cityNo" value="">
			 		<input type="hidden" name="cinemaNo" value="">
		 		</div>
	   			<div class="col-2">
					<select id="city-select" class="form-select">
						<option value="" selected disabled>-- 지역 --</option>
						<c:forEach var="city" items="${cityList }">
							<option value="${city.no }" ${param.cityNo eq city.no ? 'selected' : '' }>${city.name }</option>
						</c:forEach>
					</select>
				</div>
	   			<div class="col-3">
	   				<select id="cinema-select" class="form-select">
						<option value="" selected disabled>-- 영화관을 선택하세요. --</option>
						<c:forEach var="cinema" items="${cinemaList }">
							<option value="${cinema.no }" ${param.cinemaNo eq cinema.no ? 'selected' : '' }>${cinema.name }</option>
						</c:forEach>
					</select>
	   			</div>
	   			<div class="col-2">
					<button type="button" class="btn btn-dark" id="btn-search-schedule">검색</button>
				</div>
	   		</form>
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
			      		<th>수정</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  		<c:choose>
			  			<c:when test="${empty param }">
							<tr>
								<td class="text-center" colspan="7">영화관별 상영일정을 조회할 수 있습니다.<br>먼저 검색옵션을 선택하세요.</td>
							</tr>
						</c:when>
						<c:when test="${empty timetables }">
							<tr>
								<td class="text-center" colspan="7">현재 상영중인 영화가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="timetable" items="${timetables }">
								<tr>
									<td>${timetable.showNo }</td>
									<td>${timetable.hallName }</td>
									<td>${timetable.title }</td>
									<td><fmt:formatDate value="${timetable.showDate}" pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${timetable.startTime}" pattern="HH:mm"/> ~ <fmt:formatDate value="${timetable.endTime}" pattern="HH:mm"/></td>
									<td>
										<a href="/admin/schedule/modify?page=${param.page }&cityNo=${timetable.cityNo }&cinemaNo=${timetable.cinemaNo }&showNo=${timetable.showNo }" class="btn btn-outline-primary btn-sm">수정</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
				</c:choose>
			    </tbody>
		    </table>
	    </form>
	</div>
	<!-- 페이지네이션 -->
	<c:if test="${pagination.totalRecords gt 0 }">
		<div class="row mb-3">
			<div class="col" id="pagination">
				<nav>
					<ul class="pagination justify-content-center">
				    	<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
				    		<a class="page-link" href="list?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전 &nbsp;&nbsp;</a>
				    	</li>
				    	<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					    	<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
					    		<a id="current-page" class="page-link" href="list?page=${num }" data-page="${num }">${num } </a>
					    	</li>
				    	</c:forEach>
				    	<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
				    		<a class="page-link" href="list?page=${pagination.nextPage }" data-page="${pagination.nextPage }"> &nbsp;&nbsp; 다음</a>
				    	</li>
					</ul>
				</nav>
			</div>
		</div>
	</c:if>
</div>
</body>
<script type="text/javascript">

	$(function () {

		// 1. 지역선택 셀렉트박스가 변경될 때마다 실행될 이벤트 핸들러 함수
		$('#city-select').change(function () {
			// 선택한 지역번호를 input hidden에 저장한다.
			let cityNo = $(this).val();
			$('input[name=cityNo]').val(cityNo);
			// 영화관 선택 셀렉트박스를 비워둔다.
			let $select = $("#cinema-select").empty();
			$select.prepend('<option value="" disabled selected>--영화관을 선택하세요. --</option>');
			// ajax로 선택한 지역번호에 해당하는 영화관 리스트를 받아온다.
			$.getJSON("/rest/cinema/list", {cityNo:cityNo}, function (cinemaList) {
				$.each (cinemaList, function(index, cinema) {
					let option = '<option value="' + cinema.no + '" >' + cinema.name + '</option>';
					
					$select.append(option);
				})
			})
		})
		
		// 2. 상영관이 변경될 때마다 실행될 이벤트 핸들러 함수
		$('#cinema-select').change(function () {
			// 선택한 상영관 번호를 input hidden에 저장한다.
			let cinemaNo = $(this).val();
			$('input[name=cinemaNo]').val(cinemaNo);
		})
		
		// 3. 검색하기 버튼을 클릭했을 때 실행될 이벤트 핸들러 함수
		$('#btn-search-schedule').click(function () {
			// input hidden에 저장해놨던 페이지번호와 지역번호, 상영관번호를 서버로 제출한다.
			let cityNo = $('input[name=cityNo]').val();
			let cinemaNo = $('input[name=cinemaNo]').val();
			// 지역번호와 상영관번호가 둘 다 있으면 제출, 하나라도 선택되어 있지 않으면 경고창 표시
			if (cityNo && cinemaNo) {				
				$("#form-search-schedule").trigger("submit");
			} else {
				alert("검색조건을 선택하세요.");					
			}
		})
		
		// 4. 페이지번호를 클릭했을 때 실행될 이벤트핸들러 함수
		$(".pagination a").click(function(e) {
			e.preventDefault();
			// 클릭한 페이지번호를 조회해서 input hidden에 클릭한 페이지번호를 저장한다.
			let pageNo = $(this).attr("data-page");
			$("input[name=page]").val(pageNo);
			// 클릭한 페이지번호를 서버로 제출한다.
			$("#form-search-schedule").trigger("submit");
		});
		
		// 5. 수정페이지에서의 목록으로 되돌아가기 기능 관련	
		// 수정페이지의 파라미터값(지역번호, 영화관번호, 페이지번호)을 가져온다.
		let paramCityNo = $('input[name=paramCityNo]').val();
		let paramCinemaNo = $('input[name=paramCinemaNo]').val();
		let paramPage = $('input[name=paramPage]').val();
		
		// 5-1. 파라미터가 비어있지 않다면(=수정화면에서 되돌아온 경우) 실행되는 부분
		// (파라미터가 비어있다면 제일 처음으로 조회페이지에 들어온 것임)
		if (paramCityNo != ""  && paramCinemaNo != "") {
			// 지역별 영화관 셀렉트박스를 비워둔다.
			let $select = $("#cinema-select").empty();
			// ajax로 지역별 영화관 리스트를 받아온다.
			$.getJSON("/rest/cinema/list", {cityNo:paramCityNo}, function (cinemaList) {
				$.each (cinemaList, function(index, cinema) {
					// 받아온 지역별 영화관 리스트의 cinemaNo와 파라미터값이 같다면 해당 영화관 옵션이 선택되어 있도록 한다.
					let option = '<option value="' + cinema.no + '"  ' + (cinema.no == paramCinemaNo ? 'selected' : '') + '>' + cinema.name + '</option>';
					// 영화관 셀렉트박스에 옵션을 채운다.
					$select.append(option);
				});
				// 수정페이지에서 넘어온 파라미터값을 현재페이지에 저장한다.
				$('input[name=pageNo]').val(paramPage);
				$('input[name=cityNo]').val(paramCityNo);
				$('input[name=cinemaNo]').val(paramCinemaNo);
			})
		}
	})	
	
</script>
</html>