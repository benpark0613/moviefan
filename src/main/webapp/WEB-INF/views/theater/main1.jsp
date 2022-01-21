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
	<div class="p-5 mb-4 bg-light rounded-3">
		<!-- 지역 선택 -->
		<button id="cinema-cities" class="btn btn-dark">서울</button>
		<!-- 지역별 영화관 이름 -->
		<div class="container mt-4">
			<div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-2">
				<c:forEach var="cinemaName" items="${cinemaNames }">
		    		<div class="col">
						<div id="cinema-name" class="p-4 border bg-light text-center">
				      		<a href="#">${cinemaName.cinemaName }</a>
				      	</div>
		    		</div>
		  		</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 상영시간표 부분 -->



</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	
</script>
</html>