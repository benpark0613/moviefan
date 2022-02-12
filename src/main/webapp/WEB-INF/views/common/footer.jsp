<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	#btn-back-to-top {
	  position: fixed;
	  bottom: 40px;
	  right: 40px;
	  display: none;
	  opacity: 50%;
	}
</style>
<footer class="py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10">
				<h5>StieMap</h5>
				<ul class="nav">
					<li class="nav-item mb-2"><a href="/home" class="nav-link p-0 text-muted">Home&emsp;</a></li>
					<li class="nav-item mb-2"><a href="/movie/list" class="nav-link p-0 text-muted">Movie&emsp;</a></li>
					<li class="nav-item mb-2"><a href="/cinema/main" class="nav-link p-0 text-muted">Cinema&emsp;</a></li>
					<li class="nav-item mb-2"><a href="/ticket/movie" class="nav-link p-0 text-muted">Booking&emsp;</a></li>
					<li class="nav-item mb-2"><a href="/community/commentScore" class="nav-link p-0 text-muted">Talk&emsp;</a></li>
					<li class="nav-item mb-2"><a href="/member/myaccount" class="nav-link p-0 text-muted">MyAccount</a></li>
				</ul>
			</div>
		</div>
		<div class="d-flex justify-content-between py-4 my-4 border-top">
			<p>
				<a class="link-dark" href="https://github.com/sunggeunpark/moviefan">
					<i class="bi bi-github"></i>
					<span class="text-decoration-none">Contributors</span>
				</a>
				<span>: Park SungGeun, jinmookk, dayeaha, JUSP77</span>
			</p>
			<p>
				&copy; 2022 MovieFan, Inc. All rights reserved.
			</p>
		</div>
	</div>
	<button type="button" class="btn btn-secondary btn-floating btn-sm" id="btn-back-to-top">
		위로가기
		<i class="bi bi-arrow-up-circle text-white"></i>
	</button>
</footer>

<script type="text/javascript">
	// 위로가기 버튼
	let mybutton = document.getElementById("btn-back-to-top");
	
	window.onscroll = function () {
		scrollFunction();
	};
	
	function scrollFunction() {
		if	(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			mybutton.style.display = "block";
		} else {
			mybutton.style.display = "none";
		}
	}
	mybutton.addEventListener("click", backToTop);
	function backToTop() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>














