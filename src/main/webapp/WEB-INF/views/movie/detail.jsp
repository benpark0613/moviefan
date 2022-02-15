<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 영화상세정보</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/theme/datalab.min.css">
   <script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.pkgd.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   
   <link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
   <script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
</head>
<body>
<c:set var="movieNav" value="주요정보"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<%@ include file="top.jsp" %>
	<div class="row mb-3">
	  <span style="font-size:1.6em; color:#503396;"><strong>줄거리</strong></span>
	</div>
	<div class="row mb-3">
		<span style="font-size: 15px;">${movieDetail.summary }</span>
		<br>
		<br>
	</div>
	<div class="row mb-3">
	<br>
	<br>
	<table>
		<thead>
		<tr>
			<td><span style="font-size:1.2em; color:#503396;">성별 예매 분포</span></td>
			<td><span style="font-size:1.2em; color:#503396;">연령별 예매 분포</span></td>
		</tr>
	
		</thead>
		<tbody>
			<tr>
				<td><div id="donutChart"></div></td>
				<td><div id="barChart"></div></td>
			</tr>
		</tbody>
	
	</table>
	</div>
	<div class="row mb-3">
		<span style="font-size:1.3em; color:#503396;">트레일러 <strong>${countTrailer } 건</strong></span>
	</div>
	
	<div class="row mb-3 trailerShow" style="display : none;">
		<video width="400" height="600" src="" controls autoplay></video>
	</div>
	
	<div class="row mb-3 justify-content-center">
		<c:forEach var="movieTrailer" items="${movieDetail.trailers }">
			<div class="col-3 trailer text-center">
				<video width="260" height="142" src="${movieTrailer.urlAddress }"></video>
				<br>
				<span>${movieTrailer.title }</span>
			</div>
		</c:forEach>
	</div>
	<div class="row mb-3">
		<span style="font-size:1.3em; color:#503396;">스틸컷 <strong>${countImage } 건</strong></span>
	</div>
	
	<div class="row mb-3">
		<c:forEach var="movieImage" items="${movieDetail.images }" varStatus="status">
			<div class="col">
				<a class="asd"><img src="/resources/images/movie/${movieImage.filename }" alt="..."></a>
			</div>
		</c:forEach>
	</div>
	
	<div class="row mb-3">
		<span style="font-size:1.3em; color:#503396;"><strong>${movieDetail.title }</strong>에 대한 <strong>${size }</strong>개의 이야기가 있어요!</span>
	</div>
	<div class="row-6 mb-3">
		<div class="row mb-3">
			<div class="col-2 text-center">
				<img alt="" src="/resources/images/movie/ex.png">
				<p>MOVIEFAN</p>
			</div>
			<div class="col-10 border bg-light align-self-center">
				<div class="row">
					<div class="col-10">
					 	<span class="" style="font-size:1.2em; color:#503396;">
					 		[${movieDetail.title }] 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
						</span>
					</div>
					<div class="col-2">
						<a href="/community/commentForm?title=${movieDetail.title }"><i class="fas fa-pen fa-lg"></i><span> 관람평 쓰기</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:forEach var="comment" items="${comment }" end="4">
		<div class="row-6 mb-3">
			<div class="row mb-3">
				<div class="col-2 text-center">
					<img alt="" src="/resources/images/movie/bg-profile.png">
					<p>&nbsp;&nbsp;${comment.customerId }</p>
				</div>
				<div class="col-10 rounded-pill bg-light align-self-center">
					<div class="row">
						<div class="col align-self-center">
						 	<span class="" style="font-size:1.2em; color:#503396;">관람평</span>
						</div>
						<div class="col-1 align-self-center">
							<span style="font-size:1.5em; color:#503396;">${comment.rating }</span>
						</div>
						<div class="col-8 align-self-center">
							<span>${comment.content }</span>
						</div>
						<div class="col-2 align-self-center text-center">
							<i class="far fa-thumbs-up fa-lg"></i>
							<br>
							<span>${comment.likeCount }</span>
							<br>
							<span><fmt:formatDate value="${comment.creDate }" pattern="yyyy.MM.dd"/></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="row mb-3 text-end">
		<a href="comment?no=${movieDetail.no}"><span>더보기</span></a>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

var chart = bb.generate({
	size: {
    	height: 200,
    	width: 400
   },
	  data: {
	    columns: [
		["남", 30],
		["여", 120]
	    ],
	    type: "donut", // for ESM specify as: donut()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  bindto: "#donutChart"
	});

var chart = bb.generate({
	   size: {
	    	height: 200,
	    	width: 400
	   },
	  data: {
	    columns: [
		["10대", 200],
		["20대", 180],
		["30대", 200],
		["40대", 30],
		["50대", 50]
	    ],
	    type: "bar", // for ESM specify as: bar()
	  },
	  color: {
		    pattern: [
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8",
		      "#33a1b8"	
		    ]
		  },
	  bar: {
		  padding: 50,
		  width: {
		      ratio: 0.9,
		      max: 30
		    }
	  },
	  bindto: "#barChart"
	});

	$(".trailer").click(function(){
		url = $(this).children("video").attr("src");
		$(".trailerShow").children("video").attr("src", url);
		$(".trailerShow").css("display", "");
	})
</script>
</body>
</html>