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
   <link href="/resources/css/non-responsive.css" rel="stylesheet">
   <link href="/resources/css/style.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%--상영예정작 표시 --%>
<div class="container-fluid">
	<div class="col">
		<div class="row mb-2">
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Nail/Nail_1920774.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Reverse/0117/Reverse_1920774.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ts/0113/Ts_1920774.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
</div>

<%-- 박스오피스 TOP4 --%>
<div class="container-fluid bg-dark p-2">
	<div class="row">
		<div class="col">
			<h1 class="text-white text-center mt-2">박스오피스</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col text-end">
			<a class="link-light" href="">더 많은 영화보기+</a>
		</div>
	</div>
	<div class="row d-flex justify-content-evenly">
		<div class="card col-3 p-1">
	  		<img src="https://i0.wp.com/kiramonthly.com/wp-content/uploads/2020/02/1.jpg?w=1000&ssl=1" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
		<div class="card col-3 p-1">
	  		<img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201602/19/htm_20160219171437117902.jpg" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
		<div class="card col-3 p-1">
	  		<img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/01/htm_20170201145015529757.jpg" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
	</div>
	<div class="row d-flex justify-content-evenly mt-3">
		<div class="card col-2 p-1">
	  		<img src="https://img.megabox.co.kr/SharedImg/2022/01/04/yqN0gFPGfFRXuLVO9RSEC5gXslCEn22k_420.jpg" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
		<div class="card col-2 p-1">
	  		<img src="https://i0.wp.com/kiramonthly.com/wp-content/uploads/2020/02/3.jpg?resize=1000%2C1429" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
		<div class="card col-2 p-1">
	  		<img src="https://i1.wp.com/kiramonthly.com/wp-content/uploads/2020/02/2.jpg?resize=1000%2C1429" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
		<div class="card col-2 p-1">
	  		<img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201602/19/htm_20160219165732323457.jpg" class="image-fluid" alt="...">
	  		<div class="card-body p-1 row">
				<div class="d-flex justify-content-between">
					<button class="btn btn-lg btn-danger col-9" type="button">예매</button>
					<a href="">
						<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
					</a>
				</div>
	 		</div>
		</div>
	</div>
</div>

<%-- 영화 평점 순위 --%>
<div class="container mt-3">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<strong>영화 평점 순위</strong>
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
				<div class="card mb-3 border-light">
  					<div class="row">
	    				<div class="carousel slide carousel-fade col-4" id="carouselExampleFade" data-bs-ride="carousel">
	    					<div class="row">
							  	<div class="carousel-inner">
							    	<div class="carousel-item active">
							      		<img src="https://movie-phinf.pstatic.net/20190109_149/1546998123676c6LjJ_JPEG/movie_image.jpg" class="d-block w-100" alt="...">
							    	</div>
							    	<div class="carousel-item">
							      		<img src="https://movie-phinf.pstatic.net/20200914_150/1600046531864xvhtF_JPEG/movie_image.jpg" class="d-block w-100" alt="...">
							    	</div>
							    	<div class="carousel-item">
							      		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85291/85291_1000.jpg" class="d-block w-100" alt="...">
							    	</div>
							  	</div>
							  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    		<span class="visually-hidden">Previous</span>
						  		</button>
							  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
						    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
							    	<span class="visually-hidden">Next</span>
							  	</button>
	    					</div>
						</div>
	    				<div class="col-8 p-3">
							<div class="row">
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>작성자</th>
											<td>홍길동</td>
											<th>평점</th>
											<td>4.5/5.0</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
										</tr>
									</tbody>
								</table>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>작성자</th>
											<td>홍길동</td>
											<th>평점</th>
											<td>4.5/5.0</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
										</tr>
									</tbody>
								</table>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>작성자</th>
											<td>홍길동</td>
											<th>평점</th>
											<td>4.5/5.0</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
										</tr>
									</tbody>
								</table>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>작성자</th>
											<td>홍길동</td>
											<th>평점</th>
											<td>4.5/5.0</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
  					</div>
  					<div class="row p-1">
  						<div class="col-4 d-flex justify-content-between">
							<button class="btn btn-lg btn-danger col-10" type="button" style="width: w-100">상세정보</button>
							<a href="">
								<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
							</a>
						</div>
						<div class="col-8"></div>
  					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 최근 커뮤니티 인기글 --%>
<div class="container mt-3">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<strong>1일 인기글</strong>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-11">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-11">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-11">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-11">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-11">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 최근 커뮤니티 추천글 --%>
<div class="container mt-3">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<strong>1일 추천글</strong>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-11">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-11">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-11">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-11">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-11">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>














	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>