<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8"> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 카카오 로그인 지원 자바스크립트-->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<c:set var="menu" value="home"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%-- 상영예정작 트레일러 등록 모달 --%>
<div class="modal fade" id="modal-register-trailer" data-bs-backdrop="static" tabindex="-1" aria-labelledby="로그인 모달" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
   			<div class="modal-header">
     			<h5 class="modal-title" id="exampleModalLabel">상영예정작 트레일러 등록</h5>
     			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
   			</div>
      		<div class="modal-body">
				<div class="row">
					<form class="border bg-light" method="post" action="" id="form-register-trailer">
						<div class="mb-3 mt-3">
							<label class="form-label">영화 제목</label>
							<input type="text" class="form-control" name="title">
						</div>
						<div class="mb-3">
							<label class="form-label">시놉시스</label>
							<input type="password" class="form-control" name="summary">
						</div>
						<div class="mb-3">
							<label class="form-label">트레일러</label>
							<input type="password" class="form-control" name="password">
						</div>
						<div class="mb-1">
							<button class="btn btn-danger w-100" id="button-apply-form">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%--상영예정작 표시 --%>
<div class="container-fluid bg-black mt-0">
	<div class="d-flex justify-content-center">
		<div class="col-6">
			<div class="ratio ratio-16x9">
			  	<video autoplay="autoplay" loop="loop" muted="muted">
				    <source src="http://h.vod.cgv.co.kr/vodCGVa/84949/84949_199155_1200_128_960_540.mp4" type="video/mp4">
				</video>
			</div>
		</div>
		<div class="col-3 p-5 align-self-center">
			<form action="">
				<div class="row">
			            <p class="fs-1 text-start text-white fw-bolder text-truncate">
			            	<a href="" class="link-light text-decoration-none" data-bs-toggle="tooltip" title="스파이더맨-노 웨이 홈">스파이더맨-노 웨이 홈</a>
			            </p>
			            <p class="text-start text-white fw-bolder">
			            	어둠을 뚫고 그가 온다<br>
			            	3월 IMAX 대개봉<br>
			            </p>
		        </div>
		        <div class="row">
		        	<div class="col d-flex justify-content-start align-items-center">
		        		<button class="btn btn-light btn-sm h-75 me-1" type="submit"><strong>상세보기&ensp;></strong></button>
		        		<a href=""><i class="bi bi-play-circle text-white fs-1 d-none me-1" id="play"></i></a>
		        		<a href=""><i class="bi bi-pause-circle text-white fs-1 me-1" id="pause"></i></a>
		        		<a href=""><i class="bi bi-volume-up text-white fs-1 me-1" id="volume-on"></i></a>
		        		<a href=""><i class="bi bi-volume-mute text-white fs-1 d-none me-1" id="mute"></i></a>
		        		<c:if test="${LOGINED_CUSTOMER.isAdmin eq 'Y' }">
			        		<a href=""><i class="bi bi-gear text-white fs-5" id="button-register-trailer"></i></a>
		        		</c:if>
		        	</div>
		        </div>
			</form>
		</div>
	</div>
</div>

<%-- 박스오피스 TOP4 --%>
<div class="container-fluid bg-dark py-5 px-5">
	<div class="row d-flex justify-content-center">
		<div class="col-8">
			<div class="row">
				<div class="col">
					<h1 class="text-white text-center">박스오피스</h1>
				</div>
			</div>
			<div class="row">
				<div class="col text-end">
					<a class="link-light" href="">더 많은 영화보기+</a>
				</div>
			</div>
			<c:forEach var="movie" items="movie" end="4">
				<div class="row d-flex justify-content-evenly">
					<div class="card col-2 p-1 d-flex justify-content-center align-self-center">
						<div class="row">
					  		<img src="/resources/images/movie/moviePoster/${movie.no }.jpg" class="w-100 my-auto" alt="...">
						</div>
						<div class="card-body d-flex justify-content-center p-0">
							<a type="button" class="btn btn-danger w-100"><span>예매</span></a>
							<a type="button" class="btn btn-outline-secondary"><span class="bi bi-heart-fill"></span></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%--영화평점순위 --%>
