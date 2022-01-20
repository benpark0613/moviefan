<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<div class="px-3 py-4 border-bottom">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/home" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"> 
					<img src="/resources/images/logo/moviefan-logo.png" style="width: 300px;" alt="moviefan" >
				</a>

				<ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
					<li>
						<a href="#" class="nav-link text-secondary">
							<i class="bi bi-person d-flex justify-content-center" style="font-size: 2rem;"></i> 로그인
						</a>
					</li>
					<li>
						<a href="#" class="nav-link text-secondary">
							<i class="bi bi-person-plus d-flex justify-content-center" style="font-size: 2rem;"></i> 회원가입
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
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">극장</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">예매</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">스토어</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">이벤트</a></li>
					<li class="nav-item me-4"><a class="nav-link text-secondary" href="#">혜택</a></li>
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
	$(".navbar-nav").mouseenter(function() {
		console.log("마우스 들어옴");
	})
	$(".navbar-nav").mouseleave(function() {
		console.log("마우스 나감");
	})
</script>