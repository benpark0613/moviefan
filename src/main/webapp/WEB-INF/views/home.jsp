<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8"> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="/resources/css/homestyle.css" rel="stylesheet">
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
  	<div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
   			<div class="modal-header">
     			<h5 class="modal-title" id="exampleModalLabel">상영예정작 트레일러 등록</h5>
     			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
   			</div>
      		<div class="modal-body">
				<div class="row">
					<form class="border bg-light" method="post" action="home/registerTrailer" id="form-register-trailer">
						<div class="mb-3 mt-3">
							<label class="form-label">영화 제목</label>
							<select id="titleSelect" class="form-select" aria-label="Default select example">
								<option selected disabled="disabled">영화 선택하세요</option>
							</select>
						</div>
						<div class="mb-3">
							<label class="form-label">트레일러</label>
						</div>
						<div class="row">
							<div class="col" id="trailerInput">
								
							</div>
						</div>
						
						<div class="mb-3">
							<label class="form-label">시놉시스</label>
							<textarea id="summaryText" class="form-control" cols="40" rows="7"></textarea>
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
				    <source src="${movieTrailer.urlAddress }" type="video/mp4">
				</video>
			</div>
		</div>
		<div class="col-3 p-5 align-self-center">
			<form action="">
				<div class="row">
			            <p class="fs-1 text-start text-white fw-bolder text-truncate">
			            	<a href="" class="link-light text-decoration-none" data-bs-toggle="tooltip" title="스파이더맨-노 웨이 홈">${movieTrailer.title }</a>
			            </p>
			            <p class="text-start text-white fw-bolder text-truncate">
			            	${movieTrailer.summary }<br><br>
			            	<fmt:formatDate value="${movieTrailer.openDate }" pattern="M"/>월 IMAX 대개봉<br>
			            </p>
		        </div>
		        <div class="row">
		        	<div class="col d-flex justify-content-start align-items-center">
		        		<a href="movie/detail?no=${movieTrailer.no }"><button class="btn btn-light btn-sm h-75 me-1"><strong>상세보기&ensp;></strong></button></a>
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
					<a class="link-light" href="movie/list">더 많은 영화보기+</a>
				</div>
			</div>
			<div class="row d-flex justify-content-evenly">
				<c:forEach var="movieList" items="${movie }" end="4" varStatus="status">
					<div class="card col-2 p-1 d-flex justify-content-center align-self-center">
						<div class="row pic">
							<span class="rank">${status.count }</span>
					  		<img class="w-100 my-auto imgs" src="/resources/images/movie/moviePoster/${movieList.no }.jpg" alt="...">
					  		<a href="movie/detail?no=${movieList.no }"><button type="button" class="btn btn-outline-secondary btndetail">상세보기</button></a>
					  		<a href="/ticket/booking"><button type="button" class="btn btn-outline-success btnreservation">예매하기</button></a>
							<span class="customerRating">관람평 <strong>${movieList.customerRating }</strong></span>
						</div>
					</div>
				</c:forEach>
			</div>
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
<!-- 			<div class="row"> -->
<!-- 				<ul class="nav nav-tabs"> -->
<!-- 					<li class="nav-item"> -->
<!-- 				    	<a class="nav-link link-dark text-decoration-none active" aria-current="page" href="#">전체</a> -->
<!-- 				  	</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르1</a> -->
<!-- 				  	</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르2</a> -->
<!-- 				  	</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 				    	<a class="nav-link link-dark text-decoration-none" aria-current="page" href="#">장르3</a> -->
<!-- 				  	</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
			<div class="row d-flex justify-content-center my-2" id="div-comment-card">
				<div class="card col-3 p-1 d-flex justify-content-center align-self-center" id="card-ranked-movie">
					<div class="carousel slide carousel-fade" id="div-carousel-body">
						<div class="row">
							<div class="carousel-inner">
								<c:forEach var="rankedMovie" items="${rankedMovies }" varStatus="status">
									<div class="carousel-item ${status.index eq 0 ? 'active' : ''}" id="div-carousel-image" data-rank-movieNo="${rankedMovie.no }" data-count="${status.index }">
										<img src="/resources/images/movie/${rankedMovie.images[0].filename }" class="d-block w-100 my-auto" alt="..." >
									</div>
								</c:forEach>
						  	</div>
						</div>
					  	<div class="card-body d-flex justify-content-center p-0">
							<a type="button" class="btn btn-danger w-100" id="a-movie-detail"><span>상세보기</span></a>
						</div>
					  	<button class="carousel-control-prev" type="button" data-bs-target="" data-bs-slide="prev" id="btn-carousel-prev">
				    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    		<span class="visually-hidden">Previous</span>
				  		</button>
					  	<button class="carousel-control-next" type="button" data-bs-target="" data-bs-slide="next" id="btn-carousel-next">
				    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
					    	<span class="visually-hidden">Next</span>
					  	</button>
					</div>
				</div>
				<div class="col-8 p-4">
				
					<div class="row">
						<span class="fs-4 text-start fw-bolder">한줄평</span>
					</div>
					<div class="row p-2" id="div-comment">
					<c:forEach var="comment" items="${commentsForHomes }">
						<div class="row d-none" data-comment-movieNo="${comment.movieNo }">
							<table class="table table-borderless">
								<thead>
									<tr>
										<th>작성자</th>
										<td>${comment.name }</td>
										<th>평점</th>
										<td>${comment.customerRating }/5.0</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5">${comment.content }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
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
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">'고스트버스터즈' 이반 라이트만 감독 별세</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">혹시 정말 유명한 영화인데 아직까지 안본 영화 있으신가요?</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">대환장 막장 아사리판의 멀티버스 예고편 보고 후다닥 찍은 핫토이 닥터... </a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">올해 박스오피스 1위를 지켜줄 영화는 어떤게 있을까(잡담)</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">'더 배트맨' 일본판 포스터에서 일본어 제거해봤습니다.</a>
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
				<div class="card py-3 d-flex justify-content-center my-1">
					<div class="row d-flex justify-content-center">
						<div class="col-1 text-center">
							<span class="badge bg-danger">1</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">[라라랜드] CGV 2월 24일 재개봉 -> 2월 22일 재개봉</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-warning">2</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">'언차티드' 적당히 킬링타임용</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-dark">3</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">어제 굿즈대리수령 연락두절건으로 글을 썼었습니다.</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">4</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">'더 배트맨' 28일 전야 상영 확정</a>
						</div>
					</div>
					<div class="row d-flex justify-content-center my-1">
						<div class="col-1 text-center">
							<span class="badge bg-secondary">5</span>
						</div>
						<div class="col-9">
							<a class="link-dark" href="">[메가박스 코엑스] 관람요금 기준 변경 안내 (2/14~)</a>
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
	
	$(".pic").hover(function(){
		$(this).find(".imgs").css("opacity", 0.91);
		$(this).find(".imgs").css("filter", "brightness(10%)");
		$(this).find(".btndetail").css("z-index", 1);
		$(this).find(".btnreservation").css("z-index", 1);
		$(this).find(".customerRating").css("z-index", 1);
		
	}, function(){
		$(this).find(".imgs").css("opacity", 1);
		$(this).find(".imgs").css("filter", "brightness(100%)");
		$(this).find(".btndetail").css("z-index", -1);
		$(this).find(".btnreservation").css("z-index", -1);
		$(this).find(".customerRating").css("z-index", -1);
	})
	
	// 상영예정작 등록
	var modal = new bootstrap.Modal(document.getElementById('modal-register-trailer'));
	
	$('#button-register-trailer').click(function(event){
		event.preventDefault();
		
		$.ajax({
			type: 'get',
			url: 'rest/home/trailer',
			dataType: 'json',
			success: function(response){
				modal.show();
				for(var i=0; i<response.item.length;i++){
					var title = '<option value=' + response.item[i].title + '>'+ response.item[i].title + '</option>';
					$("#titleSelect").append(title);
				}
				
				$("#titleSelect").change(function(){
					$("#trailerInput").empty();
					for(var i=0; i<response.item.length;i++){
						if($(this).children("option:selected").text() == response.item[i].title){
							var summary = response.item[i].summary;
							$("#summaryText").val(summary);
							for(var j=0; j<response.item[i].trailers.length;j++){
								var trailer = response.item[i].trailers[j].urlAddress;
								var url = '<div class="mb-3 form-check">'
										+ '<input class="form-check-input" type="radio" name="url" value="'+trailer+'">'
										+ '<label class="form-check-label" for="flexRadioDefault1">'
										+ '<video id="trailerUrl" src="'+trailer+'" controls width="300" height="200"></video>'
										+ '</label> </div>';
							
								$("#trailerInput").append(url);
							}
						}
					}
				})
			}
		})
	})
	
	// 한줄평
	let movieNo = $('.carousel-inner .active').attr('data-rank-movieNo');
	$('#div-comment').find($('[data-comment-movieNo='+movieNo+']')).removeClass('d-none');
	
	$('#btn-carousel-prev').click(function(evnet) {
		event.preventDefault();
		let index = $('.carousel-inner .active').attr('data-count')*1;
		let movieNo = $('.carousel-inner .active').attr('data-rank-movieNo');
		
		$('.carousel-inner .active').removeClass('active');
		index -= 1;
		if (index < 0) {
			index = 9;
		}
		$('.carousel-inner').find($('[data-count='+index+']')).addClass('active');
		
		$('#div-comment').find($('[data-comment-movieNo]')).addClass('d-none')
		$('#div-comment').find($('[data-comment-movieNo='+movieNo+']')).removeClass('d-none');
	})
	$('#btn-carousel-next').click(function(evnet) {
		event.preventDefault();
		let index = $('.carousel-inner .active').attr('data-count')*1;
		let movieNo = $('.carousel-inner .active').attr('data-rank-movieNo');
		
		$('.carousel-inner .active').removeClass('active');
		index += 1;
		if (index > 9) {
			index = 0;
		}
		$('.carousel-inner').find($('[data-count='+index+']')).addClass('active');
		
		$('#div-comment').find($('[data-comment-movieNo]')).addClass('d-none')
		$('#div-comment').find($('[data-comment-movieNo='+movieNo+']')).removeClass('d-none');
	})
	
	$('#a-movie-detail').click(function(event) {
		event.preventDefault();
		let movieNo = $('.carousel-inner .active').attr('data-rank-movieNo');
		let link = '/movie/detail?no=' + movieNo;
		location.href = link; 
	})
	
})
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

























