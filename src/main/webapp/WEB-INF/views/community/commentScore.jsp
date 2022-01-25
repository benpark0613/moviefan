<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 한줄평점</title>
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
			<h4>네티즌·관람객 평점</h4>
			<div class="row mb-3 border">
				<div class="col">
					<select class="form-select-sm" aria-label=".form-select-sm example">
						<option selected>검색구분</option>
						<option value="1">영화제목</option>
						<option value="2">글쓴이</option>
					</select> <input type="text" name="search" />
					<button type="button" class="btn btn-secondary">검색</button>
				</div>
				<!-- 내 평점등록 모달 트리거 -->
				<div class="col text-end">
					<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop">내 평점등록</button>
					<!-- 등록 모달 -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">내 평점등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row mb-3">
										<div class="col-md-3">영화포스터</div>
										<div class="col-md-6">
											별점
											
										</div>
										<hr>
									<textarea class="form-control" name="content" rows="4" placeholder="감상평을 남겨주세요."></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<input class="btn btn-primary" type="submit" value="등록">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mb-1">
				<h5 class="col">전체리스트</h5>
				<div class="col text-end">
					총 <strong>10,000</strong>개의 평점이 있습니다.
				</div>
			</div>
			<table class="mb-1 table table-bordered">
				<thead>
					<tr class="text-center">
						<th style="width: 10%">번호</th>
						<th style="width: 80%">감상평</th>
						<th style="width: 10%">글쓴이·날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-top">
						<td>100</td>
						<td><a href="" class="col text-dark">특송</a> <span>별점</span>
							<p>액션신만 가득할거라 예상하고 안볼랬는데 볼거 없어서 봤어요재밌게 봤습니다.액션 스토리 연기 모두 굿!</p></td>
						<td><a href="" class="col text-dark">lsw****</a> <fmt:formatDate value="" pattern="yyyy.M.d" />
							<p>22.01.23</p> <a href="" class="text-dark">신고</a> <a href="" class="text-dark">좋아요</a></td>
					</tr>
					<tr class="text-top">
						<td>100</td>
						<td><a href="" class="col text-dark">특송</a> <span>별점</span>
							<p>액션신만 가득할거라 예상하고 안볼랬는데 볼거 없어서 봤어요재밌게 봤습니다.액션 스토리 연기 모두 굿!</p></td>
						<td><a href="" class="col text-dark">lsw****</a> <fmt:formatDate value="" pattern="yyyy.M.d" />
							<p>22.01.23</p> <a href="" class="text-dark">신고</a> <a href="" class="text-dark">좋아요</a></td>
					</tr>
					<tr class="text-top">
						<td>100</td>
						<td><a href="" class="col text-dark">특송</a> <span>별점</span>
							<p>액션신만 가득할거라 예상하고 안볼랬는데 볼거 없어서 봤어요재밌게 봤습니다.액션 스토리 연기 모두 굿!</p></td>
						<td><a href="" class="col text-dark">lsw****</a> <fmt:formatDate value="" pattern="yyyy.M.d" />
							<p>22.01.23</p> <a href="" class="text-dark">신고</a> <a href="" class="text-dark">좋아요</a></td>
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
		</form>
	</div>
<script type="text/javascript">
	

</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>