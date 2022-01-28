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
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <style type="text/css">
		body {
			font-family: NanumBarunGothic;
			font-size: 16pt;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">

	<div class="p-5 mt-5 mb-5 bg-light rounded-3">
		<p>지도 들어갈 부분</p>
	</div>
	
	<div class="row">
		<div class="col">
			<table class="table">
				<tr>
					<th>교통안내<br>
						<button class="btn btn-sm btn-outline-danger position-relative mt-3">실시간 빠른 길 찾기</button>
					</th>
					<td>
						<p>
							# 일반버스 이용 시
								<br>
								마을: 강동01,광진01,광진03,광진04,광진05<br>
								일반: 1,1-1,1-2,9,9-1,13,13-2,15,91,92,93,95,96,96-1,97,112,112-1,2000-1,2000-3,2000-4<br>
								지선: 2224,3212,3214<br>
								광역: 11,100,1112,1113,1113-1,1113-2,1117,1650,1660,5600,5700<br>
								공항: 6705<br>
								<br>
							# 지하철 이용 시
							<br>
							2호선: 강변역 하차 1번 출구 테크노마트 10층
					<td>
				<tr>
					<th>주차안내</th>
					<td>
						<p>
							# 지하주차장
								<br>
								테크노마트 지하5층~ 지하2층<br>
								운영시간 : 평일 오전 5시~새벽 2시,
								              주말(토,일 or 금,토,일) 5시~새벽 3시<br>
								이용요금 : 20시 이전 1,000원/1시간 (20시 이후 1,000원/2시간)<br>
								<br>
								최초 입차 후 1시간 무료/영화 관람시 50% 할인가능<br>
								지하주차장 차량 입차는 마지막 영화 시작 시까지 가능하며, 출차는 24시간 가능합니다.<br>
								<br>
							#지상주차장
								<br>
								위치 : 테크노마트와 프라임상가 사이<br>
								주차가능대수 : 71대<br>
								운영시간 : 오전7시~오후9시<br>
								요금 : 20시 이전 2,000원/1시간 (20시 이후 2,000원/2시간)<br>
								<br>
								최초 입차 후 30분 무료/영화 관람시 50% 할인가능<br>
								(할인권 구입, 할인권은 3장만 사용가능)주차장 할인은 극장이 있는 10층 매표소에서 할인권을 구입하셔야 할인이 가능합니다.<br>
								극장 매표소 운영종료시간인 마지막 영화 시작 전까지만 주차할인권 구매가 가능합니다.<br>
								(저녁 방문 고객님께서는 영화 시작 전 사전 할인권 구매하셔야 합니다.)
						</p>
					</td>
				<tr>
			</table>
		</div>
	</div>
	
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>