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
	<div class="row my-3">
		<div class="col">
			<h1>영화조회</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<form id="form-search-movie" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="search">
				<input type="hidden" name="page" value="1" />
				<div class="col-12">
					<select class="form-select" name="opt">
						<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
						<option value="제목" ${'제목' eq param.opt ? 'selected' : ''}> 제목으로 검색</option>
						<option value="감독" ${'감독' eq param.opt ? 'selected' : ''}> 감독으로 검색</option>
					</select>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" name="value" value="${param.value }">
				</div>
				<div class="col-12">
					<button type="button" class="btn btn-primary" id="btn-search-movie">검색</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>