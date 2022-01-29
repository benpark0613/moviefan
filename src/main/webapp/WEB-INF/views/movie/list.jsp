<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 무비차트</title>
   <link type="image/png" href="/resources/images/movie/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
	body, table, div, p, span{
	font-family: NanumBarunGothic; 
	font-weight: bold;
	}
	 a:link { 
	 color: #444; text-decoration: none;
	 }
	 a:visited { 
	 color: #444; text-decoration: none;
	 }
	 a:hover { 
	 color: #444; text-decoration: none;
	 }
	 .pic{
	 position: relative;
	 }
	 .pic .summary{
	 	position: absolute;
	 	z-index: -1;
	 	font-size: 16px;
	 }
	 .pic .rank{
	 	position: absolute;
	 	color : white;
	 	z-index: 1;
	 	margin-left: 10px;
	 	font-size: 2em;
    	font-style: italic;
    	text-shadow: 2px 2px 2px rgb(0 0 0 / 80%);
	 }
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-10">
		<h1>무비 차트</h1>
		</div>
		<div class="col-2 text-align-right align-self-center">
		<a id="movieStatus1" href=""><span class="align-middle" style="font-size: 12pt;">무비차트</span></a>
		<a id="movieStatus2" href=""><span class="align-middle" style="font-size: 12pt;">상영예정작</span></a>
		</div>
		<hr size="3px" color="black">
	</div>
	<div class="row mb-3">
		<div class="col-10">
			<input class="form-check-input" type="checkbox">
			<label class="form-check-label">
				현재 상영작만 보기
			</label>	
		</div>
		<div class="col-2">
			<div class="btn-group">
			  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    예매율순
			  </button>
			  <ul class="dropdown-menu">
			  	<li><a class="dropdown-item active" href="#">예매율순</a></li>
			  	<li><a class="dropdown-item" href="#">평점순</a></li>
			  	<li><a class="dropdown-item" href="#">관람객순</a></li>
			  </ul>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<c:forEach var="movie" items="${movie }" varStatus="status">
			<div class="col-4 mb-3">
				<div class="row pic">
					<span class="rank">${status.count }</span>
					<img class="imgs" src="/resources/images/movie/moviePoster/${movie.no }.jpg" class="rounded float-start" alt="..."> 
					<span class="summary">${movie.summary }</span>
				</div>
				<div class="row">
					<div class="col-1">
						<img alt="" src="/resources/images/movie/age/age_15.png">
					</div>
					<div class="col">
						<a href="detail?no=${movie.no }"><span style="font-size: 15pt"><strong>${movie.title }</strong></span></a>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<span style="font-size: 12pt; color:#444;">예매율 35%</span>
					</div>
					<div class="col-7">
						<span style="font-size: 12pt;">개봉일 <fmt:formatDate value="${movie.openDate }" pattern="yyyy.MM.dd" /></span>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<button type="button" class="btn btn-outline-dark" style="padding-left:20px; padding-right:20px;"><i class="far fa-heart fa-lg"></i><span> 1234</span></button>
						<button type="button" class="btn btn-danger btn-block" style="padding-left:90px; padding-right:90px;"><span>예매</span></button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">
/*
$.getJSON("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f9dd7d979e07f9f15431b68f1cf1ae1d&targetDt=20220101", function(result){
	let movieList = result.boxOfficeResult.dailyBoxOfficeList
	
	for(let i=0; i<=movieList.length; i++){
		$('.movie-title'+i).text(movieList[i].movieNm);
		$('.movie-released-date'+i).text(movieList[i].openDt);
	}
		
})
*/

$("#movieStatus1").prepend($("<span>▶</span>"));
$("#movieStatus1").find("span").css("color", "#b12e2e");

$(".imgs").hover(function(){
	$(this).css("opacity", 0.3);
}, function(){
	$(this).css("opacity", 1);
})


$("#movieStatus2").hover(function(){
	$(this).prepend($("<span>▶</span>"))
	$(this).find("span").css("color", "#b12e2e");
}, function(){
	$(this).find("span").first().remove();
	$(this).find("span").css("color", "#444");
})
</script>
</body>
</html>