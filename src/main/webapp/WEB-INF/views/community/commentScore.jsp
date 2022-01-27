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
				<div class="col text-end">
					총 <strong>10,000</strong>개의 평점이 있습니다.
				</div>
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
											<div class="col-2">${comment.movieNo }</div>
											<div class="col-4">별점 ${comment.rating } /5</div>
										</div>
										<div class="col pe-3">${comment.content }</div>
									</td>
									<td>
										<div>${comment.customerNo }</div>
										<div>
											<fmt:formatDate value="${comment.updatedDate }" pattern="yyyy-MM-dd" />
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<nav aria-label="Page navigation example" class="pagination justify-content-center">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
					<li class="page-item"><a class="page-link" href="#">9</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</form>
</div>
<script type="text/javascript">

</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>