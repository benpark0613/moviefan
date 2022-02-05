<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon" />
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
 }
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container bg-light mb-3">
	<div class="d-flex justify-content-evenly px-5 pt-5 pb-2">
		<div class="col-5 my-auto">
			<c:choose>
				<c:when test="${empty LOGINED_CUSTOMER.nickName}">
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${LOGINED_CUSTOMER.name}</span>님&nbsp; 반갑습니다.&nbsp;
						<a href="" class="link-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="닉네임을 설정해주세요.">
							<i class="bi bi-pen" style="font-size: 0.5em;" ></i>
						</a>
					</p>
				</c:when>
				<c:otherwise>
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${LOGINED_CUSTOMER.nickName}</span>님&nbsp; 반갑습니다.&nbsp;
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
		<div class="vr p-0 bg-light"></div>
		<div class="col-6"></div>
	</div>
	<div class="d-flex justify-content-evenly px-5 pt-2 pb-5">
		<div class="col-5 my-auto">
			<div class="row">
				<table class="table table-borderless">
					<thead>
						<tr>
							<td class="fs-4"><a class="text-decoration-none text-decoration-underline link-dark" href="/myaccount/mypoint/history">MVF POINT +</a></td>
						</tr>
					</thead>
					<tbody class="mx-3">
						<tr>
							<th class="col-6 fs-5 text-start">사용가능 포인트</th>
							<td class="col-3 fs-5 text-end">${LOGINED_CUSTOMER.totalPoint } 점</td>
						</tr>
						<tr>
							<th class="col-6 fs-5 text-start">다음 등급까지 남은 포인트</th>
							<td class="col-3 fs-5 text-end">5000 점</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr class="w-100 mx-auto"/>
			<div class="row">
				<table class="table table-borderless">
					<thead>
						<tr>
							<td class="fs-4">MY 영화관&nbsp;<a class="link-secondary" href=""><i class="bi bi-gear" style="font-size: 0.5em;"></i></a></td>
						</tr>
					</thead>
					<tbody class="mx-3">
						<tr>
							<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 가락</button></td>
							<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 용산</button></td>
							<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" style="width: 120px; height: 60px;">MVF 강남</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="vr p-0"></div>
		<div class="col-6">
			<div class="row">
				<div class="col">
					<div class="d-flex justify-content-between mb-3 mx-3">
						<span class="h3">찜한 영화</span>
						<span class="align-self-end"><a href="" class="text-decoration-none link-dark">더 보러 가기</a></span>
					</div>
					<c:choose>
						<c:when test="${empty movieWithImages }">
							<div class="row text-center mt-4">
								<p class="fs-1">찜한 영화가 없습니다.</p>
								<p class="fs-3">보고 싶은 영화를 "찜" 해 보세요.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-evenly">
								<c:forEach var="entry" items="${movieWithImages }" varStatus="loop" end="2">
									<c:forEach var="movieImage" items="${entry.value }" end="0">
										<div class="card col-3 p-1 d-flex justify-content-center align-self-center">
											<div class="row">
										  		<img src="/resources/images/movie/${movieImage.filename }" class="w-100 my-auto" alt="...">
											</div>
											<div class="card-body d-flex justify-content-center p-0">
												<a type="button" class="btn btn-danger w-100"><span>상세정보</span></a>
												<a type="button" class="btn btn-outline-secondary"><span class="bi bi-heart-fill"></span></a>
											</div>
										</div>
									</c:forEach>
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
			<a class="nav-link text-dark dropdown-toggle text-decoration-none fw-bolder btn disabled" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-ticket-tab">결제내역</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none fw-bolder" href="" id="booking-list-item">예매내역</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="order-list-item">구매내역</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="cancle-list-item">취소내역</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none btn disabled" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-movie-tab">MY 무비로그</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="wish-movie-item">찜한 영화</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="watched-movie-item">내가 본 영화</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none btn disabled" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-document-tab" id="my-talk">MY 수다</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-scrap-item">스크랩 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-document-item">작성 글 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-comment-item">작성 한줄평 보기</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="my-reply-item">작성 댓글 보기</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none btn disabled" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-point-tab">MY MVF 포인트</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item-text text-decoration-none" href="" id="point-info-item">포인트 안내</a></li>
				<li><a class="dropdown-item-text text-decoration-none" href="" id="point-history-item">포인트 내역</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link text-dark dropdown-toggle text-decoration-none btn disabled" data-bs-toggle="dropdown" role="button" aria-expanded="false" id="my-info-tab">MY 정보관리</a>
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
		<%-- 찜한 영화 --%>
		<div class="d-flex justify-content-evenly d-none" id="wish-movie">
			<div class="col-8">
				<%-- 영화 리스트 --%>
				<div class="row d-flex justify-content-center" id="div-wishlist">
					<div class="spinner-border text-danger my-5" role="status">
					 	<span class="visually-hidden">Loading...</span>
					</div>
				</div>
				<%-- 페이지 내비게이션 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-4">
					<div class="col">
						<nav id="page-navigation">
				  			<ul class="pagination pagination-sm justify-content-center m-0">
				    			<li class="page-item" id="li-prev">
				      				<a class="btn page-link link-dark disabled" data-page="1"><span aria-hidden="true">&laquo;</span></a>
				    			</li>
				    			<li class="page-item" id="li-num">
				    				<a class="btn page-link link-dark disabled" data-page="1">1</a>
				    			</li>	    			
				    			<li class="page-item"  id="li-next">
				      				<a class="btn page-link link-dark disabled" data-page="1"><span aria-hidden="true">&raquo;</span></a>
				    			</li>
				  			</ul>
						</nav>
					</div>
				</div>
				<%-- 검색 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-2">
					<form class="row d-flex justify-content-center gx-1" id="form-search-movie">
						<input type="hidden" name="page" value="1" />
						<div class="col-2">
							<select class="form-select" name="opt" disabled="disabled">
								<option value="title" selected="selected"> 제목 검색</option>
								<option value="actor"> 배우 검색</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="value" value="" placeholder="영화 검색" disabled="disabled">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-dark w-100 h-100" id="btn-search-movie" disabled="disabled">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%-- 내가 본 영화 --%>
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
		<div class="row d-flex justify-content-center d-none mt-3" id="point-info">
			<div class="col-8 border border-light">
				<div class="row">
					<div class="card-header">
						<span class="ms-2 fw-bold">포인트 적립</span>
					</div>
				</div>
				<div class="row">
					<div class="card py-3 d-flex justify-content-center">
						<div class="row d-flex justify-content-center">
							<div class="col-9">
								<h4>포인트 기본 적립</h4>
								<ul>
									<li>영화 티켓 구매 시 유료 결제 금액의 <em class="font-gblue">3% ~ 10%</em> 적립</li>
									<ul>
										<li>브론즈 등급:	3%</li>
										<li>실버 등급:		5%</li>
										<li>골드 등급:		7%</li>
										<li>플래티넘 등급:	10%</li>
									</ul>
									<li>결제가 완료된 후 적립 예정 포인트로 적립되며 <em class="font-gblue">영화의 경우 상영일 익일</em> 사용 가능한 포인트(가용 포인트) 로 전환됩니다.</li>
									<li>회원이 로그인 후 온라인 서비스를 이용 하거나 현장 매표소, 키오스크에서 멤버십 카드 제시 또는 회원임을 확인 할 수 있는 정보를 제공하여야 포인트가 적립됩니다.</li>
									<li>무비팬 및 제휴사 할인, 포인트 결제 등을 통해 할인 받은 금액을 제외한 실제 고객님께서 현금, 신용카드 등으로 유료 결제한 금액 기준으로 적립됩니다.</li>
									<li>일부 영화, 상품, 극장, 결제 수단의 경우 적립이 되지 않거나 별도의 적립률이 적용될 수 있으며 상세 내용은 해당 상품, 극장 등에 별도 공지합니다.</li>
									<li>포인트 적립은 티켓에 노출된 영화 시작 시간 이전까지만 가능하며, 영화 상영 및 매점 상품 구매 이후 사후 적립은 불가능합니다.</li>
								</ul>
								<h4>등급 산정 기준</h4>
								<ul>
									<li>등급 산정은 티켓 구매 횟수를 기준으로 합니다.</li>
									<ul>
										<li>브론즈 등급: 기본 등급</li>
										<li>실버 등급: 티켓 구매 횟수가 6장 이상인 경우</li>
										<li>골드 등급: 티켓 구매 횟수가 11장 이상인 경우</li>
										<li>플래티넘 등급: 티켓 구매 횟수가 16장 이상인 경우</li>
									</ul>
								</ul>
								<h4>포인트 사용</h4>
								<ul>
									<li>
										적립된 포인트는 사용 가능한 보유포인트 내에서 <span class="text-danger">영화</span> 구매 시
										<span class="text-danger">상품 정가 전액을 기준</span>으로 포인트를 차감하여 사용 가능하며,
										<span class="text-danger">1P단위로</span> 포인트를 차감하여 사용 가능합니다.<br>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row d-none justify-content-center d-none" id="point-history">
			<div class="col-8 p-5 my-5">
				<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
				<div class="row text-center"><p class="fs-1">포인트 기록</p></div>
			</div>
		</div>
		
		<%-- 서브메뉴: MY정보관리 --%>
		<div class="row d-flex justify-content-center d-none" id="info-modify">
			<div class="col-8 p-5 my-3">
				<div class="row text-center">
					<p class="fs-1">회원정보 변경</p>
					<p class="fs-2">비밀번호 재확인</p>
					<p>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>	
				</div>
				<div class="row">
					<form class="col-6 offset-3 border p-4 mb-5 bg-light w-50" method="post" action="modifyform">
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
		<div class="row d-flex justify-content-center d-none" id="info-delete">
			<div class="col-8 p-5 my-3">
				<div class="row text-center">
					<p class="fs-1">회원 탈퇴</p>
					<p class="fs-2">비밀번호 재확인</p>
					<p>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>	
				</div>
				<div class="row">
					<form class="col-6 offset-3 border p-4 mb-5 bg-light w-50" method="post" action="check-withdrawal">
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

		// 현재 페이지 번호 확인용
		let pageNo = $('#form-search-movie input[type=hidden]').attr('value');
		
			$.ajax({
				type: 'GET',
				url: '/rest/member/movie-wish-list',
				data: {page:pageNo},
				contentType: 'application/json',
				success: function(response) {
					if (response.status === "FAIL") {
						alert(response.error);
						window.location.href = "/home";	
						return;
					} else {
						$('#div-wishlist').empty();
						let wishMovies = response.wishMovies;
						let filename = new Array();
						let pagination = response.pagination;
						
						$.each(wishMovies, function(index, wishMovie) {
							let filename = new Array();
							for (let movieImage of response.movieImages) {
								if (movieImage.movieNo === wishMovie.no) {
									filename.push(movieImage.filename);
								}
							}
							wishMovie.filename = filename;
						});
						
						// 찜한 영화가 없는 경우
						if (jQuery.isEmptyObject(wishMovies)) {
							$('#page-navigation').click(function(event) {
								event.preventDefault();
							})
							
							let row = 
								`<div class="row">
									<div class="row text-center"><i class="bi bi-exclamation-square" style="font-size: 5em;"></i></div>
									<div class="row text-center"><p class="fs-1">찜한 영화가 존재하지 않습니다.</p></div>
								</div>`;
							
							$('#div-wishlist').append(row);
							return;
						} else {
							// 찜한 영화 리스트 추가
							$.each(wishMovies, function(index, wishMovie) {
								let row = '<div class="card col-2 p-1 mx-3 mt-3 d-flex justify-content-center align-self-center">';
								row += '<div class="row">';
								row += '<img src="/resources/images/movie/' + wishMovie.filename[0] + '" class="w-100 my-auto" alt="...">';
								row += '</div>';
								row += '<div class="card-body d-flex justify-content-center p-0">';
								row += '<a type="button" class="btn btn-danger w-100"><span class="fs-6">상세정보</span></a>';
								row += '<a type="button" class="btn btn-outline-secondary"><span class="bi bi-heart-fill"></span></a>';
								row += '</div>';
								row += '</div>';
									
								$('#div-wishlist').append(row);
							});
						}
						
						// 페이지네이션 추가
						if (pagination.totalRecords > 8 && (pageNo%5 === 1 || pageNo%5 === 0)) {
							$('#li-num*').remove();
							let row = "";
							for (var i = pagination.beginPage; i <= pagination.endPage; i++) {
								row += `<li class="page-item" id="li-num">
										<a class="btn page-link link-dark" data-page="`+i+`">`+i+`</a>
										</li>`;
							}
							$('#li-prev').after(row);
							if (pageNo%5 === 1) {
								$('#li-num').first().children().addClass('fw-bold');
							}
							if (pageNo%5 === 0) {
								$('#li-num:eq(0)').last().children().addClass('fw-bold');
							}
							if (pagination.existPrev) {
								$('#li-prev a').removeClass('disabled');
							}
							if (pagination.existNext) {
								$('#li-next a').removeClass('disabled');
							}
						}
						
						// 페이지 클릭할 시 이벤트
						$('#li-num a').click(function(event) {
							event.preventDefault();
							$('#li-num a').removeClass('fw-bold');
							$(this).addClass('fw-bold');
							console.log('현재페이지: ' + $(this).attr('data-page'));
							$('#form-search-movie input[type=hidden]').attr('value', $(this).attr('data-page')); 
							$('#wish-movie-item').click();
						})
					}
				}
			});
			
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