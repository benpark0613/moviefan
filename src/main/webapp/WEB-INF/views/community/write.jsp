<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>영화리뷰 : 쓰기 </title>
   <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<form action="">
		<h2>쓰기</h2>
		<div class="mb-3 text-end">
			<a href="/community/reviewBoard" class="btn btn-secondary">취소</a>
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
		<div class="mb-3">
			<input type="text" class="form-control" name="title" placeholder="제목" />
		</div>
		<div class="mb-3">
			<textarea class="form-control" name="content" rows="10" placeholder="내용을 입력하세요."></textarea>
		</div>
		<div class="form-check">
  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
  			<label class="form-check-label" for="flexCheckChecked">
   			 댓글허용
  			</label>
		</div>
		<div class="mb-3">
			<button class="btn">사진첨부</button>
		</div>
		<div class="mb-3">
			<a href="" class="btn btn-secondary">임시저장</a>
			<a href="" class="btn btn-secondary">불러오기</a>
		</div>
	</form>	  	
</div>
<script type="text/javascript">

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>