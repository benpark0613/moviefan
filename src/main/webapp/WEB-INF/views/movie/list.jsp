<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 무비차트</title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <link href="/resources/css/movielist.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col-9 align-self-center">
		<h1>무비 차트</h1>
		</div>
		<div class="col-3">
			<div class="row">
				<div class="col">
					<ul id="sort" style="list-style:none;">
						<li>
							<span class="align-middle" style="font-size: 12pt; color:#b12e2e;">▶ 무비차트</span>
						</li>
						<li class="subMenu" style="visibility: hidden;">
							<a href="list"><span id="audience" style="color:#b12e2e; font-size: 10pt;">&nbsp;&nbsp;▶ 관람객순</span></a>
						</li>
						<li class="subMenu" style="visibility: hidden;">
							<a href="listbyrating"><span id="rating" style="font-size: 10pt;">&nbsp;&nbsp;▶ 평점순</span></a>
						</li>
					</ul>
				</div>
				<div class="col">
					<a id="movieStatus2" href="commingsoon"><span class="align-middle" style="font-size: 12pt;">상영예정작</span></a>
				</div>
			</div>
		</div>
		<hr size="3px" color="black">
	</div>
	<div class="row">
		<c:forEach var="movies" items="${movie }" varStatus="status">
			<div class="col-3 mb-3">
				<div class="row pic">
					<span class="rank">${status.count }</span>
					<img class="imgs" src="/resources/images/movie/moviePoster/${movies.no }.jpg" class="rounded float-start" alt="..."> 
					<span class="summary">${movies.summary }</span>
					<span class="customerRating">관람평 ${movies.customerRating }</span>
				</div>
				<div class="row">
					<div class="col-1">
						<img alt="" src="/resources/images/movie/age/age_15.png">
					</div>
					<div class="col"> 
						<a href="detail?no=${movies.no }"><span class="movieTitle">${movies.title }</span></a>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<span style="font-size: 12pt;">개봉일 <fmt:formatDate value="${movies.openDate }" pattern="yyyy.MM.dd" /></span>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<button type="button" class="btn btn-outline-dark wishListBtn ${'Y' eq myWishList[status.index] ? 'active' : '' }" style="padding-left:10px; padding-right:10px;">
							<i class="far fa-heart fa-lg"></i><span> ${wishList[status.index] }</span>
						</button>
							<input type="hidden" value="${movies.no}" /> 
					</div>
					<div class="col">
						<a href="/ticket/booking"><button type="button" class="btn btn-danger btn-block" style="padding-left:50px; padding-right:50px;"><span>예매</span></button></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

	$(".pic").hover(function(){
		$(this).find(".imgs").css("opacity", 0.91);
		$(this).find(".imgs").css("filter", "brightness(10%)");
		$(this).find(".imgs").next().css("z-index", 1);
		$(this).find(".imgs").next().next().css("z-index", 1);
		$(this).find(".imgs").next().next().css("color", '#59bec9');
	}, function(){
		$(this).find(".imgs").css("opacity", 1);
		$(this).find(".imgs").css("filter", "brightness(100%)");
		$(this).find(".imgs").next().css("z-index", -1)
		$(this).find(".imgs").next().next().css("z-index", -1);
		$(this).find(".imgs").next().next().css("color", 'white');
	})
	
	$("#sort").hover(function(){
		$(".subMenu").css("visibility", "")
		$("#rating").hover(function(){
				$(this).css("color", "red");
			}, function(){
				$(this).css("color", "#444");
			})
	}, function(){
		$(".subMenu").css("visibility", "hidden");
	})
	
	
	$("#movieStatus2").hover(function(){
		$(this).prepend("<span>▶</span>")
		$(this).find("span").css("color", "#b12e2e");
	}, function(){
		$(this).find("span").first().remove();
		$(this).find("span").css("color", "#444");
	})
	
	$(".wishListBtn").click(function(){
		var movieNo = $(this).next().val();
		var count = $(this).children("span")
		$(this).toggleClass('active');
		
		
		$.ajax({
			type : "post",
			url : "/rest/movie/wishlist",
			dataType : "json",
			data: {
				movieNo : movieNo
			},
			success : function(response){
				if(response.status == 'FAIL'){
					alert(response.error);
				}else{
					$(this).children("span").text(response.item[0]);
					count.text(' '+response.item[0]);
					alert("저장되었습니다.");
				}
			},
			error : function(response){
				alert(response.error);
			}
		})
	})
	
</script>
</body>
</html>