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
<div class="container bg-light mb-3 p-4" id="div-my-panel">
	<%-- 닉네임 변경 모달 --%>
	<div class="modal fade" tabindex="-1" aria-labelledby="nickNameModalLabel" id="modal-update-nickname" >
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<c:choose>
					<c:when test="${empty LOGINED_CUSTOMER.nickName}">
						<div class="modal-header">
							<h5 class="modal-title" id="nickNameModalLabel"><strong>${LOGINED_CUSTOMER.name }님</strong>&nbsp;<span class="fs-6 fw-lighter">${LOGINED_CUSTOMER.id }</span></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="modal-header">
							<h5 class="modal-title" id="nickNameModalLabel"><strong>${LOGINED_CUSTOMER.nickName }님</strong>&nbsp;<span class="fs-6 fw-lighter">${LOGINED_CUSTOMER.id }</span></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</c:otherwise>
				</c:choose>
<!-- 				<div class="modal-header"> -->
<%-- 					<h5 class="modal-title" id="nickNameModalLabel"><strong>${LOGINED_CUSTOMER.nickName }님</strong>&nbsp;<span class="fs-6 fw-lighter">${LOGINED_CUSTOMER.id }</span></h5> --%>
<!-- 					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 				</div> -->
				<div class="modal-body">
					<form method="post" id="form-update-nickname">
						<div class="row">
							<div class="col d-flex justify-content-center input-group input-group-sm">
								<label class="form-label input-group-text my-auto">닉네임</label>
								<input type="text" class="form-control" name="nickName" maxlength="30" data-is-checked="N" placeholder="한글, 영문, 숫자 혼용가능(한글 기준 10자 이내)" id="input-nickname"/>
								<button type="button" class="btn btn-outline-dark btn-sm" id="btn-check-nickname">중복확인</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="btn-update-nickname">등록하기</button>
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<%-- MY영화관 모달 --%>
	<div class="modal fade" tabindex="-1" data-bs-backdrop="static" aria-labelledby="cinemaModalLabel" id="modal-update-mycinema">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<form class="d-flex justify-content-start" method="post" id="form-select-mycinema">
							<div class="col-3">
								<select class="form-select form-select-sm" name="cityNo" id="select-city">
							  		<option selected="selected">지역선택</option>
								</select>
							</div>
							<div class="col-3">
								<select class="form-select form-select-sm" name="cinemaNo" id="select-cinema">
							  		<option selected="selected">극장선택</option>
								</select>
							</div>
							<div class="col">
								<button class="btn btn-outline-secondary btn-sm" type="button" id="btn-add-mycinema">자주가는 극장 추가</button>
							</div>
						</form>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<p class="m-0">
							<span class="fw-bolder">${LOGINED_CUSTOMER.nickName }님이 자주가는 극장</span>
						</p>
					</div>
					<div class="row">
						<table class="table table-borderless my-auto" id="modal-table-mycinema">
							<tbody class="mx-3">
								<tr>
									<c:choose>
										<c:when test="${empty myCinemaList}">
											<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>
											<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>
											<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>
										</c:when>
										<c:otherwise>
											<c:forEach var="cinema" items="${myCinemaList}">
												<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" value="${cinema.no }" data-cityno-of-cinema="${cinema.cityNo }" style="width: 120px; height: 60px;"><small>${cinema.name}</small><i class="bi bi-x-square"></i></button></td>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<h6 class="small">영화관을 선택하여 등록해주세요.<strong> 최대 3개까지</strong> 등록하실 수 있습니다.</h6>
				</div>
			</div>
		</div>
	</div>
	
	<%-- 나의 정보 패널 --%>
	<div class="d-flex justify-content-evenly my-2" id="div-myinfo-panel">
		<div class="col-5 my-auto">
			<c:choose>
				<c:when test="${empty LOGINED_CUSTOMER.nickName}">
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${LOGINED_CUSTOMER.name}</span>님&nbsp; 반갑습니다.&nbsp;
						<a href="" class="link-secondary" data-bs-toggle="modal" data-bs-target="#modal-update-nickname">
							<i class="bi bi-pen" style="font-size: 0.5em;" data-bs-toggle="tooltip" data-bs-placement="top" title="닉네임을 설정해주세요."></i>
						</a>
					</p>
				</c:when>
				<c:otherwise>
					<p class="fs-1">
						<span class="fs-1 fw-bolder">${LOGINED_CUSTOMER.nickName}</span>님&nbsp; 반갑습니다.&nbsp;
						<a href="" class="link-secondary" data-bs-toggle="modal" data-bs-target="#modal-update-nickname">
							<i class="bi bi-pen" style="font-size: 0.5em;" data-bs-toggle="tooltip" data-bs-placement="top" title="닉네임 변경"></i>
						</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="vr p-0 bg-light"></div>
		<div class="col-6"></div>
	</div>
	<div class="d-flex justify-content-evenly">
		<div class="col-5 my-auto">
			<div class="row">
				<table class="table table-borderless">
					<thead>
						<tr>
							<td class="fs-4"><a class="text-decoration-none text-decoration-underline link-dark" href="" id="link-mvfpoint-history">MVF POINT +</a></td>
						</tr>
					</thead>
					<tbody class="mx-3">
						<tr>
							<th class="col-6 fs-5 text-start">나의 현재 등급</th>
							<td class="col-3 fs-5 text-end">${LOGINED_CUSTOMER.gradeCode }</td>
						</tr>
						<tr>
							<th class="col-6 fs-5 text-start">사용가능 포인트</th>
							<td class="col-3 fs-5 text-end">${LOGINED_CUSTOMER.totalPoint } 점</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr class="w-100 mx-auto"/>
			<div class="row">
				<c:choose>
					<c:when test="${empty myCinemaList}">
						<table class="table table-borderless">
							<thead>
								<tr>
									<td class="fs-4">MY 영화관&nbsp;<a class="link-secondary" href="" data-bs-toggle="modal" data-bs-target="#modal-update-mycinema" id="link-update-mycinema"  data-bs-toggle="tooltip" data-bs-placement="top" title="자주 가는 영화관 설정"><i class="bi bi-gear" style="font-size: 0.5em;"></i></a></td>
								</tr>
							</thead>
							<tbody class="mx-3">
								<tr>
									<td class="text-center"><span class="fs-5 fw-bold">등록된 자주가는 극장이 없습니다.</span></td>
								</tr>
								<tr>
									<td class="text-center"><span class="fs-5">자주가는 영화관을 등록해보세요.</span></td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-borderless" id="table-mycinema">
							<thead>
								<tr>
									<td class="fs-4">MY 영화관&nbsp;<a class="link-secondary" href="" data-bs-toggle="modal" data-bs-target="#modal-update-mycinema" id="link-update-mycinema"  data-bs-toggle="tooltip" data-bs-placement="top" title="자주 가는 영화관 설정"><i class="bi bi-gear" style="font-size: 0.5em;"></i></a></td>
								</tr>
							</thead>
							<tbody class="mx-3" id="tbody-mycinema">
								<tr>
									<c:forEach var="cinema" items="${myCinemaList}" varStatus="loop">
										<td class="col-3 fs-5 text-center"><a href="/cinema/timetable?cinemaNo=${cinema.no }&showDate=${nowDate}"><button type="button" class="btn btn-outline-secondary" value="${cinema.no }" data-cityno-of-cinema="${cinema.cityNo }"  style="width: 120px; height: 60px;"><small>${cinema.name }</small></button></a></td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<div class="vr p-0"></div>
		<div class="col-6" id="div-wishmovie-panel">
			<div class="row">
				<div class="col">
					<c:choose>
						<c:when test="${empty movieWithImages }">
							<div class="d-flex justify-content-between mb-3 mx-3">
								<span class="h3">찜한 영화</span>
								<span class="align-self-end"><a href="/movie/list" class="btn text-decoration-none link-dark">찜 하러 가기</a></span>
							</div>
							<div class="row text-center mt-4">
								<p class="fs-1 fw-bold">찜한 영화가 없습니다.</p>
								<p class="fs-4">보고 싶은 영화를 "찜" 해 보세요.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-between mb-3 mx-3">
								<span class="h3">찜한 영화</span>
								<span class="align-self-end"><a href="" class="btn text-decoration-none link-dark" id="link-wishlist-show">더 보러 가기</a></span>
							</div>
							<div class="d-flex justify-content-evenly" id="div-card-section">
								<c:forEach var="entry" items="${movieWithImages }" varStatus="loop" end="2">
									<c:forEach var="movieImage" items="${entry.value }" end="0">
										<form action="delete-wishmovie">
											<input type="hidden" name="movieNo" value="${entry.key.no}">
										</form>
										<div class="card col-3 p-1 d-flex justify-content-center align-self-center" id="card-wishmovie">
											<div class="row">
										  		<img src="/resources/images/movie/${movieImage.filename }" class="w-100 my-auto" alt="...">
											</div>
											<div class="card-body d-flex justify-content-center p-0">
												<a href="/movie/detail?no=${entry.key.no}" type="button" class="btn btn-danger w-100"><span>상세정보</span></a>
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
		<li class="nav-item dropdown" aria-expanded="false">
			<a class="nav-link text-dark text-decoration-none btn" href="" id="link-notice"><span style="color: #6c757d;">공지/뉴스</span></a>
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
				</div>
				<%-- 페이지 내비게이션 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-4">
					<div class="col" id="div-paination">
					</div>
				</div>
				<%-- 검색 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-2">
					<form class="row d-flex justify-content-center gx-1" id="form-search-movie">
						<input type="hidden" name="current-page" value="1" />
						<div class="col-2">
							<select class="form-select" name="opt">
								<option value="title" selected="selected">제목</option>
								<option value="actor">배우</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="value" placeholder="영화 검색">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-dark w-100 h-100" id="btn-search-movie">검색</button>
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
		<%-- 한줄평 --%>
		<div class="row d-none d-flex justify-content-evenly" id="my-comment">
			<div class="col-8">
				<div class="row mt-3">
					<div class="col p-0">
						<span class="fw-bolder fs-5 text-start">내가 남긴 한줄평</span>
					</div>
				</div>
				<%-- 검색조건 --%>
				<div class="row mt-2">
					<div class="col p-0">
						<form class="row d-flex justify-content-start gx-1" id="form-search-comment">
							<input type="hidden" name="current-page" value="1">
							<div class="col-2">
								<select class="form-select" name="opt">
									<option selected="selected" disabled="disabled" value="">검색조건</option>
									<option value="movieTitle">영화</option>
									<option value="movieActor">배우</option>
									<option value="content">한줄평 내용</option>
								</select>
							</div>
							<div class="col-3">
								<input type="text" class="form-control" name="value">
							</div>
							<div class="col-1">
								<button type="button" class="btn btn-outline-dark w-100 h-100" id="btn-search-comment">검색</button>
							</div>
						</form>
					</div>
				</div>
				<%-- 한줄평리스트 --%>
				<div class="row p-3">
					<div class="col">
					
						<div class="row d-flex justify-content-center" id="div-commentlist">
							<div class="col-2">
								<div class="row">
									<div class="card p-2">
								  		<img class="img-fluid" src="/resources/images/movie/moviePoster/20205443.jpg">
									</div>
								</div>
							</div>
							<div class="col align-self-center">
								<div class="row ps-3">
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
							<button class="btn btn-danger w-100" id="btn-check-password" type="submit">비밀번호 확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%-- 공지사항 --%>
		<div class="row d-flex justify-content-evenly d-none" id="div-notice-template">
			<div class="col-8" id="col-notice-template">
				<%-- 공지카테고리 --%>
				<div class="row d-flex justify-content-start my-3 ">
					<p class="p-0 mb-1">무비팬의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
				</div>
				<%-- 공지 카테고리 --%>
				<div class="row d-flex justify-content-start" id="div-notice-categories">
					<ul class="nav nav-tabs">
						<li class="nav-item fw-bold">
							<a class="nav-link active link-dark" data-category="0" href="#">전체</a>
						</li>
						<li class="nav-item">
							<a class="nav-link link-dark" data-category=100 href="#">시스템점검</a>
						</li>
						<li class="nav-item">
							<a class="nav-link link-dark" data-category="200" href="#">극장</a>
						</li>
						<li class="nav-item">
							<a class="nav-link link-dark" data-category="300" href="#">기타</a>
						</li>
					</ul>
				</div>
				<%-- 공지글 --%>
				<div class="row d-flex justify-content-center" id="div-notice">
					<div>
						<table class="table">
							<thead>
								<tr>
									<th class="col-1 text-center">번호</th>
									<th class="col-1 text-center">구분</th>
									<th class="col-4 text-start">제목</th>
									<th class="col-1 text-center">등록일</th>
									<th class="col-1 text-center">조회수</th>
								</tr>
							</thead>
							<tbody id="tbody-noticelist">
								<tr>
									<td class="text-center">111</td>
									<td class="text-center">기타</td>
									<td class="text-start"><a class="link-dark" href="/admin/notice/detail?no=">제목제목제목</a></td>
									<td class="text-center">2020-02-02</td>
									<td class="text-center">10000</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<%-- 페이지 내비게이션 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-4">
					<div class="col" id="div-notice-pagination">
					</div>
				</div>
				<%-- 검색 표시 --%>
				<div class="row d-flex justify-content-center p-0 m-0 mt-2">
					<form class="row d-flex justify-content-center gx-1" id="form-search-notice">
						<input type="hidden" name="current-page" value="1" />
						<div class="col-2">
							<select class="form-select" name="opt">
								<option value="title" selected="selected">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="value">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-dark w-100 h-100" id="btn-search-notice">검색</button>
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
	// 내정보 패널 > 닉네임 변경 모달
	$('#div-myinfo-panel a').click(function(event) {
		event.preventDefault();

		let getNickName = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);	// 한글, 영대소문자, 숫자
		let $nickName = $('#input-nickname');
		
		$('#btn-check-nickname').click(function(event) {
			event.preventDefault();
			checkNickName();
		});
		
		$('#btn-update-nickname').click(function(event) {
			event.preventDefault();
			updateNickName();
		})
		
		function checkNickName() {
			if (!getNickName.test($nickName.val())) {
				alert('닉네임은 한글, 영문 대소문자, 숫자만 입력 가능합니다.');
				$nickName.val('');
				$nickName.focus();
				return false;
			};
			$.post('/rest/member/check-nickname', {nickName: $nickName.val()}, function(response) {
				if (response.status == "FAIL") {
					alert(response.error);
					$nickName.val('');
					$nickName.focus();
					return;
				} else {
					alert(response.item[0]);
					$nickName.attr("data-is-checked", "Y");
				}
			});
		}
		
		function updateNickName() {
			if ($nickName.attr("data-is-checked") === "N") {
				alert('닉네임 중복체크를 해주세요.');
				$nickName.focus();
				return;
			};
			$.post('/rest/member/check-nickname', {nickName: $nickName.val()}, function(response) {
				if (response.status == "FAIL") {
					alert(response.error);
					$nickName.val('');
					$nickName.focus();
					return;
				}
				$.post('/rest/member/update-nickname', {nickName: $nickName.val()}, function(response) {
					if (response.status == "OK") {
						alert("닉네임 변경이 완료되었습니다.");
						location.reload();
					}
				});
			});
			
		}
	});
	// 내 정보 패널 > 자주가는 극장
	if ($('#table-mycinema tbody tr [data-cityno-of-cinema]').length < 3) {
		let row = `<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>`
		for (var i = 0; i < 3 - $('#table-mycinema tbody tr [data-cityno-of-cinema]').length; i++) {
			$('#table-mycinema tbody tr').append(row);
		}
	}
	if ($('#modal-table-mycinema tbody tr').children().length < 3) {
		let row = `<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>`
		for (var i = 0; i < 3 - $('#modal-table-mycinema tbody tr').children().length; i++) {
			$('#modal-table-mycinema tbody tr').append(row);
		}
	}
	// 나의 정보 패널 > my영화관 모달
	$('#link-update-mycinema').click(function(event) {
		event.preventDefault();
		if ($('#modal-table-mycinema tbody tr').children().length < 3) {
			let row = `<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" data-isempty="1" style="width: 120px; height: 60px;"></button></td>`
			for (var i = 0; i < 3 - $('#modal-table-mycinema tbody tr').children().length; i++) {
				$('#modal-table-mycinema tbody tr').append(row);
			}
		}
		
		let $selectCityNo = $('#form-select-mycinema select[name=cityNo]');
		let $selectCinemaNo = $('#form-select-mycinema select[name=cinemaNo]');
		
		$selectCityNo.empty();
		let cityRow = `<option selected="selected">지역선택</option>`;
		$selectCityNo.append(cityRow);
		
		$selectCinemaNo.empty();
		let cinemaRow = `<option selected="selected">극장선택</option>`;
		$selectCinemaNo.append(cinemaRow);
		
		$.ajax({
			type: 'GET',
			url: '/rest/member/mycinema',
			dataType: 'json',
			success: function(response) {
				let cityWithCinemas = response.item;
				
				for(let cityWithCinema of cityWithCinemas) {
					cityRow = '<option value="'+cityWithCinema.no+'">'+cityWithCinema.name+'</option>';
					$selectCityNo.append(cityRow);
					for(let cinema of cityWithCinema.cinemas){
						cinemaRow = '<option class="d-none" value="'+cinema.no+'" data-cityno-of-cinema="'+cinema.cityNo+'">'+cinema.name+'</option>';
						$selectCinemaNo.append(cinemaRow);
					}
				}
			}
		});	
		// 모달 > 내 영화관 등록
		$selectCityNo.change(function(event) {
			event.preventDefault();
			let cityNo = $selectCityNo.children('option:selected').attr('value');
			let cinemaNo = $selectCinemaNo.children('option:selected').attr('value');
			let $cityNoOfCinema = $selectCinemaNo.children('option[data-cityno-of-cinema]').addClass('d-none');
			$selectCinemaNo.children('option[data-cityno-of-cinema='+cityNo+']').removeClass('d-none');
		});
		$('#btn-add-mycinema').click(function(event) {
			event.preventDefault();
			let cityNo = $selectCityNo.children('option:selected').attr('value');
			let cinemaNo = $selectCinemaNo.children('option:selected').attr('value');
			let cinemaName = $selectCinemaNo.children('option:selected').text();
 			let savedCinemaNo = new Array();
			$('#modal-table-mycinema button[data-cityno-of-cinema]').each(function() {
				return savedCinemaNo.push($(this).attr('value'));
			})
			if (!cityNo || !cinemaNo) {
				alert('지역과 극장을 선택해주세요.');
				$('#select-city option:eq(0)').prop("selected", true);
				$('#select-cinema option:eq(0)').prop("selected", true);
				return;
			}
			if ($('#modal-table-mycinema button[data-cityno-of-cinema]').length === 3) {
				alert('자주가는 극장은 최대 3곳까지 설정할 수 있습니다.');
				$('#select-city option:eq(0)').prop("selected", true);
				$('#select-cinema option:eq(0)').prop("selected", true);
				return;
			}
			for (let saved of savedCinemaNo) {
				if (cinemaNo === saved) {
					alert('이미 자주가는 극장으로 등록한 극장입니다.');
					$('#select-city option:eq(0)').prop("selected", true);
					$('#select-cinema option:eq(0)').prop("selected", true);
					return;
				}
			}
			if (confirm("자주 찾는 극장으로 추가하시겠습니까?")) {
				$.ajax({
    				type: 'POST',
    				url: '/rest/member/addmycinema',
    				data: {cinemaNo:cinemaNo},
    				success: function(response) {
    					alert("자주찾는 극장을 추가하였습니다.");
    					let replaceRow = '<td class="col-3 fs-5 text-center"><button type="button" class="btn btn-outline-secondary" value="'+cinemaNo+'" data-cityno-of-cinema="'+cityNo+'" style="width: 120px; height: 60px;"><small>'+cinemaName+'</small><i class="bi bi-x-square"></i></button></td>'
    					$('#modal-table-mycinemamodal-table button[data-isempty]').replaceWith(replaceRow);
   						location.reload();
					},
					fail: function(response) {
						alert(response.error);
					}
    			})
			}	
		})
		
		// 모달 > 내 영화관 삭제
		$('#modal-table-mycinema td').click(function(event) {
			event.preventDefault();
			if (!$(this).find('button').attr('value')) {
				return;
			}
			if (confirm("자주 찾는 극장에서 해제하시겠습니까?")) {
                let cinemaNo = $(this).find('button').attr('value');
    			console.log(cinemaNo);	
    			
    			$.ajax({
    				type: 'POST',
    				url: '/rest/member/deletemycinema',
    				data: {cinemaNo:cinemaNo},
    				success: function(response) {
   						alert("해제가 완료되었습니다.");
   						location.reload();
   						$('#link-update-mycinema').click
					},
					fail: function(response) {
						alert(response.error);
					}
    			})
			}
		});
		
	});
	// 나의 정보 패널 찜한 영화
	$('.bi-heart-fill').parent().click(function(event) {
		event.preventDefault();  
		if(confirm('찜한 영화에서 삭제하시겠습니까?')) {
			$(this).parents('#card-wishmovie').prev().trigger('submit');
		}
	})	
	// 나의 정보 패널에서 찜한 영화로 이동
	$('#link-wishlist-show').click(function(event) {
		event.preventDefault();
		$('#wish-movie-item').click();
		var offset = $('#div-wishlist').offset();
		$('html').animate({scrollTop : offset.top}, 400);
	});
	// 나의 정보 패널에서 포인트 내역으로 이동
	$('#link-mvfpoint-history').click(function(event) {
		event.preventDefault();
		$('#point-history-item').click();
		var offset = $('#point-history').offset();
		$('html').animate({scrollTop : offset.top}, 400);
	});
	
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
	
	// 	MY무비로그
	$('#wish-movie-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#wish-movie-item').addClass('fw-bolder')
		$('#my-movie-tab').addClass('fw-bolder')
		$('#wish-movie').removeClass("d-none")
		
		getMovieWishList();
		
		$("#btn-search-movie").click(function(event) {
			event.preventDefault();
			$('#form-search-movie input[name=current-page]').val("1");
			getMovieWishList();
		});
	
		// 찜한 영화 리스트
		function getMovieWishList() {
			let $divWishList = $('#div-wishlist').empty();
			let pagination;
			let currentPage = $('#form-search-movie input[name=current-page]').val();
			let searchOption = $("#form-search-movie select[name=opt]").val();
			let searchValue = $.trim($("#form-search-movie :input[name=value]").val());
			
			$.ajax({
				type: 'GET',
				url: '/rest/member/movie-wish-list',
				data: {
					page: currentPage,
					opt: searchOption,
					value: searchValue
				},
				beforeSend: function() {
					let row =
						`<div class="spinner-border text-danger my-5" role="status">
					 	<span class="visually-hidden">Loading...</span>
						</div>`
					$divWishList.append(row);
				},
				success: function(response) {
					$divWishList.empty();
	
					let wishMovies = response.wishMovies;
					let movieImages = response.movieImages;
					pagination = response.pagination;
					
					// 찜한 영화가 없는 경우
					if (wishMovies.length == 0) {
						let row = 
							`<div class="row mt-3">
							<span class="text-center fs-2"><i class="bi bi-exclamation-square"></i>찜한 영화가 존재하지 않습니다.</span>
							<div class="row d-flex justify-content-center mx-auto mt-3"><a type="button" href="/movie/list" class="btn btn-outline-danger w-25">찜 하러 가기</a></div>
							</div>`;
						$divWishList.append(row);
						
// 						<div class="d-flex justify-content-between mb-3 mx-3">
// 						<span class="h3">찜한 영화</span>
// 						<span class="align-self-end"><a href="/movie/list" class="btn text-decoration-none link-dark">찜 하러 가기</a></span>
// 					</div>
// 					<div class="row text-center mt-4">
// 						<p class="fs-1 fw-bold">찜한 영화가 없습니다.</p>
// 						<p class="fs-4">보고 싶은 영화를 "찜" 해 보세요.</p>
// 					</div>
					} else {
						// 찜한 영화가 있는 경우
						// 찜한 영화에 영화 이미지를 추가한다.
						$.each(wishMovies, function(index, wishMovie) {
							let filenames = new Array();
							for(let movieImage of movieImages) {
								if (movieImage.movieNo === wishMovie.no) {
									filenames.push(movieImage.filename);
								}
							}
							wishMovie.filenames = filenames;
						});
						$.each(wishMovies, function(index, wishMovie) {
							let row = '<div class="card col-2 p-1 mx-3 mt-3 d-flex justify-content-center align-self-center">';
								row += '<div class="row">';
								row += '<img src="/resources/images/movie/' + wishMovie.filenames[0] + '" class="w-100 my-auto" alt="...">';
								row += '</div>';
								row += '<div class="card-body d-flex justify-content-center p-0">';
								row += '<a href="/movie/detail?no='+ wishMovie.no+'" type="button" class="btn btn-danger w-100"><span class="fs-6">상세정보</span></a>';
								row += '<a type="button" class="btn btn-outline-secondary" data-wishMovieNo="'+wishMovie.no+'"><span class="bi bi-heart-fill"></span></a>';
								row += '</div>';
								row += '</div>';
								
							$divWishList.append(row);
						});
						getPaginationNav(currentPage, pagination);
						
						$('.bi-heart-fill').parent().click(function(event) {
							let movieNo = $(this).attr('data-wishMovieNo');
							event.preventDefault();  
							if(confirm('찜한 영화에서 삭제하시겠습니까?')) {
								deleteWishMovie(movieNo)
							}
						})	
					}
					
				},
				error: function() {
					alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
				}
			});
		}
		
		// 페이지네이션
		function getPaginationNav(currentPage, pagination) {
			let $pagination = $("#div-paination").empty();
			
			if (pagination.totalRecords > 0) {
				let row = `<nav id="page-navigation">`;
				row += `<ul class="pagination pagination-sm justify-content-center m-0">`;
				if (pagination.existPrev) {
					row += `<li class="page-item" id="li-prev">`;
				} else {
					row += `<li class="page-item disabled" id="li-prev">`;
				}
					row += `<a class="page-link link-dark" data-page="` + pagination.prevPage + `"><span aria-hidden="true">&laquo;</span></a>`;
	    			row += `</li>`;
	    			
	    		for (var i = pagination.beginPage; i <= pagination.endPage; i++) {
					if (i == currentPage) {
						row += `<li class="page-item fw-bold" id="li-num">`;
					} else {
						row += `<li class="page-item" id="li-num">`;
					}
					row += `<a class="page-link link-dark" data-page="` + i + `">` + i + `</a>`;
					row += `</li>`;
				}
				if (pagination.existNext) {
					row += `<li class="page-item"  id="li-next">`;
				} else {
					row += `<li class="page-item disabled"  id="li-next">`;
				}
					row += `<a class="page-link link-dark" data-page="` + pagination.nextPage + `"><span aria-hidden="true">&raquo;</span></a>`;
					row += `</li>`;
				
					row += `</ul>`
					row += `</nav>`
				
					$pagination.append(row);
					
				$('#page-navigation a').click(function(event) {
					event.preventDefault();
					let pageNo = $(this).attr('data-page');
					$('#form-search-movie input[name=current-page]').val(pageNo);
					getMovieWishList();
				})
			}
		}
	
		// 찜한 영화 삭제
		function deleteWishMovie(movieNo) {
			$.get('/rest/member/delete-wishmovie', {movieNo: movieNo}, function(response) {
				if (response.status == 'OK') {
					$('#div-card-section').load(location.href+' #div-card-section>*');
					getMovieWishList();
				} else {
					alert(response.error);
				}
			})
		}
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
		$('#div-commentlist').empty();
		
		getMyComments(event);
		
		$('#form-search-comment button').click(function(event) {
			event.preventDefault();
			
			let $opt = $("#form-search-comment :selected");
			let $value = $("#form-search-comment :input[name=value]");
					
			if (!$opt.val()) {
				alert('검색조건을 선택해주세요.');
				return;
			}
			if (!$value.val()) {
				alert('검색어를 입력해주세요.');
				return;
			}
			$('#div-commentlist').empty();
			getMyComments();
		})
		
		function getMyComments() {
			event.preventDefault();
			let currentPage = $('#form-search-comment input[name=current-page]').val();
			let searchOption = $("#form-search-comment select[name=opt]").val();
			let searchValue = $.trim($("#form-search-comment :input[name=value]").val());
			let $divCommentList = $('#div-commentlist');
			
			$.ajax({
				type: "GET",
				url: "/rest/member/mycomments",
				data: {
					page: currentPage,
					opt: searchOption,
					value: searchValue,
				},
				beforeSend: function() {
					let row =
						`<div class="spinner-border text-danger my-5" role="status" id="div-spinner-comment">
					 	<span class="visually-hidden">Loading...</span>
						</div>`
					$divCommentList.append(row);
				},
				success: function(response) {
					if (response.status == "FAIL") {
						alert(response.error);
						
						let row = `<div class="col-8 mt-5">
									<a class="link-dark" href="/movie/list"><p class="fs-3">감상한 영화의 한줄평을 남겨주세요.</p></a>
									</div>`
									
						$divCommentList.append(row);
					}
					
					$('#div-spinner-comment').remove();
					let pagination = response.pagination;
					let dtos = response.dtos;
					
					if (pagination.totalRecords > 0) {
						$.each(dtos, function(i, dto) {
							let row = `<div class="row mb-3">
										<div class="col-2">
										<div class="row">
										<div class="card p-2">
										<img class="img-fluid" src="/resources/images/movie/`+dto.images[0].filename+`">
										</div>
										</div>
										</div>
										<div class="col align-self-center">
									 	<div class="row ps-3">
										<table class="table table-borderless" data-commentNo="`+dto.commentNo+`">
										<thead>
										<tr>
										<th>작성자</th>
										<td>`
							if (!dto.nickName) {
								row += dto.name
							} else {
								row += dto.nickName				
							}
								row += `</td>
										<th>평점</th>
										<td>`+dto.customerRating+`/5.0</td>
										</tr>
										</thead>
										<tbody>
										<tr>
										<td colspan="5">`+dto.content+
											`<a href="update" class="link-dark ms-1"><i class="bi bi-pencil"></i></a>
											<a href="delete" class="link-dark ms-1"><i class="bi bi-x-square"></i></a>
										</td>
										</tr>
										</tbody>
										</table>
										</div>
										</div>
										</div>`
							if (dtos.length == i + 1) {
								let pageForScroll = pagination.end/5 + 1;
								if (pagination.totalPages == 1 || pageForScroll == pagination.totalPages) {
									row += `<input type="hidden" name="end-page" id="comment-end">` 
								} else {
									$('#comment-end').val(pageForScroll);
									row += `<input type="hidden" name="end-page" value="`+pageForScroll+`" id="comment-end">`
								}
							}
							$divCommentList.append(row);
						})
						
					}
				
					getMorePagesByScrolling(pagination);
					
				},
				error: function(response) {
					alert(error);
				}
			})
		}

		function getMorePagesByScrolling(pagination) {
			$(window).scroll(function() {
				event.preventDefault();
				if ($(window).scrollTop() == $(document).height() - $(window).height() && $('#comment-end').length) {
			    	let currentPage = $('#comment-end').val();
			    	$('#form-search-comment input[name=current-page]').val(currentPage);
			    	
			    	if (!$('#comment-end').val()) {
						return;
					}
			    	
			    	$('#comment-end').remove();
			    	getMyComments();
			    }
			});
		}
		
		
		
