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
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mt-4 mb-2">
		<div class="col">
			<h2 class="text-center">로그인 후 이용해주세요.</h2>
		</div>
	</div>
	<div class="d-flex justify-content-center mb-5">
		<form class="border bg-light w-50" method="post" action="login" id="form-normal-login-error">
			<div class="row mb-3 mt-3">
				<div class="col-8 offset-2">
					<label class="form-label align-middle">아이디</label>
					<input type="text" class="form-control" name="id">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-8 offset-2">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password">
				</div>
			</div>
			<div class="d-flex justify-content-center mb-1">
				<button class="btn btn-danger" id="button-normal-login-error" style="width: 300px;">로그인</button>
			</div>
			<div class="d-flex justify-content-center">
				<a class="link-dark" href="/findid">아이디 찾기</a>
				<p>&nbsp;|&nbsp;</p> 
				<a class="link-dark" href="/findpassword">비밀번호 찾기</a>
				<p>&nbsp;|&nbsp;</p> 
				<a class="link-dark" href="/join">회원가입</a>
			</div>
			<div class="d-flex justify-content-center mb-3">
				<a id="btn-kakao-login-error" href="">
					<img src="/resources/images/kakao_login.png" alt="카카오 로그인 버튼"/>
				</a>
			</div>
		</form>
	</div>
	<div class="row">
		<%--
    		카카오 로그인 서비스가 제공하는 사용자 정보를 서버로 제출할 때 사용하는 폼과 폼 입력요소다.
    		카카오 로그인 인증이 완료되면 사용자정보를 전달받아서 아래 폼 입력필드에 설정하고, 폼을 서버로 제출한다.
    	 --%>
    	<form id="form-kakao-login-error" method="post" action="kakao-login">
    		<input type="hidden" name="id" />
    		<input type="hidden" name="nickName" />
    		<input type="hidden" name="email" />
    		<input type="hidden" name="gender" />
    	</form>
	</div>
</div>
<script type="text/javascript">
$(function() {
	// 일반 로그인
	$('#button-normal-login-error').click(function(event) {
		event.preventDefault();
		
		let $id = $('#form-normal-login-error input[name=id]').val();
		let $password = $('#form-normal-login-error input[name=password]').val();
		
		if ($id.trim() === null || $id.trim() === "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if ($password.trim() === null || $password.trim() === "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		$.post("/rest/home/logincheck", {id:$id, password:$password}, function(response) {
			if (response.status == "FAIL") {
				alert(response.error);
			} else {
				window.location.href = "/home";
			}
		})
		
	});
	
	// 카카오 로그인
	$('#btn-kakao-login-error').click(function(event) {
		event.preventDefault();
		// 사용자키 전달, 카카오 로그인 서비스 초기화
		Kakao.init('01646474eb0f93b6d4faadcbe95c79ea');
		// 카카오 로그인 서비스 실행, 사용자 정보 가져오기
		Kakao.Auth.login({
			success: function(auth) {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response) {
						// 사용자 정보를 가져와서 폼에 추가
						let account = response.kakao_account;
						
						$('#form-kakao-login-error input[name=id]').val(response.id);
						$('#form-kakao-login-error input[name=nickName]').val(account.profile.nickname);
						$('#form-kakao-login-error input[name=email]').val(account.email);
						$('#form-kakao-login-error input[name=gender]').val(account.gender);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector('#form-kakao-login-error').submit()
					},
					fail: function(error) {
						alert('카카오 로그인 처리 중 오류가 발생하였습니다.');
					}
				});
			},
			fail: function(error) {
				alert('카카오 로그인 처리 중 오류가 발생하였습니다.')
			}
		});
	})
})
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>














