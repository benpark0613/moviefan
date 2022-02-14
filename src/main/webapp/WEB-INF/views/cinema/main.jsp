<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan :: 극장 및 상영정보</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style>
/* 		body { */
/* 			font-family: NanumBarunGothic; */
/* 			font-size: 16pt; */
/* 		} */
		a {
			color: black;
			text-decoration: none;
		}
	</style>
</head>
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
						<c:choose>
							<c:when test="${empty param.cityNo }">
								<option value="${city.no }" ${city.no eq 20 ? 'selected' : '' }>${city.name }</option>
							</c:when>
							<c:otherwise>
								<option value="${city.no }" ${city.no eq param.cityNo ? 'selected' : '' }>${city.name }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<!-- 영화관 선택 -->
			<div class="col">
				<div class="container mt-4" id="test">
					<div id="cinemaBox" class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2">
						<c:forEach var="cinema" items="${cinemaList }">
							<c:choose>
								<c:when test="${empty param.cityNo and cinema.cityNo eq 20 }">
						    		<div id="cinema-select" class="col">
										<div id="cinema" class="p-4 border bg-light text-center">
								      		<a id="move-to-timetable" href="/cinema/timetable?cityNo=${cinema.cityNo }&cinemaNo=${cinema.no}">${cinema.name }</a>
								      	</div>
						    		</div>
								</c:when>
								<c:when test="${param.cityNo eq cinema.cityNo }">
						    		<div id="cinema-select" class="col">
										<div id="cinema" class="p-4 border bg-light text-center">
								      		<a href="/cinema/timetable?cityNo=${cinema.cityNo }&cinemaNo=${cinema.no}">${cinema.name }</a>
								      	</div>
						    		</div>
								</c:when>
							</c:choose>
				  		</c:forEach> 
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$(function () {
		
		// 지역선택시 해당 지역의 영화관목록 조회
		// 영화관 선택하면 해당 영화관의 상영시간표 페이지로 이동
		$('#city-select').change(function () {
			let cityNo = $(this).val();
			let $box = $("#cinemaBox").empty();
			
			$.getJSON("/rest/cinema/list", {cityNo:cityNo}, function(cinemaList) {
				const date = moment();
				let today = date.format('YYYYMMDD');
					
				$.each (cinemaList, function(index, cinema) {
					let content = '<div id="cinema-select" class="col">';
						content += '<div id="cinema" class="p-4 border bg-light text-center">';
			      		content += '<a href="/cinema/timetable?cityNo='+ cinema.cityNo + '&cinemaNo=' + cinema.no + '&showDate=' + today + '" data-cinemaNo="' + cinema.no + '">' + cinema.name + '</a>';
			      		content += '</div>';
	    				content += '</div>';
	    			
	    			$box.append(content);
 				})
			})
		})
		
		const date = moment();
		let today = date.format('YYYYMMDD');
		
		$('#cinemaBox a').click(function () {
			event.preventDefault();
			let link = $(this).attr('href');
			if (!link.includes('showDate')) {
				let url = link + '&showDate=' + today;
				location.href = url;
			}
		})
		
 	})

</script>
</html>