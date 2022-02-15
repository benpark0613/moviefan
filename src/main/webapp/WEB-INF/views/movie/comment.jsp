<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 한줄평</title>
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
	</div>
	<div class="row">
		<div class="col-10">
		</div>
		<div class="col-2 text-end">
			<span><a id="recent">최신순</a> <a id="recommend">공감순</a></span>
			<form id="form-sort" action="comment" method="get">
				<input type="hidden" name="page" value="" />
				<input id="sort" type="hidden" name="sort" value="" />
				<input type="hidden" name="no" value="${movieDetail.no }" />
			</form>
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
					 		<input id="movieTitle" type="hidden" value="${movieDetail.title }">
					 		<br><br>
						</span>
					</div>
					<div class="col-2 align-self-center">
						<a href="/community/commentForm?title=${movieDetail.title }"><i class="fas fa-pen fa-lg"></i><span> 관람평 쓰기</span></a>
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
							<button type="button" class="btn btn-outline-secondary like"><i class="far fa-thumbs-up fa-lg"></i></button>
							<input type="hidden" value="${comment.commentNo }">
							<input type="hidden" value="${comment.movieNo }">
							<br>
							<span id="like${status.index }" style="font-size: 17pt;"><strong>${comment.likeCount }</strong></span>
							<c:if test="${comment.customerNo eq customerNo}">
								<a href="/community/deletecomment?commentNo=${comment.commentNo }"><i class="bi bi-file-excel remove"></i></a>
							</c:if>
							<br>
							<span><fmt:formatDate value="${comment.creDate }" pattern="yyyy.MM.dd"/></span>
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
					<a class="page-link" href="comment?no=${movieDetail.no }&page=${pagination.prevPage }" data-page="${pagination.prevPage }">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						<a class="page-link" href="comment?no=${movieDetail.no }&page=${num }" data-page="${num }">${num }</a>
					</li>
				</c:forEach>
				<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					<a class="page-link" href="comment?no=${movieDetail.no }&page=${pagination.nextPage }" data-page="${pagination.nextPage }">
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
	
	$("#recent").click(function(){
		event.preventDefault();
		var pageNo = $(".pagination a").attr("data-page");
		$(":input[name=page]").val("1");
		$(":input[name=sort]").val('recent');
		$("#form-sort").trigger("submit");
	})
	$("#recommend").click(function(){
		event.preventDefault();
		var pageNo = $(".pagination a").attr("data-page");
		$(":input[name=page]").val("1");
		$(":input[name=sort]").val('recommend');
		$("#form-sort").trigger("submit");
	})
	
	$(".like").click(function(){
		event.preventDefault();
		var commentNo = $(this).next().val();
		var movieNo = $(this).next().next().val();
		var page = "1";
		var sort = ""
		var movieTitle = $("#movieTitle").val();
		$(this).toggleClass('active');
		
		
		
		$.ajax({
			type : "post",
			url : "/rest/review/updatelikecount",
			dataType : "json",
			data : {
				commentNo : commentNo,
				page : page,
				sort : sort,
				movieTitle : movieTitle
			},
			success : function(response){
				if(response.status == "FAIL"){
					alert(response.error);
				}else{
					for(var i=0; i<response.item.length;i++){
						$("#like"+[i]).text(response.item[i].likeCount);
					}
					alert("추천이 완료되었습니다.");
				}
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