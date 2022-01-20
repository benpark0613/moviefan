<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <!-- 
   <meta name="viewport" content="width=device-width, initial-scale=1">
    -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container-fluid">
	<div class="row mb-4">
		<div class="d-flex justify-content-center align-items-center" style="background-color: #000000; color: white; height: 500px; ">
			<h1>상영예정작 트레일러 넣는 자리</h1>
		</div>
	</div>
</div>
<div class="container">
	<div class="d-flex justify-conten-center">
		<div class="col-6 offset-1">
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="https://image.bugsm.co.kr/album/images/500/9955/995589.jpg" class="text-center w-75" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="https://media.istockphoto.com/vectors/cinema-and-movie-time-vector-id640312764?k=20&m=640312764&s=170667a&w=0&h=3NB49ECwQUOyxBRIjwpVGi0gUptsyh6Klqtu9ibhS0E=" class="d-block w-75" alt="...">
					</div>
					<div class="carousel-item">
						<img src="http://imagescdn.gettyimagesbank.com/500/18/950/511/0/911590226.jpg" class="text-center w-75" alt="...">
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
		<div class="col-4">
			<div class="row">
				<dl>
					<dt>영화제목</dt>
					<dd>영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용영화내용</dd>
				</dl>
			</div>
			<div class="row">
				<div class="col-6">
					<button type="button" class="btn btn-warning">예매하기</button>
				</div>
				<div class="col-6">
				 	<button type="button" class="btn btn-outline-secondary">
	                 		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
	 							<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
	                 		<span class="visually-hidden">Button</span>
	               	</button>
				</div>
			</div>
		</div>
	</div>
	

	
	<div>박스오피스</div>
	<div>상영예정작</div>
	<div>영화랭킹</div>
	
	
	
	<div class="row mb-3">
		<div class="col">
			<h2>실시간 베스트</h2>
		</div>
		<div class="col">
			
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<h1>공지사항</h1>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>