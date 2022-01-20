<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>무비 차트</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<h1>무비 차트</h1>
	</div>
	<div class="row mb-3">
		<ol>
			<li>
				<div class="col mb-3">
					<img src="/resources/images/spiderman.png" class="rounded mx-auto d-block" alt="...">
					<a href="">스파이더맨- 노웨이 홈</a>
				</div>
			</li>
			<li>
				<div class="col mb-3">
					<img src="/resources/images/spiderman.png" class="rounded mx-auto d-block" alt="...">
					<a href="">스파이더맨- 노웨이 홈</a>
				</div>
			</li>
		</ol>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>