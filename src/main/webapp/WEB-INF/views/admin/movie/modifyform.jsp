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
	<div class="row my-3">
		<div class="col">
			<h1>영화수정</h1>
		</div>
	</div>
	<div class="row my-3">
		<div class="col">
			<div class="col">
			<form class="border-top border-bottom" id="form-search-movie">
				<input type="hidden" name="current-page" value="1">
 				<div class="row py-5">
 					<div class="col-5">
 						<div class="row g-0 align-items-center mb-2">
 							<div class="col-2">
			 					<label><strong>영화명</strong></label>
 							</div>
 							<div class="col-9">
		 						<input type="text" class="form-control" name="movie-name">
 							</div>
 						</div>
 						<div class="row g-0 align-items-center">
 							<div class="col-2">
			 					<label><strong>제작연도</strong></label>
 							</div>
 							<div class="col-4">
		 						<select class="form-select" name="production-year-from">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
		 						<select class="form-select" name="production-year-to">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 						</div>
 					</div>
 					<div class="col-5">
 						<div class="row g-0 align-items-center mb-2">
 							<div class="col-2">
			 					<label><strong>감독명</strong></label>
 							</div>
 							<div class="col-9">
		 						<input type="text" class="form-control" name="director-name">
 							</div>
 						</div>
 						<div class="row g-0 align-items-center">
 							<div class="col-2">
			 					<label><strong>개봉연도</strong></label>
 							</div>
 							<div class="col-4">
 								<select class="form-select" name="open-year-from">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
 								<select class="form-select" name="open-year-to">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 						</div>
 					</div>
 					<div class="col-2 d-flex align-items-center">
 						<button class="btn btn-primary btn-lg me-1 fs-6" style="width: 85px;" id="btn-search-movie">조회</button>
 						<button class="btn btn-secondary btn-lg fs-6" style="width: 85px;" id="btn-clear-form">초기화</button>
 					</div>
 				</div>
			</form>
		</div>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	

</script>
</html>