<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 영화트레일러</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<c:set var="movieNav" value="트레일러"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<%@ include file="top.jsp" %>
	<div class="row mb-3">
		<span style="font-size:1.6em; color:#503396;"><strong>티저 예고편</strong></span>
		<hr color="black">
	</div>

	<c:forEach var="movieTrailer" items="${movieDetail.trailers }" varStatus="status" end="0">
		<div class="row mb-3">
			<div class="col align-self-center">
				<i id="prev-button" class="fas fa-chevron-left fa-3x"></i>
			</div>
			<div class="col">
				<video id="trailer" width="800" height="450" src="${movieTrailer.urlAddress }" controls></video>
			</div>
			<div class="col align-self-center">
				<i id="next-button" class="fas fa-chevron-right fa-3x"> </i>
			</div>
		</div>
		<hr color="black">
	</c:forEach>
	
	<div class="row mb-3 justify-content-center">
		<c:forEach var="movieTrailer" items="${movieDetail.trailers }" varStatus="status">
			<div class="col-3 trailer text-center">
				<video id="trailerSub${status.count }" width="240" height="136" src="${movieTrailer.urlAddress }"></video>
				<br>
				<span>${movieTrailer.title }</span>
			</div>
		</c:forEach>
	</div>
	
	<div class="row mb-3">
		<hr color="black">
		<span style="font-size:1.3em; color:#503396;"> <strong>${movieDetail.title }</strong>에 대한 <strong>${countImage }개</strong>의 스틸컷이 있어요! </span>
	</div>
	<div class="row mb-3">
		<c:forEach var="movieImage" items="${movieDetail.images }">
			<div class="col">
				<img src="/resources/images/movie/${movieImage.filename }" class="d-block w-100" alt="...">
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

var num = 1;
var length = $("video").length -1;

var urlOrigin = $("#trailer").attr("src");

	$("#next-button").click(function() {
		if (num < length) {
			num++;
			url = $("#trailerSub" + num).attr("src");
			$("#trailer").attr("src", url);
		} else {
			num = 1;
			url = urlOrigin;
			$("#trailer").attr("src", url);
		}
	})

	$("#prev-button").click(function() {
		if (num > 1) {
			num--;
			url = $("#trailerSub" + num).attr("src");
		} else {
			num = length;
			url = $("#trailerSub" + num).attr("src");
			$("#trailer").attr("src", url);
		}
		$("#trailer").attr("src", url);
	})
	
	$(".trailer").children("video").click(function(){
		var changeUrl = $(this).attr("src");
		$("#trailer").attr("src", changeUrl);
	})
	
</script>
</body>
</html>