// 		function updateMyComment() {
			
// 		}
		
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
		
		$('[action=modifyform] button').click(function(event) {
			event.preventDefault();
			
			let id = $('[action=modifyform] [name=id]').val();
			let password = $('[action=modifyform] [name=password]').val();
			
			$.post('/rest/member/checkpassword', {id: id, password: password}, function(response) {
				if (response.status == "OK") {
					alert('인증이 완료되었습니다.');
					$('[action=modifyform]').trigger("submit");
				} else {
					alert(response.error);
				}
			})
		})
	});
	$('#info-delete-item').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$('#info-delete-item').addClass('fw-bolder')
		$('#my-info-tab').addClass('fw-bolder')
		$('#info-delete').removeClass("d-none")
		
		$('[action=check-withdrawal] button').click(function(event) {
			event.preventDefault();
			
			let id = $('[action=check-withdrawal] [name=id]').val();
			let password = $('[action=check-withdrawal] [name=password]').val();
			
			$.post('/rest/member/checkpassword', {id: id, password: password}, function(response) {
				if (response.status == "OK") {
					alert('인증이 완료되었습니다.');
					$('[action=check-withdrawal]').trigger("submit");
				} else {
					alert(response.error);
				}
			})
		})
	});
	
	// 공지사항
	$('#link-notice').click(function(event) {
		event.preventDefault();
		$("#sub-menu-list-container > div").addClass("d-none")
		$('#sub-menu-tab a').removeClass('fw-bolder')
		$("#link-notice").addClass("fw-bolder")
		$('#div-notice-template').removeClass("d-none")
		let selectCategoryNo = $('#div-notice-categories .active').attr('data-category');
		
		getNoticeList(selectCategoryNo);
		
		// 검색버튼
		$("#btn-search-notice").click(function(event) {
			event.preventDefault();
			$('#div-notice-categories a').removeClass('active');
			$('#div-notice-categories a').parent().removeClass('fw-bold');
			$('#div-notice-categories a:eq(0)').addClass('active');
			$('#div-notice-categories a:eq(0)').parent().addClass('fw-bold');
			$('#form-search-notice input[name=current-page]').val("1");
			getNoticeList(selectCategoryNo);
		});
		
		// 카테고리 탭
		$('#div-notice-categories a').click(function(event) {
			event.preventDefault();
			$('#div-notice-categories a').removeClass('active');
			$('#div-notice-categories a').parent().removeClass('fw-bold');
			$(this).addClass('active');
			$(this).parent().addClass('fw-bold');
			let selectCategoryNo = $(this).attr('data-category');
			getNoticeList(selectCategoryNo);
		})
		
		function getNoticeList(selectCategoryNo) {
			let $tbodyNoticeList = $('#tbody-noticelist').empty();
			let pagination;
			let currentPage = $('#form-search-notice input[name=current-page]').val();
			let searchOption = $("#form-search-notice select[name=opt]").val();
			let searchValue = $.trim($("#form-search-notice :input[name=value]").val());
			
			$.ajax({
				type: 'GET',
				url: '/rest/member/notice-list',
				data: {
					page: currentPage,
					opt: searchOption,
					value: searchValue,
					categoryNo: selectCategoryNo
				},
				success: function(response) {
					$tbodyNoticeList.empty();

					let noticeListDto = response.noticeDtos;
					pagination = response.pagination;
					
					// 공지 사항 없는 경우
					if (noticeListDto.length == 0) {
						let row = 
							`<tr>
							<td class="text-center border-0" colspan="7"><i class="bi bi-exclamation-square fs-1"></i></td>
							</tr>;
							<tr>
							<td class="text-center border-0" colspan="7"><p class="fs-1">공지사항이 존재하지 않습니다.</p></td>
							</tr>`;
						$tbodyNoticeList.append(row);
					} else {
						$.each(noticeListDto, function(index, noticeDto) {
							let	row = '<tr>';
								row +=	'<td class="text-center">'+noticeDto.no+'</td>';
								row +=	'<td class="text-center">'+noticeDto.categoryName+'</td>';
								row +=	'<td class="text-start"><a class="link-dark" data-noticeNo="'+noticeDto.no+'" href="">'+noticeDto.title+'</a></td>';
								row +=	'<td class="text-center">'+noticeDto.createdDate+'</td>';
								row +=	'<td class="text-center">'+noticeDto.viewCount+'</td>';
								row +=	'</tr>'
								
							$tbodyNoticeList.append(row);
						});
						getPaginationNav(currentPage, pagination, selectCategoryNo);
						
						$('#tbody-noticelist a').click(function(event) {
							event.preventDefault();
							let noticeNo = $(this).attr('data-noticeNo');
							getNoticeDetail(noticeNo);
						});
					}
				},
				error: function() {
					alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
				}
			});
		}
		
		function getNoticeDetail(noticeNo) {
			event.preventDefault();
			let currentPage = $('#form-search-notice input[name=current-page]').val();
			let searchOption = $("#form-search-notice select[name=opt]").val();
			let searchValue = $.trim($("#form-search-notice :input[name=value]").val());
			let $divNoticeTemplate = $('#div-notice-template');
			let $colNoticeTemplate = $('#col-notice-template');
			 
			$.ajax({
				type: 'GET',
				url: '/rest/member/detail',
				data: {
					no: noticeNo,
					opt: searchOption,
					value: searchValue,
				},
				success: function(response) {
					
					let noticeDto = response.noticeDtos[0];
					pagination = response.pagination;
					
					let row = '<div class="col-8" id="div-notice-detail">';
					row += '<div class="row bg-light border-top">';
					row += '<div class="col d-flex justify-content-start">'
					row += '<p class="fw-bold me-1 my-2">'
					row += '['+noticeDto.categoryName+']'
					row += '</p>'
					row += '<p class="fw-bold me-auto my-2">'
					row += noticeDto.title
					row += '</p>'
					row += '<p class="fw-bold text-end me-2 my-2">'
					row += '등록일' + noticeDto.createdDate
					row += '</p>'
					row += '<p class="fw-bold text-end my-2">'
					row += '조회수' + noticeDto.viewCount 
					row += '</p>'
					row += '</div>'
					row += '</div>'
					row += '<div class="row border-bottom">'
					row += '<div class="col p-5">'
					if (noticeDto.image) {
						row += '<div class="row mb-2">'
						row += '<img class="img-thumbnail w-25" src="/resources/images/admin/'+noticeDto.image+'">'
						row += '</div>'
					}
					row += '<div class="row">'
					row += '<p>'+noticeDto.content+'</p>'
					row += '</div>'
					row += '</div>'
					row += '</div>'
					row += '<div class="row my-2">'
					row += '<div class="col d-flex justify-content-end">'
					row += '<a href="/admin/notice/list?page='+currentPage+'" class="btn btn-dark" type="button" id="a-back-list">목록으로</a>'
					row += '</div>'
					row += '</div>'
					row += '</div>'
							
					$divNoticeTemplate.append(row);
					$colNoticeTemplate.addClass('d-none');
					
					$('#a-back-list').click(function(event) {
						event.preventDefault();
						$colNoticeTemplate.removeClass('d-none');
						$('#div-notice-detail').remove();
						getNoticeList(noticeDto.categoryNo);
					})
				},
				error: function(response) {
					alert('오류가 발생했습니다. 잠시 후 다시 시작해주세요.');
				}
			});	
		}
		
		function getPaginationNav(currentPage, pagination, selectCategoryNo) {
			let $pagination = $("#div-notice-pagination").empty()
			
			if (pagination.totalRecords > 0) {
				let row = `<nav id="notice-page-navigation">`;
				row += `<ul class="pagination pagination-sm justify-content-center m-0">`;
				if (pagination.existPrev) {
					row += `<li class="page-item" id="notice-li-prev">`;
				} else {
					row += `<li class="page-item disabled" id="notice-li-prev">`;
				}
					row += `<a class="page-link link-dark" data-page="` + pagination.prevPage + `"><span aria-hidden="true">&laquo;</span></a>`;
	    			row += `</li>`;
	    			
	    		for (var i = pagination.beginPage; i <= pagination.endPage; i++) {
					if (i == currentPage) {
						row += `<li class="page-item fw-bold" id="notice-li-num">`;
					} else {
						row += `<li class="page-item" id="notice-li-num">`;
					}
					row += `<a class="page-link link-dark" data-page="` + i + `">` + i + `</a>`;
					row += `</li>`;
				}
				if (pagination.existNext) {
					row += `<li class="page-item"  id="notice-li-next">`;
				} else {
					row += `<li class="page-item disabled"  id="notice-li-next">`;
				}
					row += `<a class="page-link link-dark" data-page="` + pagination.nextPage + `"><span aria-hidden="true">&raquo;</span></a>`;
					row += `</li>`;
				
					row += `</ul>`
					row += `</nav>`
				
					$pagination.append(row);
					
				$('#notice-page-navigation a').click(function(event) {
					event.preventDefault();
					let pageNo = $(this).attr('data-page');
					$('#form-search-notice input[name=current-page]').val(pageNo);
					getNoticeList(selectCategoryNo);
				})
			}
		}
	});
			
});

</script>
</body>
</html>





























