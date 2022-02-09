<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MovieFan : 한줄평점</title>
<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
	 p, span{
	 font-family: 'Noto Sans KR', sans-serif; 
	 }
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="row mb-3">
			<div class="col-8">
				<h4>네티즌·관람객 평점</h4>
			</div>
			<div class="col-4">
				<form id="form-search-comment" action="commentScore" method="get">
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="sort" value="" />
					<div class="row text-end">
						<div class="col">
							<select class="form-select-sm" name="opt">
								<option selected disabled="disabled">검색구분</option>
								<option value="영화명" ${'영화명' eq param.opt ? 'selected' : ''}>영화명</option>
								<option value="작성자" ${'작성자' eq param.opt ? 'selected' : ''}>작성자</option>
							</select>
							<input type="text" name="value" value="${param.value }"/>
							<button type="button" class="btn btn-secondary" id="btn-search-comment">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<span style="font-size:1.6em; color:#503396;">총 ${size }개의 이야기가 있어요</span>
			</div>
			<div class="col mb-3 text-end">
				<a href="/community/commentForm" type="button" class="btn btn-primary">평점등록</a>
			</div>
		</div>
		<div class="row">
			<div class="col sort text-end">
				<a id="recent"><span>최신순</span></a>
				<a id="recommend"><span>추천순</span></a>
			</div>
		</div>
		
		
		<c:forEach var="comment" items="${comment }" varStatus="status">
			<div class="row mb-3">
				<div class="row mb-3">
					<div class="col-2">
						<img alt="" width="150" height="250" src="/resources/images/movie/moviePoster/${comment.movieNo }.jpg">
					</div>
					<div class="col-10 align-self-center">
						<div class="row">
							<span style="font-size: 15pt; "><strong>${comment.movieTitle }</strong></span>
						</div>		
						<div class="row rounded bg-light">
							<div class="col-1 align-self-center">
							 	<span class="" style="font-size:1.2em; color:#503396;">관람평</span>
							</div>
							<div class="col-1 align-self-center">
								<span style="font-size:1.5em; color:#503396;">${comment.rating }</span>
							</div>
							<div class="col-9 align-self-center">
								<span>${comment.content }</span>
							</div>
							<div class="col-1 align-self-center">
								<a href="" class="like"><i class="far fa-thumbs-up fa-lg"></i></a>
								<input type="hidden" value="${comment.commentNo }">
								<br>
								<span id="like${status.index }" style="font-size: 13pt;"><strong>${comment.likeCount }</strong></span>
								<span><fmt:formatDate value="${comment.creDate }" pattern="YYYY.MM.DD"/></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="row mb-3">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
						<a class="page-link" href="commentScore?page=${pagination.prevPage }" data-page="${pagination.prevPage }">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="commentScore?page=${num }" data-page="${num }">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
						<a class="page-link" href="commentScore?page=${pagination.nextPage }" data-page="${pagination.nextPage }">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>			
			</nav>
		</div>	
	</div>
</div>
<script type="text/javascript">

	$("#btn-search-comment").click(function(){
		var opt = $("select[name=opt]").val();
		var value = $.trim($(":input[name=value]").val());
		
		if (opt && value) {
			$(":input[name=page]").val("1");
			$("#form-search-comment").trigger("submit");
		} else {
			alert("검색조건 혹은 검색어를 입력하세요");					
		}
	})
	
	$(".pagination a").click(function() {
		event.preventDefault();
		var pageNo = $(this).attr("data-page");
		$(":input[name=page]").val(pageNo);
		$("#form-search-comment").trigger("submit");
	})
	$("#recent").click(function(){
		event.preventDefault();
		var pageNo = $(".pagination a").attr("data-page");
		$(":input[name=page]").val("1");
		$(":input[name=sort]").val('recent');
		$("#form-search-comment").trigger("submit");
	})
	$("#recommend").click(function(){
		event.preventDefault();
		var pageNo = $(".pagination a").attr("data-page");
		$(":input[name=page]").val("1");
		$(":input[name=sort]").val('recommend');
		$("#form-search-comment").trigger("submit");
	})
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>