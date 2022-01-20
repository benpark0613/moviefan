<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan & MoviePen</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8"> 
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="/resources/css/non-responsive.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%--상영예정작 표시 --%>
<div class="container-fluid">
	<div class="col">
		<div class="row mb-3">
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="">
							<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Nail/Nail_1920774.jpg" class="d-block w-100" alt="...">
						</a>
					</div>
					<div class="carousel-item">
						<a href="">
							<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Reverse/0117/Reverse_1920774.jpg" class="d-block w-100" alt="...">
						</a>
					</div>
					<div class="carousel-item">
						<a href="">
							<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ts/0113/Ts_1920774.jpg" class="d-block w-100" alt="...">
						</a>
					</div>
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
	</div>
</div>

<%-- 박스오피스 TOP4 --%>
<div class="container-fluid bg-dark p-3 mb-3">
	<div class="row">
		<div class="col">
			<h1 class="text-white text-center">박스오피스</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col text-end">
			<a class="link-light" href="">더 많은 영화보기+</a>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card border-light">
				<img src="https://img.megabox.co.kr/SharedImg/2022/01/04/yqN0gFPGfFRXuLVO9RSEC5gXslCEn22k_420.jpg" class="card-img" alt="...">
				<div class="card-body d-flex justify-content-between">
					<a href="" class="btn btn-lg btn-danger">예매</a>
					<a href="">
						<i class="bi bi-heart-fill text-danger" style="font-size: 2em;"></i>
					</a>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card border-light">
				<img src="https://img.megabox.co.kr/SharedImg/2022/01/13/B3O9HPZk8OS3TlmefEF197d0kZiaZoaL_420.jpg" class="card-img" alt="...">
				<div class="card-body d-flex justify-content-between">
					<a href="" class="btn btn-lg btn-danger">예매</a>
					<a href="">
						<i class="bi bi-heart-fill text-danger" style="font-size: 2em;"></i>
					</a>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card border-light">
				<img src="https://img.megabox.co.kr/SharedImg/2021/12/16/ixl5QxDVs5Gn8nQN3rslK8BUmgFVklj8_420.jpg" class="card-img" alt="...">
				<div class="card-body d-flex justify-content-between">
					<a href="" class="btn btn-lg btn-danger">예매</a>
					<a href="">
						<i class="bi bi-heart-fill text-danger" style="font-size: 2em;"></i>
					</a>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card border-light">
				<img src="https://img.megabox.co.kr/SharedImg/2022/01/04/q73U2IEyGYZRnxBoW3tHlF84bMKw6X4y_420.jpg" class="card-img" alt="...">
				<div class="card-body d-flex justify-content-between">
					<a href="" class="btn btn-lg btn-danger">예매</a>
					<a href="">
						<i class="bi bi-heart-fill text-danger" style="font-size: 2em;"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 영화랭킹 --%>
<div class="container">
	<div class="row">
		<div class="col">
			<h1 class="text-center">영화 랭킹</h1>
		</div>
	</div>
	<div class="row mb-1">
		<div class="btn-group btn-group-sm" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			<label class="btn btn-outline-secondary" for="btnradio1">전체</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio2">장르1</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio3">장르2</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio3">장르2</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio3">장르2</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio3">장르2</label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-secondary" for="btnradio3">장르2</label>
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			<div class="carousel slide" data-bs-ride="carousel" id="carouselExampleInterval" >
				<div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="2" aria-label="Slide 3"></button>
  				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<a class="d-flex justify-content-center" href="">
							<img src="https://movie-phinf.pstatic.net/20190115_228/1547528180168jgEP7_JPEG/movie_image.jpg" class="align-middle w-75" alt="...">
						</a>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<a class="d-flex justify-content-center" href="">
							<img src="https://movie-phinf.pstatic.net/20200914_150/1600046531864xvhtF_JPEG/movie_image.jpg" class="align-middle w-75" alt="...">
						</a>
					</div>
					<div class="carousel-item">
						<a class="d-flex justify-content-center" href="">
							<img src="https://movie-phinf.pstatic.net/20190109_149/1546998123676c6LjJ_JPEG/movie_image.jpg" class="align-middle w-75" alt="...">
						</a>
					</div>
				</div>
			</div>	
		</div>
		<div class="col-5">
			<div class="row">
				<dl>
					<dt>영화제목</dt>
					<dd>영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용</dd>
				</dl>
			</div>
			<div class="d-flex justify-content-between">
				<a href="" class="btn btn-lg btn-danger">예매</a>
				<a href="">
					<i class="bi bi-heart-fill text-danger" style="font-size: 2em;"></i>
				</a>
			</div>
			<div class="row"></div>
		</div>
	</div>
</div>















	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>