<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
    <link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
		#overlay {
			position: fixed; /* Sit on top of the page content */
		 	width: 100%; /* Full width (cover the whole page) */
		  	height: 100%; /* Full height (cover the whole page) */
		  	top: 0;
		  	left: 0;
		  	right: 0;
		  	bottom: 0;
		  	background-color: rgba(0,0,0,0.5); /* Black background with opacity */
		  	z-index: 10000000 !important; /* Specify a stack order in case you're using a different order for other elements */
		  	cursor: pointer; /* Add a pointer on hover */
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container mb-5">
	<div class="row d-flex justify-content-center">
		<div class="col-10">
			<div class="row mb-3">
				<div class="col">
					<h1>공지사항</h1>
				</div>	
			</div>
			<div class="row mb">
				<div class="col">
					<div class="row mb-2">
						<div class="col d-flex align-items-end">
							<span>총 <strong id="totalRecords">${pagination.totalRecords }</strong>건</span>
						</div>
<!-- 						<div class="col-2"> -->
<!-- 							<select class="form-select"> -->
<!-- 								<option value="all" selected="selected">전체</option> -->
<%-- 								<c:forEach var="category" items="${categories }"> --%>
<%-- 									<option value="${category.categoryNo }">${category.name }</option> --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<!-- 						</div> -->
					</div>
					<table class="table" id="">
						<thead>
							<tr>
								<th class="col-1 text-center">번호</th>
								<th class="col-1 text-center">구분</th>
								<th class="col-4 text-start">제목</th>
								<th class="col-1 text-center">등록일</th>
								<th class="col-1 text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty noticeList }">
								<tr>
									<td class="text-center" colspan="7">등록된 공지사항이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${noticeList }">
									<tr>
										<td class="text-center">${notice.no }</td>
										<c:forEach var="category" items="${categories }">
											<c:if test="${category.categoryNo eq notice.categoryNo }">
												<td class="text-center">${category.name }</td>
											</c:if>
										</c:forEach>
										<td class="text-start"><a class="link-dark" href="/admin/notice/detail?no=${notice.no }">${notice.title }</a></td>
										<td class="text-center"><fmt:formatDate value="${notice.createdDate }" pattern="yyyy-MM-dd" /></td>
										<td class="text-center">${notice.viewCount }</td>
									</tr>
								</c:forEach>					
							</c:otherwise>				
						</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 페이지네이션 -->
			<div class="row mb">
				<div class="col">
				<c:if test="${pagination.totalRecords gt 0 }">
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
								<a class="page-link" href="/admin/list?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="/admin/list?page=${num }" data-page="${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
								<a class="page-link" href="/admin/list?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
							</li>
						</ul>
					</nav>
				</c:if>		
				</div>
			</div>
			<div class="row mb-3 justify-content-center">
				<div class="col-5 offset-2">
					<form class="" method="get" action="/admin/notice/list" id="form-search-notice">
						<input type="hidden" name="page" value="1">
						<div class="input-group">
		 					<select class="form-select" name="opt">
		 						<option value="" selected disabled="disabled">검색조건</option>
							    <option value="title" ${'title' eq param.opt ? 'selected' : ''}>제목</option>
							    <option value="content" ${'content' eq param.opt ? 'selected' : ''}>내용</option>
		  					</select>
		  					<input type="text" class="form-control" name="value" value="${param.value }">
		  					<button class="btn btn-outline-secondary" type="submit" id="btn-search-notice"><i class="bi bi-search"></i>검색</button>
						</div>
					</form>
				</div>
				<div class="col-2 text-end">
					<a class="btn btn-primary" type="button" href="/admin/notice/write">글작성</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#btn-search-notice").click(function() {
		event.preventDefault();
		// 검색옵션값과 입력값을 조회한다.
		var opt = $("select[name=opt]").val();
		var value = $.trim($(":input[name=value]").val());
		
		// 검색옵션값과 입력값이 모두 존재하면 페이지번호를 1로 설정하고 폼에서 onsubmit 이벤트를 발생시켜서 폼 입력값이 서버로 제출되게 한다.
		if (opt && value) {
			$(":input[name=page]").val("1");
			$("#form-search-notice").trigger("submit");
		} else {
			alert("검색조건 혹은 검색어를 입력하세요");					
		}
	});
	
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var page = $(this).attr("data-page");
		// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
		$(":input[name=page]").val(page);
		// 검색폼에 onsubmit 이벤트 발생시키기
		$("#form-search-notice").trigger("submit");
	})
</script>
</body>
</html>