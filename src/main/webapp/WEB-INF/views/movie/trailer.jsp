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
		<hr color="black">
		<p style="color:#351f67; font-weight:bold; ">티저 예고편</p>
		<hr color="black">
	</div>

	<c:forEach var="movieTrailer" items="${movieTrailer }" varStatus="status" end="0">
		<div class="row mb-3">
			<div class="col align-self-center">
				<i id="prev-button" class="fas fa-chevron-left fa-3x"></i>
			</div>
			<div class="col">
				<iframe id="trailer${status.count }" width="900" height="450" src="${movieTrailer.movieTrailerURLAddress }"></iframe>
			</div>
			<div class="col align-self-center">
				<i id="next-button" class="fas fa-chevron-right fa-3x"> </i>
			</div>
		</div>
	</c:forEach>
	
	<div class="row mb-3">
		<div class="col align-self-center">
			<i class="fas fa-chevron-left fa-3x"></i>
		</div>
		<c:forEach var="movieTrailer" items="${movieTrailer }" varStatus="status" begin="1">
			<div class="col">
				<iframe id="trailer${status.count }" width="240" height="136" src="${movieTrailer.movieTrailerURLAddress }"></iframe>
			</div>
		</c:forEach>
		<div class="col align-self-center">
			<i class="fas fa-chevron-right fa-3x"></i>
		</div>
	</div>
	
	
	
	
	<div class="row">
		<hr color="black">
		<p> []영화제목]에 대한 [?]개의 스틸컷이 있어요!
	</div>
	<div class="row">
		<c:forEach var="movieImage" items="${movieImage }">
			<div class="col">
				<img src="/resources/images/movie/${movieImage.filename }" class="d-block w-100" alt="...">
			</div>
		</c:forEach>
	</div>
	<div class="row">
		페이지네이션
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

var num = 1;
var url = $("#trailer"+num).attr("src");

$("#next-button").click(function(){
	num++;
	if(num > 3){
		num = 1;
	}
	alert(num);
	url = $("#trailer"+num).attr("src"); 
	$("#trailer1")("src",url);
})

$("#prev-button").click(function(){
	num--;
	alert(num);
	url = $("#trailer"+num).attr("src");
	$("#trailer1").attr("src",url);
})
</script>
</body>
</html>