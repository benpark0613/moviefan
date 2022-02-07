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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
<form>
		<h4>네티즌·관람객 평점</h4>
		<div class="row mb-3">
			<div class="col-8">
				<select class="form-select-sm" aria-label=".form-select-sm example">
					<option selected>검색구분</option>
					<option value="1">영화제목</option>
					<option value="2">글쓴이</option>
				</select>
				<input type="text" name="search" />
				<button type="button" class="btn btn-secondary">검색</button>
			</div>
			<div class="col-4 text-end">
				<a href="/community/commentForm" type="button" class="btn btn-primary">내 평점등록</a>
			</div>
			</div>
			<div class="row mb-1">
				<h5 class="col">전체리스트</h5>
					
			<%-- 		<div class="col text-end">
						총 <strong>${comment.commentRow }</strong>개의 평점이 있습니다.
					</div> --%>
				
			</div>
			<table class="table table-bordered">
				<thead>
					<tr class="text-center">
						<th style="width: 10%">번호</th>
						<th style="width: 80%">감상평</th>
						<th style="width: 10%">글쓴이·날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty comments }">
							<tr>
								<td class="text-center" colspan="5">등록된 한줄평점이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="comment" items="${comments }" varStatus="loop">
								<tr>
									<td class="text-center">${comment.commentNo }</td>
									<td>
										<div class="row">
											<a href="" class="col-2">${comment.movieTitle }</a>
											<div class="col-4">별점 ${comment.rating } /5</div>
										</div>
										<div class="col pe-3">${comment.content }</div>
									</td>
									<td>
										<div>${comment.customerId }</div>
										<div>
											<fmt:formatDate value="${comment.creDate }" pattern="yyyy-MM-dd" />
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<c:if test="${pagination.totalRecords gt 0 }">
				<div class="row mb-3">
					<div class="col">
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
									<a class="page-link" href="commentScore?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
								</li>
								
								<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
					    				<a class="page-link" href="commentScore?page=${num }" data-page="${num }">${num }</a>
					    			</li>	    			
				    			</c:forEach>
				    			
				    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
				      				<a class="page-link" href="commentScore?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
				    			</li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
			
		</div>
	</form>
</div>
<script type="text/javascript">
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var pageNo = $(this).attr("data-page");
		// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
		$(":input[name=page]").val(pageNo);
		
		// 검색폼에 onsubmit 이벤트 발생시키기
		$("#form-search-book").trigger("submit");
	})
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>