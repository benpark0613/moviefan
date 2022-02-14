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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
	<style type="text/css">
		header {
			background-color: #1c243c;
		}
		#image-box {
		    overflow-x: auto !important;
		    overflow-y: hidden !important;
		    white-space: nowrap !important;
		}
		#trailer-box {
			overflow-x: auto !important;
		    overflow-y: hidden !important;
		    white-space: nowrap !important;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>영화DB</h1>
		</div>	
	</div>
	<div class="row mb">
		<div class="col">
			<div class="row mb-2">
				<div class="col d-flex align-items-end">
					<span>총 <strong id="totalRecords">${pagination.totalRecords}</strong>건</span>
				</div>
				<div class="col-2">
					<select class="form-select">
						<option selected>최신등록일순</option>
						<option value="1">최신업데이트순</option>
						<option value="2">영화명순(ㄱ~Z)</option>
						<option value="3">개봉일순</option>
					</select>
				</div>
			</div>
			<table class="table" id="table-movie">
				<thead>
					<tr>
						<th class="col-4 text-center">영화명</th>
						<th class="col-4 text-center">영화명(영문)</th>
						<th class="col-1 text-center">영화코드</th>
						<th class="col-1 text-center">제작연도</th>
						<th class="col-1 text-center">개봉일</th>
						<th class="col-1"></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty movies }">
						<tr>
							<td class="text-center" colspan="7">등록된 영화가 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="movie" items="${movies }">
							<tr>
								<td class="text-start">${movie.title }</td>
								<td class="text-start">${movie.titleEn }</td>
								<td class="text-center">${movie.no }</td>
								<td class="text-center"><fmt:formatDate value="${movie.productionYear }" pattern="yyyy" /></td>
								<td class="text-center"><fmt:formatDate value="${movie.openDate }" pattern="yyyy-MM-dd"	/></td>
								<td class="text-end"><button class="btn btn-outline-primary btn-sm" data-movie-no="${movie.no }">상세정보</button></td>
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
						<a class="page-link" href="list?page=${pagination.prevPage }">이전</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="list?page=${num }">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
						<a class="page-link" href="list?page=${pagination.nextPage }">다음</a>
					</li>
				</ul>
			</nav>
		</c:if>		
		</div>
	</div>
	<div class="row mb-3 justify-content-center">
		<div class="col-5">
			<form class="" method="get" action="list" id="form-search-movie">
				<input type="hidden" name="page" value="1">
				<div class="input-group">
 					<select class="form-select" id="inputGroupSelect04">
					    <option value="" selected>영화명</option>
					    <option value="">영화명(영문)</option>
					    <option value="">영화코드</option>
  					</select>
  					<input type="text" class="form-control">
  					<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i> 검색</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 영화상세정보 모달 -->
	<div class="modal" tabindex="-1" id="modal-movie">
  		<div class="modal-dialog modal-xl">
    		<div class="modal-content">
    			<form id="form-update-book" method="post" enctype="multipart/form-data">
	    			<input type="hidden" name="no" value="">
    				<div id="modal-input-box"></div>
	      			<div class="modal-header">
	        			<h5 class="modal-title"><strong id="modal-title"></strong></h5>
	        			<div class="ms-2" id="modal-spinner-box"></div>
	        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      			</div>
	      			<div class="modal-body">
	        			<table class="table">
	        				<tr>
	        					<th>영화코드</th>
	        					<td colspan="3"><span id="modal-movie-code"></span></td>
	        				</tr>
	        				<tr>
	        					<th>영화명</th>
	        					<td colspan="3"><span id="modal-movie-name"></span></td>
	        				</tr>
	        				<tr>
	        					<th>영화명(영문)</th>
	        					<td colspan="3"><span id="modal-movie-name-en"></span></td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">제작연도</th>
	        					<td style="width: 35%;"><span id="modal-movie-production-year"></span></td>
	        					<th style="width: 10%;">상영시간</th>
	        					<td style="width: 55%;"><span id="modal-movie-show-time"></span>분</td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">개봉일</th>
	        					<td style="width: 35%;"><span id="modal-movie-open-date"></span></td>
	        					<th style="width: 10%;">장르</th>
	        					<td style="width: 55%;"><span id="modal-movie-genre"></span></td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">제작/배급사</th>
	        					<td style="width: 35%;"><span id="modal-movie-companys"></span></td>
	        					<th style="width: 10%;">관람등급</th>
	        					<td style="width: 55%;"><span id="modal-movie-watch-grade"></span></td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">감독</th>
	        					<td style="width: 35%;"><span id="modal-movie-directors"></span></td>
	        					<th style="width: 10%;">배우</th>
	        					<td style="width: 55%;"><span id="modal-movie-actors"></span></td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">등록일</th>
	        					<td style="width: 35%;"><span id="modal-movie-created-date"></span></td>
	        					<th style="width: 10%;">수정일</th>
	        					<td style="width: 55%;"><span id="modal-movie-updated-date"></span></td>
	        				</tr>
	        			</table>
		      			<div class="mb-3">
							<label class="form-label"><strong class="ms-2">시놉시스</strong></label>
							<textarea rows="10" class="form-control" name="summary"></textarea>
						</div>
		      			<div class="mb-3">
							<label class="form-label"><strong class="ms-2">영화포스터</strong></label>
							<input type="file" class="form-control d-none" name="images" multiple>
							<div id="image-box"></div>
							<div id="image-input-box" class="d-none"></div>
						</div>
						<div class="mb-3">
							<label class="form-label"><strong class="ms-2">트레일러</strong></label>
							<div id="trailer-box"></div>
							<div id="trailer-input-box" class="d-none"></div>
							<div class="input-group mb-2 d-none" id="input-open-trailer-modal">
							  	<input type="text" class="form-control" placeholder="제목" >
							  	<span class="input-group-text"><i class="bi bi-link"></i></span>
  								<input type="text" class="form-control" placeholder="동영상 URL">
  								<a class="btn btn-outline-primary"><i class="bi bi-plus-lg"></i></a>
							</div>
						</div>
	      			</div>
					<div class="modal-footer">
	    				<a class="btn btn-warning" id="btn-modify-movie">수정</a>
	    				<button type="button" class="btn btn-secondary d-none" data-bs-dismiss="modal" id="btn-modify-movie-cancel">취소</button>
	    				<button type="submit" class="btn btn-primary d-none" id="btn-update-movie">확인</button>
					</div>
				</form>
   			</div>
  		</div>
	</div>
	<!-- 트레일러 추가 모달 -->
	<div class="modal" tabindex="-1" id="modal-trailer">
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
	    		<div class="modal-header">
		       		<h5 class="modal-title"><strong>트레일러 추가</strong></h5>
		       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		    	</div>
		    	<div class="modal-body">
		    		<input type="text" class="form-control mb-2" name="trailerTitle" placeholder="제목" >
		    		<div class="input-group mb-2">
			    		<span class="input-group-text"><i class="bi bi-link"></i></span>
			      		<input type="url" class="form-control" name="trailerUrl" placeholder="동영상 URL">
		      		</div>
		      		<div class="" id="iframe-box"></div>
		      	</div>
				<div class="modal-footer">
		    		<button type="button" class="btn btn-primary" id="btn-add-trailer" data-bs-dismiss="modal">확인</button>
				</div>
   			</div>
  		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		/*
			영화 상세정보 모달
		*/
		var movieModal = new bootstrap.Modal(document.getElementById('modal-movie'), {
			keyboard: false
		});
		
		$("#table-movie tbody").on("click", ".btn", function() {
			var movieNo = $(this).attr("data-movie-no");
			getMovieDetail(movieNo);
			movieModal.show();
		});
		
		/*
			트레일러 추가 모달
		*/
		var trailerModal = new bootstrap.Modal(document.getElementById('modal-trailer'), {
			keyboard: false,
			backdrop: false
		});

		$("#input-open-trailer-modal").click(function() {
			$("#iframe-box").empty();
			$("#modal-trailer input").val("");
			$("#btn-add-trailer").prop("disabled", true);
			trailerModal.show();
		});
		
		$("#modal-trailer input[name=trailerTitle]").change(function() {
			if ($(this).val() != "" && $("#modal-trailer input[name=trailerUrl]").val() != "") {
				$("#btn-add-trailer").prop("disabled", false);
			} else {
				$("#btn-add-trailer").prop("disabled", true);
			}
		});
		
		$("#modal-trailer input[name=trailerUrl]").change(function() {
			$("#iframe-box").empty();
			var url = $(this).val().replace("watch?v=", "embed/");
			$(this).val(url);
			
			if (url != "") {
				var row = '<div class="ratio ratio-16x9 mt-3"><iframe src="' + url + '"></iframe></div>';
				$("#iframe-box").append(row);
				if ($("#modal-trailer input[name=trailerTitle]").val() != "") {
					$("#btn-add-trailer").prop("disabled", false);
				} else {
					$("#btn-add-trailer").prop("disabled", true);
				}
			} else {
				$("#btn-add-trailer").prop("disabled", true);
			}
		});
		
		$("#modal-trailer input[name=trailerTitle]").change(function() {
			if ($(this).val() != "" && $("#modal-trailer input[name=trailerUrl]").val() != "") {
				$("#btn-add-trailer").prop("disabled", false);
			} else {
				$("#btn-add-trailer").prop("disabled", true);
			}
		});
		
		$("#btn-add-trailer").click(function(event) {
			event.preventDefault();
			var title = $("#modal-trailer input[name=trailerTitle]").val();
			var url = $("#modal-trailer input[name=trailerUrl]").val();

			var row = '<div class="input-group mb-2">' 
				+ '<input type="text" class="form-control" name=trailerTitles value="' + title + '" readonly>'
				+ '<span class="input-group-text"><i class="bi bi-link"></i></span>'
				+ '<input type="url" class="form-control" name="trailerUrls" value="' + url + '" readonly>'
				+ '<a class="btn btn-outline-danger"><i class="bi bi-trash"></i></a></div>';

			$("#trailer-input-box").append(row);
		});
		
		// 수정 버튼 클릭시
		$("#btn-modify-movie").click(function() {
			$(this).addClass("d-none");
			$("#btn-modify-movie-cancel").removeClass("d-none");
			$("#btn-update-movie").removeClass("d-none");
			$("textarea[name=summary]").prop("readonly", false);
			$("input[name=images]").removeClass("d-none");
			$("#image-box").addClass("d-none");
			$("#image-input-box").removeClass("d-none");
			$("#trailer-box").addClass("d-none");
			$("#trailer-input-box").removeClass("d-none");
			$("#input-open-trailer-modal").removeClass("d-none");
		});
		
		// 이미지 삭제 버튼 클릭시
		$("#image-input-box").on("click", ".btn-outline-danger", function() {
			$(this).closest(".input-group").remove();
		});
		
		// 트레일러 삭제 버튼 클릭시
		$("#trailer-input-box").on("click", ".btn-outline-danger", function() {
			$(this).closest(".input-group").remove();
		});
		
		// 확인 버튼 클릭시
		$("#btn-update-movie").click(function(event) {
			event.preventDefault();
			updateMovieDetail();
		});
	});

	function getMovieDetail(movieNo) {
		var $modalInputBox = $("#modal-input-box");
		var $modalSpinnerBox = $("#modal-spinner-box");
		
		$.ajax({
			type: "get",
			url: "/rest/admin/movie/detail",
			data: {
				movieNo: movieNo
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-sm" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$modalSpinnerBox.append(row);
			},
			success: function(movie) {
				$modalSpinnerBox.empty();
				
				$("#modal-title").text(movie.title + "(" + movie.titleEn + ")");
				$("#modal-movie-code").text(movie.no);
				$("#modal-movie-name").text(movie.title);
				$("#modal-movie-name-en").text(movie.titleEn);
				$("#modal-movie-production-year").text(moment(movie.productionYear).format('YYYY'));
				$("#modal-movie-show-time").text(movie.runtime);
				if (movie.openDate != null) {
					$("#modal-movie-open-date").text(moment(movie.openDate).format('YYYY-MM-DD'));
				}
				$("#modal-movie-genre").text(movie.genres.map(item => item.genreName).join(', '));
				$("#modal-movie-watch-grade").text(movie.rate);
				$("#modal-movie-directors").text(movie.directors.map(item => item.directorName).join(', '));
				$("#modal-movie-actors").text(movie.actors.map(item => item.actorName).filter((item, index) => index < 5).join(', '));
				$("#modal-movie-companys").text(movie.producer);
				if (movie.createdDate != null) {
					$("#modal-movie-created-date").text(moment(movie.createdDate).format('YYYY-MM-DD'));
				}
				if (movie.updatedDate != null) {
					$("#modal-movie-updated-date").text(moment(movie.updatedDate).format('YYYY-MM-DD'));
				}
				
				$("input[name=no]").val(movie.no);
				$("textarea[name=summary]").val(movie.summary).prop("readonly", true);
				for (var i = 0; i < movie.images.length; i++) {
					var img = '<img src="' + '/resources/images/movie/' + movie.images[i].filename + '" class="img-thumbnail me-1" style="width: 175px; height: 250px;">';
					var row = '<div class="input-group my-2">' 
						+ '<input type="text" class="form-control" name=filenames value="' + movie.images[i].filename + '" readonly>'
						+ '<a class="btn btn-outline-danger"><i class="bi bi-trash"></i></a></div>';
					$("#image-box").append(img);
					$("#image-input-box").append(row);
				}
				for (var i = 0; i < movie.trailers.length; i++) {
					var trailer = '<iframe src="' + movie.trailers[i].urlAddress + '" class="me-1" style="width: 350px; height: 250px;"></iframe>';
					var row = '<div class="input-group mb-2">' 
						+ '<input type="text" class="form-control" name=trailerTitles value="' + movie.trailers[i].title + '" readonly>'
						+ '<span class="input-group-text"><i class="bi bi-link"></i></span>'
						+ '<input type="url" class="form-control" name="trailerUrls" value="' + movie.trailers[i].urlAddress + '" readonly>'
						+ '<a class="btn btn-outline-danger"><i class="bi bi-trash"></i></a></div>';
					$("#trailer-box").append(trailer);
					$("#trailer-input-box").append(row);
				}
			},
			error: function() {
				$modalSpinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function updateMovieDetail() {
		var form = $("#form-update-book")[0];
		var data = new FormData(form);
		
		$.ajax({
			type: "post",
			enctype: "multipart/form-data",
			url: "/rest/admin/movie/update",
			data: data,
			processData: false,
			contentType: false,
	        cache: false,
	        timeout: 600000,
            success: function(response) {
            	if (response.status == "OK") {
	            	var no = response.item[0];
	            	alert("영화코드: [" + no + "] 가 성공적으로 업데이트 되었습니다.");
	            	$("#modal-movie").modal("toggle");
            	} else {
            		alert(response.error);
            		$("#modal-movie").modal("toggle");
            	}
            }, 
            error: function() {
            	alert("오류가 발생하였습니다.");
            }
		});
	}

	var myModalEl = document.getElementById("modal-movie");
	myModalEl.addEventListener("hide.bs.modal", function(event) {
		$("#modal-input-box").empty();
		$("#modal-title").empty();
		$("#modal-movie-code").empty();
		$("#modal-movie-name").empty();
		$("#modal-movie-name-en").empty();
		$("#modal-movie-production-year").empty();
		$("#modal-movie-show-time").empty();
		$("#modal-movie-open-date").empty();
		$("#modal-movie-genre").empty();
		$("#modal-movie-watch-grade").empty();
		$("#modal-movie-directors").empty();
		$("#modal-movie-actors").empty();
		$("#modal-movie-companys").empty();
		$("textarea[name=summary]").val("");
		$("input[name=images]").val("");
		$("#image-box").empty();
		$("#image-input-box").empty();
		$("#trailer-box").empty();
		$("#trailer-input-box").empty();
		
		$("#btn-modify-movie").removeClass("d-none");
		$("#btn-modify-movie-cancel").addClass("d-none");
		$("#btn-update-movie").addClass("d-none");
		$("textarea[name=summary]").prop("readonly", true);
		$("input[name=images]").addClass("d-none");
		$("#image-box").removeClass("d-none");
		$("#image-input-box").addClass("d-none");
		$("#trailer-box").removeClass("d-none");
		$("#trailer-input-box").addClass("d-none");
		$("#input-open-trailer-modal").addClass("d-none");
	});
</script>
</body>
</html>