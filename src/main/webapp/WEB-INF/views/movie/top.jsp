<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	body, table, div, p{
	font-family: 'Sans-serif'; 
	}
	 a:link { 
	 color: black; text-decoration: none;
	 }
	 a:visited { 
	 color: black; text-decoration: none;
	 }
	 a:hover { 
	 color: black; text-decoration: underline;
	 }
</style>
<div class="row mb-3">
		<div class="col-10">
		<h1>영화 상세</h1>
		</div>
		<hr size="3px" color="black">
	</div>
	<div class="row mb-3">
		<div class="col-3 mb-3">
			<img src="/resources/images/movie/moviePoster/${movie.no }.jpg" width="260px" height="374px" class="rounded float-start" alt="...">
		</div>
		<div class="col-9 mb-3">
			<div class="row mb-3">
				<h3>${movie.title }</h3>
				<span style="font-size: 12pt;">${movie.titleEn }</span>
				<br><br>
				<span style="font-size: 11pt;">예매율 22.5%</span>
				<br>
				<hr color="black">
				<span style="font-size: 11pt;">감독: ${movie.producer }</span>
				<br>
				<span style="font-size: 11pt;">장르: </span>
				<br>
				<span style="font-size: 11pt;">개봉: <fmt:formatDate pattern="yyyy.MM.dd" value="${movie.openDate }" /></span>
			</div>
			<div class="row mb-3">
				<div class="col-2">
					<button type="button" class="btn btn-danger">예매하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		상단 네비바
	 -->
	<div class="row mb-3">
		<ul class="nav nav-tabs nav-justified">
		  <li class="nav-item">
		    <a class="nav-link ${movieNav eq '주요정보' ? 'active' : ''}" href="detail?no=${movie.no }">주요정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link ${movieNav eq '트레일러' ? 'active' : ''}" href="trailer?no=${movie.no }">트레일러/스틸컷</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link ${movieNav eq '평점' ? 'active' : ''}" href="customerrating?no=${movie.no }">평점/리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">상영시간표</a>
		  </li>
		</ul>	
	</div>