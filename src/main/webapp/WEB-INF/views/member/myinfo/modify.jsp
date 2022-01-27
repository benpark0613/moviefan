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
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mt-3 mb-2">
		<div class="col">
			<h2 class="text-center">회원정보수정</h2>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<form class="border p-4 mb-5 bg-white w-50" method="post" action="register">
			<div class="d-flex justify-content-between">
				<p><strong>기본정보</strong></p>
				<p><i class="bi bi-dot text-danger"></i>필수입력사항</p>
			</div>
			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>아이디</label>
   				<input type="text" class="form-control" name="id"/>
    		</div>
			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>비밀번호</label>
   				<input type="password" class="form-control" name="password"/>
   			</div>
   			<div class="mb-3 row">
	   			<div class="col-6">
	   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이름</label>
	   				<input type="text" class="form-control" name="name"/>
	   			</div>
	   			<div class="col-6">
	   				<label class="form-label">닉네임</label>
	   				<input type="text" class="form-control" name="nickName"/>
	   			</div>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이메일</label>
   				<input type="text" class="form-control" name="email"/>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>휴대전화</label>
   				<input type="text" class="form-control" name="phoneNumber"/>
   			</div>
   			<div class="mb-3 row">
   				<div class="col-6">
   					<p>성별</p>
	   				<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="male" checked>
						<label class="form-check-label" >남자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="female">
						<label class="form-check-label">여자</label>
					</div>
   				</div>
   				<div class="col-6">
   					<label class="form-label">생년월일</label>
   					<input type="date" class="form-control" name="birthday"/>
   				</div>
   			</div>
   			<div class="row">
				<div class="d-grid gap-1 col-6 mx-auto">
					<button type="submit" class="btn btn-danger">회원가입</button>
				</div>
				<div class="d-grid gap-1 col-6 mx-auto">
					<a class="btn btn-light" href="/home">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>