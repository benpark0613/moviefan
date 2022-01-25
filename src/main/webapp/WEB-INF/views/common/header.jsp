<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- 로그인 모달 -->
<div class="modal fade" id="modal-login" data-bs-backdrop="static" tabindex="-1" aria-labelledby="로그인 모달" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
   			<div class="modal-header">
     			<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
     			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
   			</div>
      		<div class="modal-body">
				<div class="row">
					<form class="border bg-light" method="post" action="login">
						<div class="mb-3 mt-3">
							<label class="form-label">아이디</label>
							<input type="text" class="form-control" name="id">
						</div>
						<div class="mb-3">
							<label class="form-label">비밀번호</label>
							<input type="password" class="form-control" name="password">
						</div>
						<div class="mb-1">
							<button class="btn btn-danger w-100" id="form-normal-login">로그인</button>
						</div>
						<div class="d-flex justify-content-center">
							<a>아이디 찾기</a>
							<p>&nbsp;|&nbsp;</p> 
							<a>비밀번호 찾기</a>
							<p>&nbsp;|&nbsp;</p> 
							<a>회원가입</a>
						</div>
						<div class="d-flex justify-content-center mb-3">
							<a id="btn-kakao-login" href="">
  								<img src="/resources/images/kakao_login.png" alt="카카오 로그인 버튼"/>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	
<!-- 상단 네비 -->
<header>
	<div class="py-4 border-bottom">
		<div class="container">
			<div class="d-flex">
				<a href="/home" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"> 
					<img src="/resources/images/logo/moviefan-logo.png" style="width: 300px;" alt="moviefan" >
				</a>
				<ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
					<c:if test="${empty LOGIN_CUSTOMER }">
						<li>
							<a href="" class="nav-link text-secondary" id="login">
								<i class="bi bi-lock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그인
							</a>
						</li>
						<li>
							<a href="/member/join" class="nav-link text-secondary">
								<i class="bi bi-person-plus d-flex justify-content-center" style="font-size: 2rem;"></i> 회원가입
							</a>
						</li>
						<li>
							<a href="/myaccount/myticket/bookinglist" class="nav-link text-secondary">
								<i class="bi bi-person d-flex justify-content-center" style="font-size: 2rem;"></i> MY MVF
							</a>
						</li>
					</c:if>
					<c:if test="${not empty LOGIN_CUSTOMER }">
						<li>
							<a href="/logout" class="nav-link text-secondary">
								<i class="bi bi-unlock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그아웃
							</a>
						</li>
						<li>
							<a href="/myaccount/myticket/bookinglist" class="nav-link text-secondary">
								<i class="bi bi-person d-flex justify-content-center" style="font-size: 2rem;"></i> MY MVF
							</a>
						</li>
					</c:if>
					<li>
						<a href="/admin/home" class="nav-link text-secondary">
							<i class="bi bi-toggle-off d-flex justify-content-center" style="font-size: 2rem;"></i> 관리자 모드
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand navbar-light bg-white border-bottom">
		<div class="container">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">		
					<li class="nav-item me-4"><a class="nav-link text-secondary active" aria-current="page" href="/movie/list">영화</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="/cinema/main">극장</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="/ticket/movie">예매</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">스토어</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">이벤트</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">혜택</a></li>
					<li class="nav-item dropdown me-4">
					<a class="nav-link dropdown-toggle text-secondary" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">영화수다</a>
						<ul class="dropdown-menu">
     						<li><a class="dropdown-item" href="/community/commentScore">한줄평점</a></li>
							<li><a class="dropdown-item" href="/community/reviewBoard">영화리뷰</a></li>
						</ul>
					</li>
				</ul>	
				<form class="me-2">
					<input class="form-control" type="text" placeholder="Search" aria-label="Search">
				</form>
				<i class="bi bi-search" style="font-size: 1.5rem; color: grey;"></i>
			</div>
		</div>
	</nav>
</header>
<script type="text/javascript">
// 로그인 모달 스크립트
$(function() {
	var loginModal = new bootstrap.Modal(document.getElementById('modal-login'));
	
	$('#login').click(function(event) {
		event.preventDefault();
		loginModal.show();
		
		$('#form-normal-login').click(function(event) {
			$('form[action=post]').submit();
		});
	});
});


</script>





















