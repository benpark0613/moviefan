<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon" />
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="row p-2 my-3">
		<div class="col-6 offset-3 bg-light py-5">
			<div class="d-flex justify-content-center mt-3 mb-2">
				<div class="col">
					<h1 class="text-center">환영합니다!</h1>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<p class="fs-6">
					<strong><c:out value="${customer.name}" />&nbsp;</strong>님, 회원가입을 축하합니다!<br>
					무비팬에 가입하신 ID는 <span class="text-danger"><strong><c:out value="${customer.id}" />&nbsp;</strong></span>입니다.
				</p>
			</div>
			<div class="d-flex justify-content-center">
				<p class="fs-6">
					이제 무비팬의 다양한 기능을 이용하실 수 있습니다. 
				</p>
			</div>	
			<div class="d-flex justify-content-center mb-3">
				<div class="d-grid gap-1 col-6 mx-auto">
					<a class="btn btn-danger" href="/home">메인으로</a>
				</div>
			</div>	
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>