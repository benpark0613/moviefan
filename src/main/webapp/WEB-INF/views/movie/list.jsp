<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 무비차트</title>
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
		<h1>무비 차트</h1>
		</div>
		<div class="col-2 text-align-right">
		<a href=""><span class="align-middle" style="font-size: 12pt;">무비차트</span></a>
		<a href=""><span class="align-middle" style="font-size: 12pt;">상영예정작</span></a>
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
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href="detail?no=100"><span class="movie-title0"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date0" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title1"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date1" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title2"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date2" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title3"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date3" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title4"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date4" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title5"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date5" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title6"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date6" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title7"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date7" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title8"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date8" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="row">
			<img src="/resources/images/spiderman.png" class="rounded float-start" alt="..."> 
			</div>
			<div class="row mb-3">
				<a href=""><span class="movie-title9"><strong></strong></span></a>
				<br>
				<span id="" style="font-size: 10pt;">예매율 35%</span>
				<span class="movie-released-date9" style="font-size: 10pt;"></span>
				<input type="hidden" value="">
			</div>
			<div class="row mb-3">
				<div class="col-8">
					<button type="button" class="btn btn-danger btn-sm">예매하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">
$.getJSON("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f9dd7d979e07f9f15431b68f1cf1ae1d&targetDt=20220101", function(result){
	let movieList = result.boxOfficeResult.dailyBoxOfficeList
	
	for(let i=0; i<=movieList.length; i++){
		$('.movie-title'+i).text(movieList[i].movieNm);
		$('.movie-released-date'+i).text(movieList[i].openDt);
	}
		
})
</script>
</body>
</html>