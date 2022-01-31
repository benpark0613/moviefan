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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mt-4 mb-2">
		<div class="col">
			<h2 class="text-center">아이디/비밀번호 찾기</h2>
		</div>
	</div>
	<div class="d-flex justify-content-center my-3">
		<ul class="nav nav-tabs">
			<li class="nav-item" style="width: 250px;">
				<a class="nav-link link-dark text-center" aria-current="page" href="findid">아이디 찾기</a>
			</li>
			<li class="nav-item" style="width: 250px;">
				<a class="nav-link link-dark active text-center" aria-current="page" href="findpassword">비밀번호 찾기</a>
			</li>
		</ul>
	</div>
	<div class="row mt-3">
		<form class="" method="post" action="newpassword" id="changepassword">
			<div class="col-6 offset-3">
				<div class="d-flex justify-content-center">
					<input type="hidden" class="form-control w-75" name="email" maxlength="25" placeholder="name@example.com" value="${customer.email }"/>
					<table class="table" style="width: 500px;">
						<thead></thead>
						<tbody>
							<tr>
								<th class="align-middle bg-light">새 비밀번호</th>
								<td><input type="password" class="form-control w-75" name="password" maxlength="20"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row mb-5">
					<div class="d-grid gap-1 col-6 mx-auto">
						<button type="button" class="btn btn-light btn-lg" id="confirm">비밀번호 재설정</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(function() {
	let getCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);	// 4~20자, 영대소문자, 숫자 
	
	$('#confirm').click(function(event) {
		let $password = $('#changepassword input[name=password]');
		
		if (!$password.val()) {
			alert('비밀번호를 입력하세요.');
			$password.focus();
			return false;
		}		
		if (!getCheck.test($password.val())) {
			alert('비밀번호는 4~20자 이내 영문 대소문자, 숫자만 입력 가능합니다.');
			$password.val('');
			$password.focus();
			return false;
		}
		
		$('form[action=newpassword]').submit();
		
	})
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>