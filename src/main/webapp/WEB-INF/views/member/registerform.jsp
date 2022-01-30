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
	<div class="row mt-3 mb-2">
		<div class="col">
			<h2 class="text-center">회원가입</h2>
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
   				<input type="text" class="form-control" name="id" maxlength="20" placeholder="아이디는 4~20자 이내 영문, 숫자로 입력해주세요."/>
    		</div>
			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>비밀번호</label>
   				<input type="password" class="form-control" name="password" maxlength="20" placeholder="비밀번호는 4~20자 이내 영문, 숫자로 입력해주세요."/>
   			</div>
   			<div class="mb-3 row">
	   			<div class="col-6">
	   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이름</label>
	   				<input type="text" class="form-control" name="name" maxlength="30" placeholder="이름을 입력해주세요."/>
	   			</div>
	   			<div class="col-6">
	   				<label class="form-label">닉네임</label>
	   				<input type="text" class="form-control" name="nickName" maxlength="30" placeholder="닉네임을 입력해주세요." />
	   			</div>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이메일</label>
   				<input type="email" class="form-control" name="email" maxlength="25" placeholder="name@example.com"/>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>휴대전화</label>
   				<input type="tel" class="form-control" name="phoneNumber" pattern="[0-9]" maxlength="20" placeholder="숫자만 입력해주세요."/>
   			</div>
   			<div class="mb-3 row">
   				<div class="col-6">
   					<p>성별</p>
	   				<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="male">
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
					<button type="button" class="btn btn-danger" id="confirm">회원가입</button>
				</div>
				<div class="d-grid gap-1 col-6 mx-auto">
					<a class="btn btn-light" href="/home">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	let getCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);	// 4~20자, 영대소문자, 숫자 
	let getName = RegExp(/^[가-힣]+$/);	// 한글만
	let getPhoneNumber = RegExp(/^[0-9]+$/);
	
	let $id = $('form[action=register] input[name=id]');
	let $password = $('form[action=register] input[name=password]');
	let $name = $('form[action=register] input[name=name]');
	let $nickName = $('form[action=register] input[name=nickName]');
	let $email = $('form[action=register] input[name=email]');
	let $phoneNumber = $('form[action=register] input[name=phoneNumber]');
	
	$('#confirm').click(function(evenet) {
		evenet.preventDefault();
		
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
		
		if ($password.val() === '') {
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
		
		if (!getName.test($nickName.val())) {
			alert('닉네임은 한글만 입력 가능합니다.');
			$nickName.val('');
			$nickName.focus();
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
		
		if (!getPhoneNumber.test($phoneNumber.val())) {
			alert('전화번호는 숫자만 입력해주세요.');
			$phoneNumber.val('');
			$phoneNumber.focus();
			return false;
		}
		
		$('form[action=register]').submit();
	})
	
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>























