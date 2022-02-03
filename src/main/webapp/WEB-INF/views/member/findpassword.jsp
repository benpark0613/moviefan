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
		<form class="" method="post" action="findpassword">
			<div class="col-6 offset-3">
				<div class="d-flex justify-content-center">
					<table class="table" style="width: 500px;">
						<thead></thead>
						<tbody>
							<tr>
								<th class="align-middle bg-light">아이디</th>
								<td><input type="text" class="form-control w-75" name="id" maxlength="20" placeholder="아이디를 입력해주세요."/></td>
							</tr>
							<tr>
								<th class="align-middle bg-light">이름</th>
								<td><input type="text" class="form-control w-75" name="name" maxlength="30" placeholder="이름을 입력해주세요."/></td>
							</tr>
							<tr>
								<th class="align-middle bg-light">이메일</th>
								<td><input type="email" class="form-control w-75" name="email" maxlength="25" placeholder="name@example.com"/></td>
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
	let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	let getName = RegExp(/^[가-힣]+$/);	// 한글만
	let getCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);	// 4~20자, 영대소문자, 숫자 
	
	let $id = $('form[action=findpassword] input[name=id]');
	let $name = $('form[action=findpassword] input[name=name]');
	let $email = $('form[action=findpassword] input[name=email]');
	
	$('#confirm').click(function(event) {
		event.preventDefault();
		
		if ($id.val() === '') {
			alert('아이디를 입력하세요.');
			$id.focus();
			return false;
		}
		if (!getCheck.test($id.val())) {
			alert('아이디는 4~20자 이내 영문 대소문자, 숫자만 입력 가능합니다.');
			$id.val('');
			$id.focus();
			return false;
		}
	
		if ($name.val() === '') {
			alert('이름을 입력하세요.');
			$name.focus();
			return false;
		}		
		if (!getName.test($name.val())) {
			alert('한글 이름을 입력해주세요.');
			$name.val('');
			$name.focus();
			return false;
		}
		
		if ($email.val() === '') {
			alert('이메일을 입력하세요.');
			$email.focus();
			return false;
		}		
		if (!getMail.test($email.val())) {
			alert('이메일 양식에 맞지 않습니다. 다시 확인해주세요.');
			$email.val('');
			$email.focus();
			return false;
		}
		
		$.post("/rest/home/findpassword", {name:$name.val(), email:$email.val(), id:$id.val()}, function(response) {
			if (response.status == "FAIL") {
				alert(response.error);
				return false;
			} else {
				$('form[action=findpassword]').submit();
			}
		})
		
	});
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>