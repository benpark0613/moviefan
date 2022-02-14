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
<div class="d-flex justify-content-center align-items-center d-none" id="overlay">
	<div class="spinner-border text-light" style="width: 15rem; height: 15rem; border: 1em solid; border-right-color: transparent;">
		<span class="visually-hidden">Loading...</span>
	</div>
</div>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>영화검색/등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<form class="border-top border-bottom" id="form-search-movie">
				<input type="hidden" name="current-page" value="1">
 				<div class="row py-5">
 					<div class="col-5">
 						<div class="row g-0 align-items-center mb-2">
 							<div class="col-2">
			 					<label><strong>영화명</strong></label>
 							</div>
 							<div class="col-9">
		 						<input type="text" class="form-control" name="movie-name">
 							</div>
 						</div>
 						<div class="row g-0 align-items-center">
 							<div class="col-2">
			 					<label><strong>제작연도</strong></label>
 							</div>
 							<div class="col-4">
		 						<select class="form-select" name="production-year-from">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
		 						<select class="form-select" name="production-year-to">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 						</div>
 					</div>
 					<div class="col-5">
 						<div class="row g-0 align-items-center mb-2">
 							<div class="col-2">
			 					<label><strong>감독명</strong></label>
 							</div>
 							<div class="col-9">
		 						<input type="text" class="form-control" name="director-name">
 							</div>
 						</div>
 						<div class="row g-0 align-items-center">
 							<div class="col-2">
			 					<label><strong>개봉연도</strong></label>
 							</div>
 							<div class="col-4">
 								<select class="form-select" name="open-year-from">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
 								<select class="form-select" name="open-year-to">
								  <option value="" selected>--전체--</option>
								</select>
 							</div>
 						</div>
 					</div>
 					<div class="col-2 d-flex align-items-center">
 						<button class="btn btn-primary btn-lg me-1 fs-6" style="width: 85px;" id="btn-search-movie">조회</button>
 						<button class="btn btn-secondary btn-lg fs-6" style="width: 85px;" id="btn-clear-form">초기화</button>
 					</div>
 				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="row">
				<span>총 <strong id="totalRecords">0</strong>건</span>
			</div>
			<table class="table" id="table-movie">
				<thead>
					<tr>
						<th class="col-3 text-center">영화명</th>
						<th class="col-3 text-center">영화명(영문)</th>
						<th class="col-1 text-center">제작연도</th>
						<th class="col-1 text-center">개봉일</th>
						<th class="col-1 text-center">장르</th>
						<th class="col-2 text-center">감독</th>
						<th class="col-1 text-center"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="7">등록할 영화를 검색하세요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이지네이션 -->
	<div class="row mb-3">
		<div class="col" id="pagination">
		</div>
	</div>
	<!-- 영화등록 폼 모달 -->
	<div class="modal" tabindex="-1" id="modal-movie">
  		<div class="modal-dialog modal-xl">
    		<div class="modal-content">
    			<form id="form-insert-book" method="post" enctype="multipart/form-data">
	    			<input type="hidden" name="no" value="">
	    			<input type="hidden" name="title" value="">
	    			<input type="hidden" name="titleEn" value="">
	    			<input type="hidden" name="rate" value="">
	    			<input type="hidden" name="runtime" value="">
	    			<input type="hidden" name="openDate" value="">
	    			<input type="hidden" name="productionYear" value="">
	    			<input type="hidden" name="producer" value="">
    				<div id="modal-input-box"></div>
	      			<div class="modal-header">
	        			<h5 class="modal-title"><strong>다음 영화를 등록하시겠습니까?</strong></h5>
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
	        					<th style="width: 10%;">제작상태</th>
	        					<td style="width: 55%;"><span id="modal-movie-production-status"></span></td>
	        				</tr>
	        				<tr>
	        					<th style="width: 10%;">장르</th>
	        					<td style="width: 35%;"><span id="modal-movie-genre"></span></td>
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
	        					<th><span>제작/배급사</span></th>
	        					<td colspan="3"><span id="modal-movie-companys"></span></td>
	        				</tr>
	        			</table>
		      			<div class="mb-3">
							<label class="form-label"><strong class="ms-2">시놉시스</strong></label>
							<textarea rows="10" class="form-control" name="summary"></textarea>
						</div>
		      			<div class="mb-3">
							<label class="form-label"><strong class="ms-2">영화포스터</strong></label>
							<input type="file" class="form-control" name="images" multiple>
						</div>
						<div class="mb-3">
							<label class="form-label"><strong class="ms-2">트레일러</strong></label>
							<div id="trailer-box"></div>
							<div class="input-group mb-2" id="input-open-trailer-modal">
							  	<input type="text" class="form-control" placeholder="제목" >
							  	<span class="input-group-text"><i class="bi bi-link"></i></span>
  								<input type="text" class="form-control" placeholder="동영상 URL">
  								<a class="btn btn-outline-primary"><i class="bi bi-plus-lg"></i></a>
							</div>
						</div>
	      			</div>
					<div class="modal-footer">
	    				<!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
	    				<button type="submit" class="btn btn-primary" id="btn-insert-movie">확인</button>
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
		var $selectProductionYearFrom = $("select[name=production-year-from]");
		var $selectProductionYearTo = $("select[name=production-year-to]");
		var $selectOpenYearFrom = $("select[name=open-year-from]");
		var $selectOpenYearTo = $("select[name=open-year-to]");
		var currentYear = moment().year();
	
		for (var i = 0; i < 100; i++) {
			var row = '<option value=' + (currentYear - i) + '>'
					+ (currentYear - i) + '</option>';
			$selectProductionYearFrom.append(row);
			$selectProductionYearTo.append(row);
			$selectOpenYearFrom.append(row);
			$selectOpenYearTo.append(row);
		}
		
		$("select[name=production-year-from]").change(function(event) {
			var productionYearFrom = $("select[name=production-year-from]").val();
			var productionYearTo = $("select[name=production-year-to]").val();
			
			if (productionYearTo !== "") {
				if (productionYearFrom > productionYearTo) {
					$("select[name=production-year-from]").val(productionYearTo).change();
				}
			}
		});
		
		$("select[name=production-year-to]").change(function(event) {
			var productionYearFrom = $("select[name=production-year-from]").val();
			var productionYearTo = $("select[name=production-year-to]").val();
			
			if (productionYearFrom !== "") {
				if (productionYearFrom > productionYearTo) {
					$("select[name=production-year-from]").val(productionYearTo).change();
				}
			}
		});

		$("select[name=open-year-from]").change(function(event) {
			var openYearFrom = $("select[name=open-year-from]").val();
			var openYearTo = $("select[name=open-year-to]").val();
			
			if (openYearTo !== "") {
				if (openYearFrom > openYearTo) {
					$("select[name=open-year-from]").val(openYearTo).change();
				}
			}
		});
		
		$("select[name=open-year-to]").change(function(event) {
			var openYearFrom = $("select[name=open-year-from]").val();
			var openYearTo = $("select[name=open-year-to]").val();
			
			if (openYearTo !== "") {
				if (openYearFrom > openYearTo) {
					$("select[name=open-year-from]").val(openYearTo).change();
				}
			}
		});
		
		$("#btn-search-movie").click(function(event) {
			event.preventDefault();
			$("input[name=current-page]").val("1");
			getMovieList();
		});
		
		$("#btn-clear-form").click(function(event) {
			event.preventDefault();
			$("#form-search-movie input").val("");
			$("#form-search-movie select").val("").change();
		});
		
		var movieModal = new bootstrap.Modal(document.getElementById('modal-movie'), {
			keyboard: false
		});
		
		var trailerModal = new bootstrap.Modal(document.getElementById('modal-trailer'), {
			keyboard: false,
			backdrop: false
		});
		
		$("#table-movie tbody").on("click", ".btn", function() {
			var movieCode = $(this).attr("data-movie-code");
			getMovieDetail(movieCode);
			movieModal.show();
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
		
		$("#btn-add-trailer").click(function(event) {
			event.preventDefault();
			var title = $("#modal-trailer input[name=trailerTitle]").val();
			var url = $("#modal-trailer input[name=trailerUrl]").val();

			var row = '<div class="input-group mb-2">' 
				+ '<input type="text" class="form-control" name=trailerTitles value="' + title + '" readonly>'
				+ '<span class="input-group-text"><i class="bi bi-link"></i></span>'
				+ '<input type="url" class="form-control" name="trailerUrls" value="' + url + '" readonly>'
				+ '<a class="btn btn-outline-danger"><i class="bi bi-trash"></i></a></div>';

			$("#trailer-box").append(row);
		});
		
		
		$("#trailer-box").on("click", ".btn-outline-danger", function() {
			$(this).closest(".input-group").remove();
		});
		
		$("#btn-insert-movie").click(function(event) {
			event.preventDefault();
			insertMovie();
		});
		
	});
	
	function getMovieList() {
		var $totalRecords = $("#totalRecords");
		var $tbody = $("#table-movie tbody").empty();
		var currentPage = $("input[name=current-page]").val();
		var movieName = $("input[name=movie-name]").val();
		var directorName = $("input[name=director-name]").val();
		var productionYearFrom = $("select[name=production-year-from]").val();
		var productionYearTo = $("select[name=production-year-to]").val();
		var openYearFrom = $("select[name=open-year-from]").val();
		var openYearTo = $("select[name=open-year-to]").val();
		var rowsPerPage = 10;
		
		$.ajax({
			type: "get",
			url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json",
			data: {
				key: "e8b10fb1808ddda8683a3f66f734a149", 
				curPage: currentPage, 
				itemPerPage: rowsPerPage, 
				movieNm: movieName, 
				directorNm: directorName,
				prdtStartYear: productionYearFrom,
				prdtEndYear: productionYearTo,
				openStartDt: openYearFrom,
				openEndDt: openYearTo 
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<tr>' 
					+ '<td class="text-center" colspan="7">'
					+ '<div class="spinner-border spinner-border-sm" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>'
					+ '</td>'
					+ '</tr>';
				$tbody.append(row);
			},
			success: function(result) {
				$totalRecords.empty();
				$tbody.empty();
				var totalRecords = parseInt(result.movieListResult.totCnt);
				$totalRecords.append(totalRecords.toLocaleString());
				var movieList = result.movieListResult.movieList;
				
				if (movieList.length == 0) {
					var row = '<tr>'
						+ '<td class="text-center" colspan="7">검색된 데이터가 존재하지 않습니다.</td>'
						+ '</tr>';
					$tbody.append(row);
				} else {
					$.each(movieList, function(index, movie) {
						var row = '<tr>';
						if (movie.movieNm.length > 25) {
							row += '<td class="text-start">' + movie.movieNm.substring(0, 25).concat("...") + '</td>';
						} else {
							row += '<td class="text-start">' + movie.movieNm + '</td>';
						}
						if (movie.movieNmEn.length > 45) {
							row += '<td class="text-start">' + movie.movieNmEn.substring(0, 35).concat("...") + '</td>';
						} else {
							row += '<td class="text-start">' + movie.movieNmEn + '</td>';
						}
						row += '<td class="text-center">' + movie.prdtYear + '</td>';
						
						if (movie.openDt.length == 0) {
							row += '<td class="text-center"></td>';
						} else {
							row += '<td class="text-center">' + moment(movie.openDt).format('YYYY-MM-DD') + '</td>';
						}
						
						row += '<td class="text-center">' + movie.genreAlt + '</td>';
						if (movie.directors.length == 0) {
							row += '<td class="text-center"></td>';
						} else {
							row += '<td class="text-center">' + movie.directors[0].peopleNm + '</td>';
						}
						row += '<td class="text-center">';
						row += '<button class="btn btn-outline-primary btn-sm" data-movie-code=' + movie.movieCd + '>등록</button>';
						row += '</td>';
						
						$tbody.append(row);
						pagination(currentPage, totalRecords, rowsPerPage);
					});
				}
			},
			error: function() {
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function getMovieDetail(movieCode) {
		var $modalInputBox = $("#modal-input-box").empty();
		var $modalSpinnerBox = $("#modal-spinner-box");
		
		$.ajax({
			type: "get",
			url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",
			data: {
				key: "f5eef3421c602c6cb7ea224104795888",
				movieCd: movieCode
			},
			dataType: "json",
			beforeSend: function() {
				var row = '<div class="spinner-border spinner-border-sm" role="status">'
					+ '<span class="visually-hidden">Loading...</span>'
					+ '</div>';
				$modalSpinnerBox.append(row);
			},
			success: function(result) {
				$modalSpinnerBox.empty();
				var movie = result.movieInfoResult.movieInfo;
				
				$("#modal-movie-code").text(movie.movieCd);
				$("#modal-movie-name").text(movie.movieNm);
				$("#modal-movie-name-en").text(movie.movieNmEn);
				$("#modal-movie-production-year").text(movie.prdtYear);
				$("#modal-movie-show-time").text(movie.showTm);
				if (movie.openDt != "") {
					$("#modal-movie-open-date").text(moment(movie.openDt).format('YYYY-MM-DD'));
				}
				$("#modal-movie-production-status").text(movie.prdtStatNm);			
				$("#modal-movie-genre").text(movie.genres.map(item => item.genreNm).join(', '));
				$("#modal-movie-watch-grade").text(movie.audits.map(item => item.watchGradeNm).join(', '));
				$("#modal-movie-directors").text(movie.directors.map(item => item.peopleNm).join(', '));
				$("#modal-movie-actors").text(movie.actors.map(item => item.peopleNm).filter((item, index) => index < 5).join(', '));
				$("#modal-movie-companys").text(movie.companys.map(item => item.companyNm + "("+item.companyPartNm+")").join(', '));
				
				$("input[name=no]").val(movie.movieCd);
				$("input[name=title]").val(movie.movieNm);
				$("input[name=titleEn]").val(movie.movieNmEn);
				if (movie.audits.length > 0) {
					$("input[name=rate]").val(movie.audits[0].watchGradeNm);
				}
				$("input[name=runtime]").val(movie.showTm);
				if (movie.openDt != "") {
					$("input[name=openDate]").val(moment(movie.openDt).format('YYYY-MM-DD'));
				}
				if (movie.prdtYear != "") {
					$("input[name=productionYear]").val(movie.prdtYear);
				}
				if (movie.companys.length > 0 ) {
					$("input[name=producer]").val(movie.companys[0].companyNm);
				}
				for (var i = 0; i < movie.genres.length; i++) {
					var row = '<input type="hidden" name="genres" value="' + movie.genres[i].genreNm + '">';
					$modalInputBox.append(row);
				}
				for (var i = 0; i < movie.directors.length; i++) {
					var row = '<input type="hidden" name="directors" value="' + movie.directors[i].peopleNm + '">';
					$modalInputBox.append(row);
				}
				for (var i = 0; i < movie.actors.length; i++) {
					var row = '<input type="hidden" name="actors" value="' + movie.actors[i].peopleNm + '">';
					$modalInputBox.append(row);
				}
			},
			error: function() {
				$modalSpinnerBox.empty();
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function insertMovie() {
		var form = $("#form-insert-book")[0];
		var data = new FormData(form);
		
		$.ajax({
			type: "post",
			enctype: "multipart/form-data",
			url: "/rest/admin/movie/insert",
			data: data,
			processData: false,
			contentType: false,
	        cache: false,
	        timeout: 600000,
	        beforeSend: function() {
				$("#overlay").removeClass("d-none");
			},
            success: function(response) {
            	$("#overlay").addClass("d-none");
            	if (response.status == "OK") {
	            	var no = response.item[0];
	            	alert("영화코드: [" + no + "] 가 성공적으로 등록 되었습니다.");
	            	$("#modal-movie").modal("toggle");
            	} else {
            		alert(response.error);
            		$("#modal-movie").modal("toggle");
            	}
            }, 
            error: function() {
            	$("#overlay").addClass("d-none");
            	alert("오류가 발생하였습니다.");
            }
		});
	}
	
	function pagination(currentPage, totalRecords, rowsPerPage) {
		var $pagination = $("#pagination").empty();
		if (totalRecords > 0) {
			var pagesPerBlock = 5;
			var totalPages = Math.ceil(totalRecords / rowsPerPage);
			var totalBlocks = Math.ceil(totalPages / pagesPerBlock);
			
			if (currentPage <= 0) {
				currentPage = 1;
			}
			
			if (currentPage > totalPages) {
				currentPage = totalPages;
			}
			
			var beginRow = (currentPage - 1) * rowsPerPage + 1;
			var endRow = currentPage * rowsPerPage;
			var currentBlock = Math.ceil(currentPage / pagesPerBlock);
			var beginPage = (currentBlock - 1) * pagesPerBlock + 1;
			var endPage = currentBlock * pagesPerBlock;
			var prevPage;
			var nextPage;
			var isExistPrevBlock;
			var isExistNextBlock;
			
			if (currentBlock == totalBlocks) {
				endPage = totalPages;
			}
			
			if (currentBlock > 1) {
				prevPage = (currentBlock - 1) * pagesPerBlock;
			}
			
			if (currentBlock < totalBlocks) {
				nextPage = currentBlock * pagesPerBlock + 1;
			}
			
			if (totalBlocks == 1) {
				isExistPrevBlock = false;
			} else if (currentBlock == 1) {
				isExistPrevBlock = false;
			} else {
				isExistPrevBlock = true;
			}
			
			if (totalBlocks == 1) {
				isExistNextBlock = false;
			} else if (currentBlock == totalBlocks) {
				isExistNextBlock = false;
			} else {
				isExistNextBlock = true;
			}
	
			var nav = '<nav>' 
				+ '<ul class="pagination justify-content-center">';
			if (isExistPrevBlock) {
				nav += '<li class="page-item">';
			} else {
				nav += '<li class="page-item disabled">';
			}
			nav += '<a class="page-link" href="#" data-page-number=' + prevPage + '>이전</a>';
			nav	+= '</li>';
			
			for (var i = beginPage; i <= endPage; i++) {
				if (i == currentPage) {
					nav += '<li class="page-item active">';
				} else {
					nav += '<li class="page-item">';
				}
				nav += '<a class="page-link" href="#" data-page-number=' + i + '>';
				nav += i;
				nav += '</a>';
				nav += '</li>';
			}
			
			if (isExistNextBlock) {
				nav += '<li class="page-item">';
			} else {
				nav += '<li class="page-item disabled">';
			}
			nav += '<a class="page-link" href="#" data-page-number=' + nextPage + '>다음</a>';
			nav	+= '</li>';
			nav += '</ul>';
			nav += '</nav>';
			
			$pagination.append(nav);
			
			$("#pagination a").click(function(event) {
				event.preventDefault();
				var pageNo = $(this).attr("data-page-number");
				$("input[name=current-page]").val(pageNo);
				getMovieList(pageNo);
			});
		}
	} 
	
	var myModalEl = document.getElementById("modal-movie");
	myModalEl.addEventListener("hide.bs.modal", function(event) {
		$("#modal-movie-code").empty();
		$("#modal-movie-name").empty();
		$("#modal-movie-name-en").empty();
		$("#modal-movie-production-year").empty();
		$("#modal-movie-show-time").empty();
		$("#modal-movie-open-date").empty();
		$("#modal-movie-production-status").empty();
		$("#modal-movie-genre").empty();
		$("#modal-movie-watch-grade").empty();
		$("#modal-movie-directors").empty();
		$("#modal-movie-actors").empty();
		$("#modal-movie-companys").empty();
		$("textarea[name=summary]").val("");
		$("input[name=images]").val("");
		$("#trailer-box").empty();
	});
</script>
</body>
</html>