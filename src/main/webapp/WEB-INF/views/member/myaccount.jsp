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
</head>
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
 }
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row bg-light p-3 mb-2">
		<div class="col-12">
			<c:choose>
				<c:when test="${empty LOGINED_CUSTOMER.nickName}">
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${ LOGINED_CUSTOMER.name}</span>님&nbsp; 반갑습니다.&nbsp;
						<a href="" class="link-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="닉네임을 설정해주세요.">
							<i class="bi bi-pen" style="font-size: 0.5em;" ></i>
						</a>
					</p>
				</c:when>
				<c:otherwise>
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${ LOGINED_CUSTOMER.nickName}</span>님&nbsp; 반갑습니다.&nbsp;
						<a href="" class="link-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="닉네임 바꾸러 가기">
							<i class="bi bi-pen" style="font-size: 0.5em;" ></i>
						</a>
					</p>
				</c:otherwise>
			</c:choose>
			<p class="fs-3">
				고객님의 등급은 <span class="text-decoration-underline">${LOGINED_CUSTOMER.gradeCode }</span> 입니다.
			</p>
		</div>
	</div>
	<div class="d-flex justify-content-around mb-2">
		<div class="col-5 bg-light p-3">
			<div class="row">
				<table class="table table-borderless">
					<thead>
						<tr>
							<td class="fs-4"><a class="text-decoration-none text-decoration-underline link-dark" href="/myaccount/mypoint/history">MVF POINT +</a></td>
						</tr>
					</thead>
					<tbody class="mx-3">
						<tr>
							<th class="col-7 fs-5 text-start">사용가능 포인트</th>
							<td class="col-7 fs-5 text-end">${ LOGINED_CUSTOMER.totalPoint } 점</td>
						</tr>
						<tr>
							<th class="col-4 fs-5 text-start">다음 등급까지 남은 포인트</th>
							<td class="col-4 fs-5 text-end">5000 점</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="row">
						<h3>MY 영화관
							<a class="link-secondary" href=""><i class="bi bi-gear" style="font-size: 0.5em;"></i></a>
						</h3>
					</div>
					<div class="d-flex justify-content-evenly">
						<button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 가락</button>
						<button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 용산</button>
						<button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 강남</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6 bg-light p-4">
			<div class="row">
				<div class="col">
					<div class="d-flex justify-content-between">
						<span class="h3">찜한 영화</span>
						<span class="align-self-end"><a href="" class="text-decoration-none link-dark">더 보러 가기</a></span>
					</div>
					<c:choose>
						<c:when test="${empty wishMovies }">
							<div class="row text-center mt-4">
								<p class="fs-1">찜한 영화가 없습니다.</p>
								<p class="fs-3">보고 싶은 영화를 "찜" 해 보세요.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-center">
								<c:forEach var="wishMovie" items="${wishMovies }" varStatus="loop" end="2">
										<div class="col-4">
											<div class="card w-75">
												<img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201602/19/htm_20160219165732323457.jpg" class="card-img-top" alt="...">
												<h6 class="card-title mt-1 text-truncate">${wishMovie.title }</h6>
											</div>
										</div>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>	 
		</div>
	</div>
</div>