<div class="container mt-3">
	<div class="row d-flex justify-content-center">
		<div class="col-8 border border-light">
			<div class="row">
				<div class="card-header">
					<strong>영화 평점 순위</strong>
				</div>
			</div>
			<div class="row">
				<ul class="nav nav-tabs">
					<li class="nav-item">
				    	<a class="nav-link link-dark text-decoration-none active" aria-current="page" href="#">전체</a>
				  	</li>
					<li class="nav-item">
				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르1</a>
				  	</li>
					<li class="nav-item">
				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르2</a>
				  	</li>
					<li class="nav-item">
				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르3</a>
				  	</li>
				</ul>
			</div>
			<div class="row">
				<div class="card col-3 p-1 d-flex justify-content-center align-self-center">
					<div class="carousel slide carousel-fade" id="carouselExampleFade" data-bs-ride="carousel">
						<div class="row">
							<div class="carousel-inner">
						    	<div class="carousel-item active">
						      		<img src="https://movie-phinf.pstatic.net/20190109_149/1546998123676c6LjJ_JPEG/movie_image.jpg" class="d-block w-100 my-auto" alt="...">
						    	</div>
						    	<div class="carousel-item">
						      		<img src="https://movie-phinf.pstatic.net/20200914_150/1600046531864xvhtF_JPEG/movie_image.jpg" class="d-block w-100 my-auto" alt="...">
						    	</div>
						    	<div class="carousel-item">
						      		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85291/85291_1000.jpg" class="d-block w-100 my-auto" alt="...">
						    	</div>
						  	</div>
						</div>
					  	<div class="card-body d-flex justify-content-center p-0">
							<a type="button" class="btn btn-danger w-100"><span>예매</span></a>
							<a type="button" class="btn btn-outline-secondary"><span class="bi bi-heart-fill"></span></a>
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
				<div class="col-8 p-4">
					<div class="row">
						<span class="fs-4 text-start fw-bolder">한줄평</span>
					</div>
					<div class="row p-2">
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
										<td colspan="5">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
									</tr>
								</tbody>
							</table>
						</div>
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
										<td colspan="5">한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평한줄평</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 최근 커뮤니티 인기글 --%>
<div class="container mt-3 mb-3">
	<div class="row d-flex justify-content-center">
		<div class="col-8 border border-light">
			<div class="row">
				<div class="card-header">
					<span class="ms-2 fw-bold">1일 인기글</span>
				</div>
			</div>
			<div class="row">
				<div class="card py-3 d-flex justify-content-center">
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-9">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-9">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-9">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-9">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-9">
							<p>인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글인기글</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 최근 커뮤니티 추천글 --%>
<div class="container mt-3 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="col-8 border border-light">
			<div class="row">
				<div class="card-header">
					<span class="ms-2 fw-bold">1일 추천글</span>
				</div>
			</div>
			<div class="row">
				<div class="card py-3 d-flex justify-content-center">
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-9">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-9">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-9">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-9">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-9">
							<p>추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글추천글</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	// 비디오 인터페이스
	let $video = $('video').get(0);
	
	$('#pause').click(function(Event) {
		event.preventDefault();
		$video.pause();
		$('#pause').addClass('d-none');
		$('#play').removeClass('d-none');
	});
	
	$('#play').click(function(Event) {
		event.preventDefault();
		$video.play();
		$('#play').addClass('d-none');
		$('#pause').removeClass('d-none');
	});
	$('#volume-on').click(function(Event) {
		event.preventDefault();
		$('video').prop('muted', false);
		$('#volume-on').addClass('d-none');
		$('#mute').removeClass('d-none');
	});
	
	$('#mute').click(function(Event) {
		event.preventDefault();
		$('video').prop('muted', true);
		$('#mute').addClass('d-none');
		$('#volume-on').removeClass('d-none');
	});
	
	// 상영예정작 등록
	
	
})
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>