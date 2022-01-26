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
	<div class="row">
		<ul class="nav nav-tabs nav-justified">
		  <li class="nav-item">
		    <a class="nav-link" href="detail?no=20210028">주요정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="trailer?no=20210028">트레일러/스틸컷</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="customerrating?no=20210028">평점/리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">상영시간표</a>
		  </li>
		</ul>	
	</div>
	
	<div class="row mb-3">
		<hr color="black">
		<p style="color:#351f67; font-weight:bold; ">티저 예고편</p>
		<hr color="black">
	</div>
	<div class="row mb-3">
		<div class="col align-self-center">
			<i class="far fa-arrow-alt-circle-left fa-3x"></i>
		</div>
		<div class="col">
			<iframe width="800" height="450" src="https://www.youtube.com/embed/W7edvITC9g4"></iframe>
		</div>
		<div class="col align-self-center">
			<i class="far fa-arrow-alt-circle-right fa-3x"> </i>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col align-self-center">
			<i class="fas fa-chevron-left fa-3x"></i>
		</div>
		<div class="col">
			<iframe width="240" height="136" src="https://www.youtube.com/embed/W7edvITC9g4"></iframe>
		</div>
		<div class="col">
			<iframe width="240" height="136" src="https://www.youtube.com/embed/7HEAfb9EDvM"></iframe>
		</div>
		<div class="col">
			<iframe width="240" height="136" src="https://www.youtube.com/embed/yFZh-Wqi7RI"></iframe>		
		</div>
		<div class="col align-self-center">
			<i class="fas fa-chevron-right fa-3x"></i>
		</div>
	</div>
	  
	
	
	
	
	<div class="row">
		<hr color="black">
		<p> []영화제목]에 대한 [?]개의 스틸컷이 있어요!
	</div>
	<div class="row">
		<div class="col">
			<img src="/resources/images/movie/spiderman_image1.jpg" class="d-block w-100" alt="...">
		</div>
		<div class="col">
			<img src="/resources/images/movie/spiderman_image2.jpg" class="d-block w-100" alt="...">
		</div>
		<div class="col">
			<img src="/resources/images/movie/spiderman_image3.jpg" class="d-block w-100" alt="...">
		</div>
		<div class="col">
			<img src="/resources/images/movie/spiderman_image4.jpg" class="d-block w-100" alt="...">
		</div>
	</div>
	<div class="row">
		페이지네이션
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

$(document.getElementsByTagName("img")).on("click", function(){
	$(this).modal();
})

</script>
</body>
</html>