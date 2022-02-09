<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 관람평</title>
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
<c:set var="movieNav" value="평점"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<%@ include file="top.jsp" %>
	
	<div class="row mb-3">
		<div class="col-10">
			<span style="font-size:1.6em; color:#503396;"><strong>${movieDetail.title }</strong>에 대한 <strong>${size }</strong>개의 이야기가 있어요!</span>
		</div>
		<div class="col-2">
			<div class="row">
				<button type="button" class="btn btn-outline-secondary">본 영화 등록</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-10">
		</div>
		<div class="col-2">
			<span><a href="">최신순</a> <a href="">공감순</a> <a href="">평점순</a></span>
		</div>
	</div>
	<div class="row-6 mb-3">
		<div class="row mb-3">
			<div class="col-2 text-center">
				<img alt="" src="/resources/images/movie/ex.png">
				<p>MOVIEFAN</p>
			</div>
			<div class="col-10 rounded-pill bg-light align-self-center">
				<div class="row">
					<div class="col-10">
					 	<span class="" style="font-size:1.2em; color:#503396;">
					 		<br>
					 		<strong>${movieDetail.title }</strong> 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
					 		<input id="movieNo" type="hidden" value="${movieDetail.no }">
					 		<br><br>
						</span>
					</div>
					<div class="col-2 align-self-center">
						<a href=""><i class="fas fa-pen fa-lg"></i><span> 관람평 쓰기</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:forEach var="comment" items="${comment }" varStatus="status">
		<div class="row-6 mb-3">
			<div class="row mb-3">
				<div class="col-2 text-center">
					<img alt="" src="/resources/images/movie/bg-profile.png">
					<p>&nbsp;&nbsp;${comment.customerId }</p>
				</div>
				<div class="col-10 rounded-pill bg-light align-self-center">
					<div class="row">
						<div class="col-1 align-self-center">
						 	<span class="" style="font-size:1.2em; color:#503396;">관람평</span>
						</div>
						<div class="col-1 align-self-center">
							<span style="font-size:1.5em; color:#503396;">${comment.rating }</span>
						</div>
						<div class="col-9 align-self-center">
							<span>${comment.content }</span>
						</div>
						<div class="col-1 align-self-center">
							<a href="" class="like"><i class="far fa-thumbs-up fa-lg"></i></a>
							<input type="hidden" value="${comment.commentNo }">
							<br>
							<span id="like${status.index }" style="font-size: 13pt;"><strong>${comment.likeCount }</strong></span>
							<span><fmt:formatDate value="${comment.creDate }" pattern="YYYY.MM.DD"/></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="row mb-3">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					<a class="page-link" href="customerrating?no=${movieDetail.no }&page=${pagination.prevPage }" data-page="${pagination.prevPage }">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						<a class="page-link" href="customerrating?no=${movieDetail.no }&page=${num }" data-page="${num }">${num }</a>
					</li>
				</c:forEach>
				<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					<a class="page-link" href="customerration?no=${movieDetail.no }&page=${pagination.nextPage }" data-page="${pagination.nextPage }">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>			
		</nav>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">
$(function(){
	
	$(".like").click(function(){
		event.preventDefault();
		var commentNo = $(this).next().val();
		var movieNo = $("#movieNo").val();
		
		$.ajax({
			type : "post",
			url : "/rest/review/updatelikecount",
			dataType : "json",
			data : {
				commentNo : commentNo,
				movieNo : movieNo
			},
			success : function(response){
				for(var i=0; i<response.item.length;i++){
					$("#like"+[i]).text(response.item[i].likeCount);
				}
				alert("추천이 완료되었습니다.")
			},
			error : function(response){
				alert(response.error)
			}
		})
	})
})


</script>
</body>
</html>