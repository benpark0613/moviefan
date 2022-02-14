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
<!--    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae34331860bca5cb54eb73c6c398b367"></script> -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae34331860bca5cb54eb73c6c398b367&libraries=services"></script>
   <style type="text/css">
/* 		body { */
/* 			font-family: NanumBarunGothic; */
/* 			font-size: 16pt; */
/* 		} */
		#map {
			width:100%; 
			height:700px;
			margin-left: auto; 
			margin-right: auto;
		}
		table, th, tr, td {
		 	border:none;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">

	<input type="hidden" name="cinema-name" value="${cinema.name }">
	<input type="hidden" name="cinema-address" value="${cinema.address }">

	
	<!-- 지도 -->
	<div id="map" class="mt-5"></div>
	<a type="button" class="btn btn-outline-danger float-end mt-3" href="javascript:history.back();">상영시간표 확인</a>
	<div class="row mt-5 mb-3">
		<div class="col">
			<table class="table">
				<tr>
					<th class="col-2 fs-2 text-end">주차안내</th>
					<td class="col-1"></td>
					<td>
						<p>
							<strong class="fs-4"># 지하주차장</strong>
								<br>
								위치: 지하 5층 ~ 지 하2층<br>
								운영시간 : 평일 오전 5시 ~ 새벽 2시,
								          주말(토,일 or 금,토,일) 5시 ~ 새벽 3시<br>
								이용요금 : 20시 이전 1,000원/1시간 (20시 이후 1,000원/2시간)<br>
								<br>
								 - 최초 입차 후 1시간 무료/영화 관람시 50% 할인가능<br>
								 - 지하주차장 차량 입차는 마지막 영화 시작 시까지 가능하며, 출차는 24시간 가능합니다.<br>
								<br>
							<strong class="fs-4"># 지상주차장</strong>
								<br>
								주차가능대수 : 75대<br>
								운영시간 : 오전 7시 ~ 오후 9시<br>
								이용요금 : 20시 이전 2,000원/1시간 (20시 이후 2,000원/2시간)<br>
								<br>
								 - 최초 입차 후 30분 무료/영화 관람시 50% 할인(할인권 구입필요, 할인권은 최대 3장 사용가능)<br>
								 - 주차장 할인은 매표소에서 할인권을 구입하셔야 할인이 가능합니다.<br>
								 - 극장 매표소 운영종료시간인 마지막 영화 시작 전까지만 주차할인권 구매가 가능합니다.<br>
								 - 저녁 방문 고객님께서는 영화 시작 전 사전 할인권을 구매하셔야 합니다.
						</p>
					</td>
				<tr>
			</table>
		</div>
	</div>
	
	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">

	$(function () {
		// 상영관 이름과 주소를 변수에 저장
		let name = $('input[name=cinema-name]').val();
		let address = $('input[name=cinema-address]').val();
		
		// 지도를 표시할 div를 지정하고 지도의 중심좌표와 확대 레벨 설정
		var mapContainer = document.getElementById('map'),
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667),
	        level: 1 // 지도의 확대 레벨
	    };  	
		
		// 지도 생성
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소를 좌표로 변환해주는 객체 생성
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색하고, 정상적으로 검색이 완료됐으면 위치를 마커로 표시
		geocoder.addressSearch(address, function(result, status) {

			if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        console.log(coords);
		        
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 마커에 영화관 이름 표시
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name + '</div>'
		        });
		        
		        infowindow.open(map, marker);

		        // 지도의 중심을 좌표의 위치로 이동
		        map.setCenter(coords);
		    } 
		})
	})

</script>
</html>