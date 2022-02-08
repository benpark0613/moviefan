<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8"> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>공지사항</h1>
		</div>	
	</div>
	<div class="row mb">
		<div class="col">
			<div class="row mb-2">
				<div class="col d-flex align-items-end">
					<span>총 <strong id="totalRecords">0000</strong>건</span>
				</div>
				<div class="col-2">
					<select class="form-select">
						<option value="all" selected="selected">전체</option>
						<option value="system">시스템점검</option>
						<option value="cinema">극장</option>
						<option value="etc">기타</option>
					</select>
				</div>
			</div>
			<table class="table" id="">
				<thead>
					<tr>
						<th class="col-1 text-center">번호</th>
						<th class="col-1 text-center">구분</th>
						<th class="col-4 text-center">제목</th>
						<th class="col-4 text-center">등록일</th>
						<th class="col-1">조회수</th>
						<th class="col-1 text-center"></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty movies }">
						<tr>
							<td class="text-center" colspan="7">등록된 영화가 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="movie" items="${movies }">
							<tr>
								<td class="text-start">${movie.title }</td>
								<td class="text-start">${movie.titleEn }</td>
								<td class="text-center">${movie.no }</td>
								<td class="text-center"><fmt:formatDate value="${movie.productionYear }" pattern="yyyy" /></td>
								<td class="text-center"><fmt:formatDate value="${movie.openDate }" pattern="yyyy-MM-dd"	/></td>
								<td class="text-end"><button class="btn btn-outline-primary btn-sm" data-movie-no="${movie.no }">상세정보</button></td>
							</tr>
						</c:forEach>					
					</c:otherwise>				
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이지네이션 -->
	<div class="row mb">
		<div class="col">
		<c:if test="${pagination.totalRecords gt 0 }">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
						<a class="page-link" href="list?page=${pagination.prevPage }">이전</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="list?page=${num }">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
						<a class="page-link" href="list?page=${pagination.nextPage }">다음</a>
					</li>
				</ul>
			</nav>
		</c:if>		
		</div>
	</div>
	<div class="row mb-3 justify-content-center">
		<div class="col-5 offset-2">
			<form class="" method="get" action="list" id="form-search-movie">
				<input type="hidden" name="page" value="1">
				<div class="input-group">
 					<select class="form-select" name="opt">
 						<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
					    <option value="title" ${'title' eq param.opt ? 'selected' : ''}>제목</option>
					    <option value="content" ${'content' eq param.opt ? 'selected' : ''}>내용</option>
  					</select>
  					<input type="text" class="form-control" name="value" value="${param.value }">
  					<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i> 검색</button>
				</div>
			</form>
		</div>
		<div class="col-2">
			<a class="btn btn-primary" type="button" href="write">글작성</a>
		</div>
	</div>
</div>
</body>
</html>