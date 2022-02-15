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
			<div class="row">
				<h1>공지사항</h1>
			</div>
			<div class="row">
				<!-- 
					폼 입력요소에 <input type="file" />인 입력요소(첨부파일 업로드)가 있을 경우
					method는 반드시 post로 설정한다.
					enctype는 반드시 multipart/form-data로 설정한다.
				 -->
				<form class="border bg-light p-3" method="post" action="/admin/notice/insert" enctype="multipart/form-data">
					<div class="row mb-3">
						<div class="col">
							<label class="form-label">제목</label>
							<input type="text" class="form-control" name="title" />
						</div>
						<div class="col">
							<label class="form-label">구분</label>
							<select class="form-select form-select" name="categoryNo">
								<option value="100">시스템점검</option>
								<option value="200">극장</option>
								<option value="300" selected="selected">기타</option>
							</select>
						</div>
					</div>
					<div class="row mb-3">
						<label class="form-label">내용</label>
						<textarea class="form-control" rows="10" name="content"></textarea>
					</div>
					<div class="row mb-3">
						<label class="form-label">첨부사진</label>
						<input type="file" class="form-control" name="upfile"/>
					</div>
					<div class="text-end">
						<a href="list" class="btn btn-secondary">취소</a>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>	
	</div>
</div>
</body>
</html>