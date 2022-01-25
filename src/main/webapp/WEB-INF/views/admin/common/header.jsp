<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<div class="py-4 border-bottom">
		<div class="container">
			<div class="d-flex">
				<a href="/admin/home" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"> 
					<img src="/resources/images/logo/moviefan-admin-logo.png" style="width: 300px;" alt="moviefan" >
				</a>
				<ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
					<li>
						<a href="#" class="nav-link text-white">
							<i class="bi bi-lock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그인
						</a>
					</li>
					<li>
						<a href="#" class="nav-link text-white">
							<i class="bi bi-unlock d-flex justify-content-center" style="font-size: 2rem;"></i> 로그아웃
						</a>
					</li>
					<li>
						<a href="/home" class="nav-link text-white">
							<i class="bi bi-toggle-on d-flex justify-content-center" style="font-size: 2rem;"></i> 관리자 모드
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
					<li class="nav-item me-4"><a class="nav-link text-secondary active" aria-current="page" href="">영화DB</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="">상영일정</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">회원정보</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">매출통계</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">게시판관리</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="/admin/search">영화등록</a></li>
				</ul>	
			</div>
		</div>
	</nav>
</header>
<script type="text/javascript">
	$(".navbar-nav").mouseenter(function() {
		console.log("마우스 들어옴");
	})
	$(".navbar-nav").mouseleave(function() {
		console.log("마우스 나감");
	})
</script>