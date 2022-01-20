<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">

	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row">
		<h1>영화선택</h1>
	</div>
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th class="col-3 text-center text-white bg-dark">영화</th>
					<th class="col-3 text-center text-white bg-dark">극장</th>
					<th class="col-2 text-center text-white bg-dark">날짜</th>
					<th class="col-4 text-center text-white bg-dark">시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="bg-light">
						<select class="form-select" size="20">
							<option value="" selected>스파이더맨-노웨이홈</option>
						 	<option value="">해적-도깨비깃발</option>
						  	<option value="">킹메이커</option>
						  	<option value="">특송</option>
						  	<option value="">씽2게더</option>
						  	<option value="">어나더라운드</option>
						  	<option value="">장민호드라마최종회</option>
						  	<option value="">비욘드라이브더무비:엔시티레조넌스</option>
						  	<option value="">하우스오브구찌</option>
						  	<option value="">경관의피</option>
						  	<option value="">웨스트사이드스토리</option>
						  	<option value="">블루버스데이</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						  	<option value="">러브레터</option>
						</select>
					</td>
					<td class="bg-light">
							<select class="form-select" size="20">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
							 	<option value="2">Two</option>
							  	<option value="3">Three</option>
							</select>
					</td>
					<td class="bg-light">
						<select class="form-select" size="20">
							<option selected>Open this select menu</option>
							<option value="1">One</option>
						 	<option value="2">Two</option>
						  	<option value="3">Three</option>
						</select>
					</td>
					<td class="bg-light">
						<select class="form-select" size="20">
							<option selected>Open this select menu</option>
							<option value="1">One</option>
						 	<option value="2">Two</option>
						  	<option value="3">Three</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>