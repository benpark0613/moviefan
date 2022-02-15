<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	 p, span{
	 font-family: 'Noto Sans KR', sans-serif; 
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
			<img src="/resources/images/movie/moviePoster/${movieDetail.no }.jpg" width="260px" height="374px" class="rounded float-start" alt="...">
		</div>
		<div class="col-9 mb-3">
			<div class="row mb-3">
				<h3>${movieDetail.title }</h3>
				<span style="font-size: 12pt;">${movieDetail.titleEn }</span>
				<br><br>
				<hr color="black">
				<span style="font-size: 11pt;">감독:
					<c:forEach var="directors" items="${movieDetail.directors }">
						<span>${directors.directorName }</span>
					</c:forEach>
				</span>
				<br>
				<span style="font-size: 11pt;">장르: 
					<c:forEach var="genres" items="${movieDetail.genres }" varStatus="status" >
						<c:choose>
							<c:when test="${status.last }">
								<span> ${genres.genreName }</span>
							</c:when>
							<c:otherwise>
								<span> ${genres.genreName },</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</span>
				<br>
				<span style="font-size: 11pt;">배우: 
					<c:forEach var="actors" items="${movieDetail.actors }" varStatus="status" >
						<c:choose>
							<c:when test="${status.last }">
								<span> ${actors.actorName }</span>
							</c:when>
							<c:otherwise>
								<span> ${actors.actorName },</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</span>
				<br>
				<span style="font-size: 11pt;">개봉: <fmt:formatDate pattern="yyyy.MM.dd" value="${movieDetail.openDate }" /></span>
				<br>
				<span style="font-size: 11pt;">제작사: ${movieDetail.producer }</span>
			</div>
			<div class="row mb-3">
				<div class="col-2">
					<a href="/ticket/booking"><button type="button" class="btn btn-danger">예매하기</button></a>
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
		    <a class="nav-link ${movieNav eq '주요정보' ? 'active' : ''}" href="detail?no=${movieDetail.no }">주요정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link ${movieNav eq '트레일러' ? 'active' : ''}" href="trailer?no=${movieDetail.no }">트레일러/스틸컷</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link ${movieNav eq '평점' ? 'active' : ''}" href="comment?no=${movieDetail.no }">평점/리뷰</a>
		  </li>
		</ul>	
	</div>