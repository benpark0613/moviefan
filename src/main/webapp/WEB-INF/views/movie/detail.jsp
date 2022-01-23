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
			<div class="row mb-3">
				<h3>${movie.title }</h3>
				<span style="font-size: 12pt;">spider-Man: No Way Home</span>
				<br><br>
				<span style="font-size: 11pt;">예매율 22.5%</span>
				<br>
				<hr color="black">
				<span style="font-size: 11pt;">감독: ${movie.producer }</span>
				<br>
				<span style="font-size: 11pt;">장르: </span>
				<br>
				<span style="font-size: 11pt;">개봉: ${movie.runTime }</span>
			</div>
			<div class="row mb-3">
				<div class="col-2">
					<button type="button" class="btn btn-danger">예매하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		버튼그룹
	 -->
	<div class="row justify-content-center">
		<div class="col-8" >
			<div class="btn-group" role="group" aria-label="Basic example">
			  <button type="button" class="btn btn-danger">주요정보</button>
			  <button type="button" class="btn btn-danger">트레일러</button>
			  <button type="button" class="btn btn-danger">스틸컷</button>
			  <button type="button" class="btn btn-danger">평점/리뷰</button>
			  <button type="button" class="btn btn-danger">상영시간표</button>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-10">
		<span>줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리
		줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리
		줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리</span>
		</div>
	</div>
	<div class="row">
		<table class="table">
			<tr>
				<th>성별 예매 분포</th>
				<th>연령별 예매 분포</th>
			</tr>
			<tr>
				<td>내용내용내용내용내용내용
					내용내용내용내용
				</td>
				<td>내용내용내용내용내용내용</td>
			</tr>
		</table>
	</div>
	<div class="row mb-3">
		트레일러 ? 건
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>