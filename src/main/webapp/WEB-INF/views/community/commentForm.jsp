<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 평점등록</title>
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
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="row mb-3">
		<form class="border bg-light p-3" method="post" action="commentregister">
		<h4>평점등록</h4>
			<div class="row mb-3">
				<div class="row mb-3">
					<!-- 영화검색 -->
					<div class="col-6">
				  		<label class="form-label">영화 제목</label>
						<select id="titleSelect" class="form-select" name="movieNo" aria-label="Default select example">
							<option selected disabled="disabled">영화를 선택하세요</option>
							<c:forEach var="movies" items="${movieList }">
								<c:if test="${'미개봉' ne movies.title }">
									<option value="${movies.no }"  ${title eq movies.title ? 'selected' : '' }>${movies.title }</option>
								</c:if>
							</c:forEach>
						</select>
				  	</div>
				  	
				  	<!-- 평점  -->
			  		<div class="col-3">
			  			<span>별점 : </span>
			  			<div class="btn-group me-2 mb-3" id="button-box">
							<button type="button" class="btn" id="1"><i class="bi bi-star"></i></button>
							<button type="button" class="btn" id="2"><i class="bi bi-star"></i></button>
						   	<button type="button" class="btn" id="3"><i class="bi bi-star"></i></button>
						    <button type="button" class="btn" id="4"><i class="bi bi-star"></i></button>
							<button type="button" class="btn" id="5"><i class="bi bi-star"></i></button>
						</div>
						<input type="hidden" id="rating" name="rating" value=""/>
			  		</div>
			  	</div>
		  		
		  		<div class="row mb-3">
		  			<div class="col" id="posterInput">
		  			
		  			</div>
		  			
		  			<div class="col" id="movieTitle">
		  			
		  			</div>
		  		</div>
		  		
		  		<!-- 한줄평 -->
		  		<div class="row">
					<div class="form-floating mb-3">
					  <textarea class="form-control" name="content" id="floatingTextarea"></textarea>
					  <label for="floatingTextarea">한줄 평을 작성해주세요.</label>
					</div>
					<div class="d-grid g-2 justify-content-md-end">
						<button type="submit" class="btn btn-secondary">등록</button>
					</div>
		  		</div>
		  	</div>
		</form>
	</div>
</div>
<script type="text/javascript">

	$("#button-box").hover(function(){
		$(this).next()
	}, function(){
		
	})
	
	$("#button-box button").mouseenter(function() {
		var rating = $(this).attr("id");
		$(this).closest('div').find("button").find('i').removeClass('bi-star-fill').addClass('bi-star')
		$(this).closest('div').find("button:lt("+parseInt(rating)+")").find('i').removeClass('bi-star').addClass('bi-star-fill');
		
		$("#rating").val(rating);
	})
	
	
	
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>