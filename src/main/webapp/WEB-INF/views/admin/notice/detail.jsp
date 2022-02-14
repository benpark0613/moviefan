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
		#overlay {
			position: fixed; /* Sit on top of the page content */
		 	width: 100%; /* Full width (cover the whole page) */
		  	height: 100%; /* Full height (cover the whole page) */
		  	top: 0;
		  	left: 0;
		  	right: 0;
		  	bottom: 0;
		  	background-color: rgba(0,0,0,0.5); /* Black background with opacity */
		  	z-index: 10000000 !important; /* Specify a stack order in case you're using a different order for other elements */
		  	cursor: pointer; /* Add a pointer on hover */
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container mb-5">
	<div class="row d-flex justify-content-center mb-3">
		<div class="col-10">
			<div class="row mb-2">
				<h1>공지사항</h1>
			</div>
			<div class="row bg-light border-top">
				<div class="col d-flex justify-content-start">
					<p class="fw-bold me-1 my-2">
						<c:forEach var="category" items="${categories }">
							<c:if test="${category.categoryNo eq notice.categoryNo }">
								[${category.name }]
							</c:if>
						</c:forEach>
					</p>
					<p class="fw-bold me-auto my-2">
						${notice.title}
					</p>
					<p class="fw-bold text-end me-2 my-2">
						등록일 <fmt:formatDate value="${notice.createdDate}" pattern="yyyy-MM-dd" />
					</p>
					<p class="fw-bold text-end my-2">
						조회수 ${notice.viewCount }
					</p>
				</div>
			</div>
			<div class="row border-bottom">
				<div class="col p-5">
					<div class="row mb-2">
						<c:if test="${not empty noticeImage }">
							<img class="img-thumbnail w-25" src="/resources/images/admin/${noticeImage.image }">
						</c:if>
					</div>
					<div class="row">
						<p>${notice.content }</p>
					</div>
				</div>
			</div>
			<div class="row my-2">
				<div class="col d-flex justify-content-end">
					<a href="/admin/notice/list?no=${param.no }" class="btn btn-primary" type="button">목록으로</a>
					<a href="/admin/notice/update?no=${param.no }" class="btn btn-secondary ms-2" type="button">수정</a>
					<a href="/admin/notice/delete?no=${param.no }" class="btn btn-dark ms-2" type="button" id="a-delete-notice">삭제</a>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	$('#a-delete-notice').click(function(event) {
		event.preventDefault();
		if (confirm("삭제하시겠습니까?")) {
			let request = $(this).attr('href');
			location.href = request;
			alert('삭제가 완료되었습니다.');
		}
	})
})
</script>
</html>



















