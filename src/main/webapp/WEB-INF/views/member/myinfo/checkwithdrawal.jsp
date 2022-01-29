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
	<div class="col p-5 my-3">
		<div class="d-flex justify-content-center">
			<form class="border p-4 mb-5 bg-white w-75" method="post" action="withdrawal-agree">
				<div class="row text-center">
					<p class="fs-1">회원탈퇴</p>
					<p class="fs-2">회원탈퇴 전 <span class="text-danger">유의사항</span>을 확인해 주세요.</p>	
				</div>
				<div class="row">
					<div class="col-6 offset-3">
						<div class="row text-start mb-2">
							<h3>유의사항</h3>
						</div>
						<div class="row text-start mb-3">
							<p>MVF 아이디를 탈퇴하시면 서비스 부정 이용 방지를 위하여 일정 기간 동안 회원 재가입이 불가능합니다.</p>
							<p>MVF 탈퇴 시, 남은 포인트는 복원할 수 없습니다.</p>
							<p>MVF 탈퇴 시, 진행중인 주문 또는 서비스가 있을 경우 탈퇴가 불가능합니다.</p>
							<p>탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다.</p>
						</div>
						<div class="row text-start mb-3">
							<div class="form-check">
							  	<input class="form-check-input" type="checkbox" name="agree" value="Y" id="checkbox-withdrawal-agree">
							  	<label class="form-check-label" for="flexCheckDefault">
							    	위 유의사항을 모두 확인하였고 회원탈퇴에 동의합니다.
							  	</label>
							</div>
						</div>
			   			<div class="row">
							<div class="d-grid gap-1 col-6 mx-auto">
								<button type="button" class="btn btn-danger" id="button-withdrawal-check">확인</button>
							</div>
							<div class="d-grid gap-1 col-6 mx-auto">
								<a class="btn btn-light" href="/home">취소</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		$('#button-withdrawal-check').click(function(evnet) {
			event.preventDefault();
			if ($('#checkbox-withdrawal-agree').prop('checked') === false) {
				alert("탈퇴하시기 전 아래 유의사항을 확인해주세요.");
			}
			if ($('#checkbox-withdrawal-agree').prop('checked') === true) {
				$('form[action="withdrawal-agree"]').submit();
			}
		})
	});
</script>
</body>
</html>





























