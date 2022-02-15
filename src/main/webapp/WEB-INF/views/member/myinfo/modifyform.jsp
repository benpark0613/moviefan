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
	<div class="row mt-3 mb-2">
		<div class="col">
			<h2 class="text-center">회원정보수정</h2>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<form class="border p-4 mb-5 bg-white w-50" method="post" action="myinfo/modify-customer-info" id="modify">
			<div class="d-flex justify-content-between">
				<p><strong>기본정보</strong></p>
				<p><i class="bi bi-dot text-danger"></i>필수입력사항</p>
			</div>
			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>아이디</label>
   				<input type="text" class="form-control" name="id" value="${LOGINED_CUSTOMER.id }" disabled="disabled"/>
    		</div>
			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>비밀번호</label>
   				<input type="password" class="form-control" name="password" value="${LOGINED_CUSTOMER.password }"/>
   			</div>
   			<div class="mb-3 row">
	   			<div class="col-6">
	   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이름</label>
	   				<input type="text" class="form-control" name="name" value="${LOGINED_CUSTOMER.name }" disabled="disabled"/>
	   			</div>
	   			<div class="col-6">
	   				<label class="form-label">닉네임</label>
	   				<input type="text" class="form-control" name="nickName" value="${LOGINED_CUSTOMER.nickName }"/>
	   			</div>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>이메일</label>
   				<input type="text" class="form-control" name="email" value="${LOGINED_CUSTOMER.email }"/>
   			</div>
   			<div class="mb-3">
   				<label class="form-label"><i class="bi bi-dot text-danger"></i>휴대전화</label>
   				<input type="text" class="form-control" name="phoneNumber" value="${LOGINED_CUSTOMER.phoneNumber }"/>
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
					<button type="button" class="btn btn-danger" id="confirm">회원정보수정</button>
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
	let getNickName = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);	// 한글, 영대소문자, 숫자
	let getPhoneNumber = RegExp(/^[0-9]+$/);
	
	$('#confirm').click(function(event) {
		let $id = $('#modify input[name=id]');
		let $name = $('#modify input[name=name]');
		let $nickName = $('#modify input[name=nickName]');
		let $email = $('#modify input[name=email]');
		let $phoneNumber = $('#modify input[name=phoneNumber]');
		let $password = $('#modify input[name=password]');
		let $gender = $('#modify input[name=gender]:checked');
		let $birhday = $('#modify input[name=birthday]');

		event.preventDefault();
		
		if (!$id.val()) {
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
		
		if (!$name.val()) {
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
		
		if ($nickName.val()) {
			if (!getNickName.test($nickName.val())) {
				alert('닉네임은 한글, 영문 대소문자, 숫자만 입력 가능합니다.');
				$nickName.val('');
				$nickName.focus();
				return false;
			}
		}
		
		if (!$email.val()) {
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
		
		let form = {id:$id.val(), name:$name.val(), nickName:$nickName.val(), email:$email.val(),
					phoneNumber:$phoneNumber.val(), password:$password.val(), gender:$gender.val(), birthday:$birhday.val()};
	
		let jsonForm = JSON.stringify(form);
		
		$.ajax({
			type: "POST",
			url: "/rest/home/update",
			data: jsonForm,
			contentType: 'application/json',
			success: function(response) {
				if (response.status == "FAIL") {
					alert(response.error);
					return;
				} else {
					alert("회원 정보 수정이 완료되었습니다.");
					window.location.replace("/logout");	
				}
			}
		})
	});
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>