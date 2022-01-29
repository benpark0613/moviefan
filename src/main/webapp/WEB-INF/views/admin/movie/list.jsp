<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
    <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>영화DB</h1>
		</div>	
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="row">
				<span class="text-start">총 <strong id="totalRecords">${pagination.totalRecords}</strong>건</span>
			</div>
			<table class="table" id="table-movie">
				<thead>
					<tr>
						<th class="col-5 text-center">영화명</th>
						<th class="col-5 text-center">영화명(영문)</th>
						<th class="col-2 text-center">개봉일</th>
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
						<c:forEach var="movie" items="${movies }" varStatus="loop">
							<tr>
								<td class="text-start">${movie.title }</td>
								<td class="text-start">${movie.titleEn }</td>
								<td class="text-center">${movie.openDate }</td>
							</tr>
						</c:forEach>					
					</c:otherwise>				
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이지네이션 -->
	<div class="row mb-3">
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
	<!-- 영화상세정보 모달 -->
	<!-- 트레일러 추가 모달 -->
</div>
<script type="text/javascript">

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>