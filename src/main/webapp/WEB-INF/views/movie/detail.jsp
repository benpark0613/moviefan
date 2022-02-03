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
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/theme/datalab.min.css">
   <script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.pkgd.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   
   <link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
   <script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
   
</head>
<body>
<c:set var="movieNav" value="주요정보"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<%@ include file="top.jsp" %>
	<div class="row mb-3">
	  <h4>줄거리</h4>
	  <p style="font-size: 15px;">${movie.summary }</p>
	</div>
	<div class="row">
		<div class="col">
			<div id="donutChart"></div>
		</div>
		<div class="col">
			<div id="barChart"></div>
		</div>
	</div>
	<div class="row mb-3 bg-light ">
		<span>트레일러 <strong>${countTrailer } 건</strong></span>
	</div>
	<!-- 트레일러 유튜브링크-->
	<div class="row mb-3 justify-content-center">
		<c:forEach var="movieTrailer" items="${movieTrailer }">
			<div class="col-3 trailer text-center">
				<video width="260" height="142" src="${movieTrailer.urlAddress }"></video>
				<br>
				<span>${movieTrailer.title }</span>
			</div>
		</c:forEach>
	</div>
	<div class="row mb-3 bg-light">
		<span>스틸컷 <strong>${countImage } 건</strong></span>
	</div>
	<!-- 캐러셀 -->
	<div class="row mb-3">
		<div id="carouselExampleControls" class="carousel slide" data-bs-touch="false" data-interval="false">
		  <div class="carousel-inner">
		  	<c:forEach var="movieImage" items="${movieImage }" varStatus="status">
			    <div class="carousel-item ${status.count eq 1 ? 'active' : '' }">
			      <img src="/resources/images/movie/${movieImage.filename }" alt="...">
			    </div>
		  	</c:forEach>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	
	<div class="row mb-3">
		<p><strong>${movie.title }</strong>에 대한 [갯수]개의 이야기가 있어요!</p>
	</div>
	<div class="row mb-3">
		<div class="col-2 text-align-center">
			<img alt="" src="/resources/images/movie/ex.png">
			<p>MOVIEFAN</p>
		</div>
		<div class="col-10 border bg-light align-self-center">
			<div class="row">
				<div class="col-10">
				 	<span class="" style="font-size:1.2em; color:#503396;">
				 		[영화제목] 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
					</span>
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
			<div class="col-10 rounded-pill bg-light align-self-center">
				<div class="row">
					<div class="col-1 align-self-center">
					 	<span class="" style="font-size:1.2em; color:#503396;">관람평</span>
					</div>
					<div class="col-1 align-self-center">
						<span style="font-size:1.5em; color:#503396;">10</span>
					</div>
					<div class="col-9 align-self-center">
						<span> 화려한 액션과 시원시원한 바다배경이 좋았습니다.</span>
					</div>
					<div class="col-1 align-self-center">
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
<script type="text/javascript">



var chart = bb.generate({
	size: {
    	height: 200,
    	width: 400
   },
	  data: {
	    columns: [
		["남", 30],
		["여", 120]
	    ],
	    type: "donut", // for ESM specify as: donut()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  bindto: "#donutChart"
	});

var chart = bb.generate({
	   size: {
	    	height: 200,
	    	width: 400
	   },
	  data: {
	    columns: [
		["10대", 200],
		["20대", 180],
		["30대", 200],
		["40대", 30],
		["50대", 50]
	    ],
	    type: "bar", // for ESM specify as: bar()
	  },
	  color: {
		    pattern: [
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8"	
		    ]
		  },
	  bar: {
		  padding: 50,
		  width: {
		      ratio: 0.9,
		      max: 30
		    }
	  },
	  bindto: "#barChart"
	});


</script>
</body>
</html>