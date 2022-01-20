<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 영화상세정보</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-10">
		<h1>영화 상세</h1>
		</div>
		<hr size="3px" color="black">
	</div>
	<div class="row mb-3">
		<div class="col-3 mb-3">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="...">
		</div>
		<div class="col-9 mb-3">
			<h3>스파이더맨-노 웨이 홈</h3>
			<span style="font-size: 12pt;">spider-Man: No Way Home</span>
			<br><br>
			<span style="font-size: 11pt;">예매율 22.5%</span>
			<hr color="black">
			<span style="font-size: 11pt;">감독: </span>
			<br>
			<span style="font-size: 11pt;">장르: </span>
			<br>
			<span style="font-size: 11pt;">개봉: </span>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>