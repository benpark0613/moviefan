<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 영화리뷰</title>
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
  	<div id="content" class="row mb-3">
  		<h2>영화리뷰</h2>
  		<div class="col">
  			<table class="table table-hover table-bordered">
  				<thead>
  					<tr class="text-center">
  						<th width="8%">번호</th>
  						<th width="70%">제목</th>
  						<th width="10%">글쓴이</th>
  						<th width="5%">날짜</th>
  						<th width="7%">조회수</th>
  					</tr>
  				</thead>
  				<tbody>
  					<tr class="notice">
  						<td>
  							<span class="notice">공지</span>
  						</td>
  						<td>
  							<a>이용수칙입니다.</a>
  						</td>
  						<td>운영자</td>
  						<td>22.01.13</td>
  						<td>120</td>
  					</tr>
  					<tr class="text">
  						<td id="review_no">100</td>
  						<td id="review_title">
  							<a> (스파이더맨:뉴 유니버스) 뒤늦게 넷플로 봤어요..(스포)</a>
  						</td>
  						<td><a>멍냥멍</a></td>
  						<td>22.01.13</td>
  						<td>120</td>
  					</tr>
  					<tr class="text">
  						<td id="review_no">100</td>
  						<td id="review_title">
  							<a> (스파이더맨:뉴 유니버스) 뒤늦게 넷플로 봤어요..(스포)</a>
  						</td>
  						<td><a>멍냥멍</a></td>
  						<td>22.01.13</td>
  						<td>120</td>
  					</tr>
  					<tr class="text">
  						<td id="review_no">100</td>
  						<td id="review_title">
  							<a> (스파이더맨:뉴 유니버스) 뒤늦게 넷플로 봤어요..(스포)</a>
  						</td>
  						<td><a>멍냥멍</a></td>
  						<td>22.01.13</td>
  						<td>120</td>
  					</tr>
  					<tr class="text">
  						<td id="review_no">100</td>
  						<td id="review_title">
  							<a> (스파이더맨:뉴 유니버스) 뒤늦게 넷플로 봤어요..(스포)</a>
  						</td>
  						<td><a>멍냥멍</a></td>
  						<td>22.01.13</td>
  						<td>120</td>
  					</tr>
  				</tbody>
  			</table>
  			<nav aria-label="Page navigation example" class="pagination justify-content-center">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
					<li class="page-item"><a class="page-link" href="#">9</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
  		</div>
  		<div>
  			<button type="button" class="btn btn-primary">검색</button> <a href="/community/write" class="btn btn-secondary">쓰기</a>
  		</div>
  	</div>
</div>
<script type="text/javascript">

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>