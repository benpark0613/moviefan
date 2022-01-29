<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	
	<div class="row">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th>성인</th>
						<th>청소년</th>
						<th>경로우대</th>
					</tr>			
				</thead>
				<tbody>
					<tr>
						<td>10,000</td>
						<td>8,000</td>
						<td>6,000</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>