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
			<img src="/resources/images/movie/spiderman.png" class="rounded float-start" alt="...">
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
		상단 네비바
	 -->
	<div class="row">
		<ul class="nav nav-tabs nav-justified">
		  <li class="nav-item">
		    <a class="nav-link" href="detail?no=20210028">주요정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="trailer?no=20210028">트레일러/스틸컷</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="customerrating?no=20210028">평점/리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">상영시간표</a>
		  </li>
		</ul>	
	</div>
	
	<div class="row mb-3">
		<div class="col-10">
			<p>[영화제목]에 대한 [갯수]개의 이야기가 있어요!</p>
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
				 		[영화제목] 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
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