<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 관람평</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<c:set var="movieNav" value="평점"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<%@ include file="top.jsp" %>
	
	<div class="row mb-3">
		<div class="col-10">
			<p><strong>${movie.title }</strong>에 대한 [갯수]개의 이야기가 있어요!</p>
		</div>
		<div class="col-2">
			<div class="row">
				<button type="button" class="btn btn-outline-secondary">본 영화 등록</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
			<p>전체[]건</p>
		</div>
		<div class="col-2">
			<p>최신순 공감순 평점순</p>
		</div>
	</div>
	<div class="row mb-3">
		<hr color="black">
		<div class="col-2 text-align-center">
			<img alt="" src="/resources/images/movie/ex.png">
			<p>MOVIEFAN</p>
		</div>
		<div class="col-10 border bg-light">
			<div class="row">
				<div class="col-10">
				 	<p class="" style="font-size:1.2em; color:#503396;">
				 		<strong>${movie.title }</strong> 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
					</p>
				</div>
				<div class="col-2">
					<i class="fas fa-pen fa-lg"></i><span> 관람평 쓰기</span>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="row mb-3">
			<div class="col-2">
				<img alt="" src="/resources/images/movie/bg-profile.png">
				<p>user id</p>
			</div>
			<div class="col-10 rounded-pill bg-light">
				<div class="row">
					<div class="col-1">
					 	<p class="" style="font-size:1.2em; color:#503396;">관람평</p>
					</div>
					<div class="col-1">
						<p style="font-size:1.5em; color:#503396;">10</p>
					</div>
					<div class="col-9">
						<span> 화려한 액션과 시원시원한 바다배경이 좋았습니다.</span>
					</div>
					<div class="col-1">
						<i class="far fa-thumbs-up fa-lg"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="row mb-3">
			<div class="col-2">
				<img alt="" src="/resources/images/movie/bg-profile.png">
				<p>user id</p>
			</div>
			<div class="col-10 rounded-pill bg-light">
				<div class="row">
					<div class="col-1">
					 	<p class="" style="font-size:1.2em; color:#503396;">관람평</p>
					</div>
					<div class="col-1">
						<p style="font-size:1.5em; color:#503396;">10</p>
					</div>
					<div class="col-9">
						<span> 화려한 액션과 시원시원한 바다배경이 좋았습니다.</span>
					</div>
					<div class="col-1">
						<i class="far fa-thumbs-up fa-lg"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="row mb-3">
			<div class="col-2">
				<img alt="" src="/resources/images/movie/bg-profile.png">
				<p>user id</p>
			</div>
			<div class="col-10 rounded-pill bg-light">
				<div class="row">
					<div class="col-1">
					 	<p class="" style="font-size:1.2em; color:#503396;">관람평</p>
					</div>
					<div class="col-1">
						<p style="font-size:1.5em; color:#503396;">10</p>
					</div>
					<div class="col-9">
						<span> 화려한 액션과 시원시원한 바다배경이 좋았습니다.</span>
					</div>
					<div class="col-1">
						<i class="far fa-thumbs-up fa-lg"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		페이지네이션
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>