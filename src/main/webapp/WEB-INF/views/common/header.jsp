<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	body { 
 			font-family: 'IBMPlexSansKR-Regular'; 
 		}
</style>
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
					<form class="border bg-light" method="post" action="login" id="form-normal-login">
						<div class="mb-3 mt-3">
							<label class="form-label">아이디</label>
							<input type="text" class="form-control" name="id">
						</div>
						<div class="mb-3">
							<label class="form-label">비밀번호</label>
							<input type="password" class="form-control" name="password">
						</div>
						<div class="mb-1">
							<button class="btn btn-danger w-100" id="button-normal-login">로그인</button>
						</div>
						<div class="d-flex justify-content-center">
							<a class="link-dark" href="/findid">아이디 찾기</a>
							<p>&nbsp;|&nbsp;</p> 
							<a class="link-dark" href="/findpassword">비밀번호 찾기</a>
							<p>&nbsp;|&nbsp;</p> 
							<a class="link-dark" href="/join">회원가입</a>
						</div>
						<div class="d-flex justify-content-center mb-3">
							<a id="btn-kakao-login" href="">
  								<img src="/resources/images/kakao_login.png" alt="카카오 로그인 버튼"/>
							</a>
						</div>
					</form>
				</div>
				<div class="row">
					<%--
			    		카카오 로그인 서비스가 제공하는 사용자 정보를 서버로 제출할 때 사용하는 폼과 폼 입력요소다.
			    		카카오 로그인 인증이 완료되면 사용자정보를 전달받아서 아래 폼 입력필드에 설정하고, 폼을 서버로 제출한다.
			    	 --%>
			    	<form id="form-kakao-login" method="post" action="kakao-login">
			    		<input type="hidden" name="id" />
			    		<input type="hidden" name="nickName" />
			    		<input type="hidden" name="email" />
			    		<input type="hidden" name="gender" />
			    	</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 상단 네비 -->
<header class="">
	<div class="py-4 border-bottom">
		<div class="container">
			<div class="d-flex">
				<a href="/home" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"> 
					<img src="/resources/images/logo/moviefan-logo.png" style="width: 300px;" alt="moviefan" >
				</a>
				<ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
					<c:choose>
						<c:when test="${empty LOGINED_CUSTOMER }">
							<!-- 로그인 전 네비 -->
							<li>
								<a href="" class="nav-link text-secondary" id="login">
									<i class="bi bi-lock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그인
								</a>
							</li>
							<li>
								<a href="/join" class="nav-link text-secondary">
									<i class="bi bi-person-plus d-flex justify-content-center" style="font-size: 2rem;"></i> 회원가입
								</a>
							</li>
							<li>
								<a href="/member/myaccount" class="nav-link text-secondary">
									<i class="bi bi-person d-flex justify-content-center" style="font-size: 2rem;"></i> MY MVF
								</a>
							</li>
						</c:when>
						<c:when test="${not empty LOGINED_CUSTOMER and LOGINED_CUSTOMER.isAdmin eq 'N' }">
							<!-- 로그인 후 네비 -->
							<li>
								<a href="/logout" class="nav-link text-secondary">
									<i class="bi bi-unlock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그아웃
								</a>
							</li>
							<li>
								<a href="/member/myaccount" class="nav-link text-secondary">
									<i class="bi bi-person d-flex justify-content-center" style="font-size: 2rem;"></i> MY MVF
								</a>
							</li>
						</c:when>
						<c:when test="${not empty LOGINED_CUSTOMER and LOGINED_CUSTOMER.isAdmin eq 'Y'  }">
							<!-- 관리자 로그인 후 네비 -->
							<li>
								<a href="/logout" class="nav-link text-secondary">
									<i class="bi bi-unlock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그아웃
								</a>
							</li>
							<li>
								<a href="/admin/home" class="nav-link text-secondary">
									<i class="bi bi-toggle-off d-flex justify-content-center" style="font-size: 2rem;"></i> 관리자 모드
								</a>
							</li>
						</c:when>
					</c:choose>
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
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="/ticket/booking">예매</a></li>
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
					<!-- 엔터 눌렀을 때 검색 방지 -->
					<input type="hidden">
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
		
		// 일반 로그인
		$('#button-normal-login').click(function(event) {
			event.preventDefault();
			
			let $id = $('#form-normal-login input[name=id]').val();
			let $password = $('#form-normal-login input[name=password]').val();
			
			if ($id.trim() === null || $id.trim() === "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if ($password.trim() === null || $password.trim() === "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$.post("/rest/home/logincheck", {id:$id, password:$password}, function(response) {
				if (response.status == "FAIL") {
					alert(response.error);
					return false;
				} else {
					window.location.href = "/home";
				}
			})
			
		});
		
		// 카카오 로그인
		$('#btn-kakao-login').click(function(event) {
			event.preventDefault();
			// 사용자키 전달, 카카오 로그인 서비스 초기화
			Kakao.init('01646474eb0f93b6d4faadcbe95c79ea');
			// 카카오 로그인 서비스 실행, 사용자 정보 가져오기
			Kakao.Auth.login({
				success: function(auth) {
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(response) {
							// 사용자 정보를 가져와서 폼에 추가
							let account = response.kakao_account;
							
							$('#form-kakao-login input[name=id]').val(response.id);
							$('#form-kakao-login input[name=nickName]').val(account.profile.nickname);
							$('#form-kakao-login input[name=email]').val(account.email);
							$('#form-kakao-login input[name=gender]').val(account.gender);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							document.querySelector('#form-kakao-login').submit()
						},
						fail: function(error) {
							alert('카카오 로그인 처리 중 오류가 발생하였습니다.');
						}
					});
				},
				fail: function(error) {
					alert('카카오 로그인 처리 중 오류가 발생하였습니다.')
				}
			});
		})
	});
	
});
</script>