<%-- 서브메뉴 --%>
<div class="container">
	<%-- 서브메뉴 네비 --%>
	<ul class="nav nav-tabs d-flex justify-content-center" id="sub-menu-tab">
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none fw-bolder" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-ticket-tab">결제내역</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none fw-bolder" href="" id="booking-list-item">예매내역</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="order-list-item">구매내역</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="cancle-list-item">취소내역</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-movie-tab">MY 무비로그</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="wish-movie-item">찜한 영화</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="watched-movie-item">내가 본 영화</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-document-tab" id="my-talk">MY 수다</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-scrap-item">스크랩 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-document-item">작성 글 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-comment-item">작성 한줄평 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-reply-item">작성 댓글 보기</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-point-tab">MY MVF 포인트</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="point-info-item">포인트 안내</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="point-history-item">포인트 내역</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-info-tab">MY 정보관리</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="info-modify-item">회원 정보 변경</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="info-delete-item">회원 탈퇴</a></li>
			</ul>
		</li>
	</ul>
	
	<%-- 서브메뉴 모음 --%>
	<div class="container mb-5" id="sub-menu-list-container">
		<%-- 서브메뉴: 결제내역 --%>
		<div class="row" id="booking-list">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">예매 내역이 존재하지 않습니다.</p></div>
			</div>
		</div>
		<div class="row d-none" id="order-list">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">구매 내역이 존재하지 않습니다.</p></div>
			</div>
		</div>
		<div class="row d-none" id="cancle-list">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">취소 내역이 존재하지 않습니다.</p></div>
			</div>
		</div>
		
		<%-- 서브메뉴: 무비로그 --%>
		<div class="d-flex justify-content-evenly flex-wrap d-none p-3" id="wish-movie">
			<c:choose>
				<c:when test="${empty wishMovies }">
					<div class="col p-5 my-5">
						<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
						<div class="row text-center"><p class="fs-1">찜한 영화가 존재하지 않습니다.</p></div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="wishMovie" items="${wishMovies }" varStatus="loop" end="9">
						<div class="card col-2 p-1 m-1">
					  		<img src="https://img.megabox.co.kr/SharedImg/2022/01/04/yqN0gFPGfFRXuLVO9RSEC5gXslCEn22k_420.jpg" class="image-fluid" alt="...">
					  		<div class="card-body p-1 row">
								<div class="d-flex justify-content-between">
									<button class="btn btn-lg btn-danger col-9" type="button">상세정보</button>
									<a href="">
										<i class="bi bi-heart-fill text-danger align-middle" style="font-size: 2em;"></i>
									</a>
								</div>
					 		</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row d-none" id="watched-movie">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">내가 본 영화가 존재하지 않습니다.</p></div>
			</div>
		</div>
		
		<%-- 서브메뉴: 수다 --%>
		<div class="row d-none" id="my-scrap">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">스크랩</p></div>
			</div>
		</div>
		<div class="row d-none" id="my-document">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">작성글</p></div>
			</div>
		</div>
		<div class="row d-none" id="my-comment">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">한줄평</p></div>
			</div>
		</div>
		<div class="row d-none" id="my-reply">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">댓글</p></div>
			</div>
		</div>
		
		<%-- 서브메뉴: 포인트 --%>
		<div class="row d-none" id="point-info">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">포인트 정보</p></div>
			</div>
		</div>
		<div class="row d-none" id="point-history">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">포인트 기록</p></div>
			</div>
		</div>
		
		<%-- 서브메뉴: MY정보 --%>
		<div class="row d-none" id="info-modify">
			<div class="col p-5 my-5">
				<div class="row text-center">
					<p class="fs-1">비밀번호 재확인</p>
					<p>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>	
				</div>
				<div class="row">
					<form class="col-6 offset-3 border p-4 mb-5 bg-light w-50" method="post" action="check-password">
						<div class="mb-3 row">
							<label class="col-3 col-form-label">아이디</label>
						    <div class="col-9">
						    	<input type="text" readonly class="form-control-plaintext" name="id" value='<c:out value="${LOGINED_CUSTOMER.id }" />'>
						    </div>
						</div>
					  	<div class="mb-3 row">
					    	<label class="col-3 col-form-label">비밀번호</label>
					    	<div class="col-9">
					      		<input type="password" class="form-control" name="password">
					    	</div>
					  	</div>
					  	<div class="row">
							<button class="btn btn-danger w-100" id="check-password" type="submit">비밀번호 확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row d-none" id="info-delete">
			<div class="col p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">회원 탈퇴</p></div>
			</div>
		</div>
	</div>
	
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">
$(function() {
	// 결제내역
	$('#booking-list-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#booking-list-item').addClass('fw-bolder')
		$('#my-ticket-tab').addClass('fw-bolder')
		$('#booking-list').removeClass("d-none")
	});
	$('#order-list-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#order-list-item').addClass('fw-bolder')
		$('#my-ticket-tab').addClass('fw-bolder')
		$('#order-list').removeClass("d-none")
	});
	$('#cancle-list-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#cancle-list-item').addClass('fw-bolder')
		$('#my-ticket-tab').addClass('fw-bolder')
		$('#cancle-list').removeClass("d-none")
	});
	
	// MY무비로그
	$('#wish-movie-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#wish-movie-item').addClass('fw-bolder')
		$('#my-movie-tab').addClass('fw-bolder')
		$('#wish-movie').removeClass("d-none")
	});
	$('#watched-movie-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#watched-movie-item').addClass('fw-bolder')
		$('#my-movie-tab').addClass('fw-bolder')
		$('#watched-movie').removeClass("d-none")
	});
	
	// MY수다
	$('#my-scrap-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#my-scrap-item').addClass('fw-bolder')
		$('#my-document-tab').addClass('fw-bolder')
		$('#my-scrap').removeClass("d-none")
	});
	$('#my-document-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#my-document-item').addClass('fw-bolder')
		$('#my-document-tab').addClass('fw-bolder')
		$('#my-document').removeClass("d-none")
	});
	$('#my-comment-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#my-comment-item').addClass('fw-bolder')
		$('#my-document-tab').addClass('fw-bolder')
		$('#my-comment').removeClass("d-none")
	});
	$('#my-reply-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#my-reply-item').addClass('fw-bolder')
		$('#my-document-tab').addClass('fw-bolder')
		$('#my-reply').removeClass("d-none")
	});
	
	// 포인트
	$('#point-info-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#point-info-item').addClass('fw-bolder')
		$('#my-point-tab').addClass('fw-bolder')
		$('#point-info').removeClass("d-none")
	});
	$('#point-history-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#point-history-item').addClass('fw-bolder')
		$('#my-point-tab').addClass('fw-bolder')
		$('#point-history').removeClass("d-none")
	});
	
	// 내정보
	$('#info-modify-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#info-modify-item').addClass('fw-bolder')
		$('#my-info-tab').addClass('fw-bolder')
		$('#info-modify').removeClass("d-none")
	});
	
	$('#info-delete-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#info-delete-item').addClass('fw-bolder')
		$('#my-info-tab').addClass('fw-bolder')
		$('#info-delete').removeClass("d-none")
	});
	
})



	
</script>
</body>
</html>