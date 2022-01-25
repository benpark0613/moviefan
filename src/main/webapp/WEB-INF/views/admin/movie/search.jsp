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
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col">
			<h1>영화검색</h1>
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
				<span class="text-start">총 <strong id="totalRecords">0</strong>건</span>
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
	<div class="row mb-3">
		<div class="col" id="pagination">
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
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
	});
	
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
				openEndDt: openYearTo },
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
						row += '<td class="text-center"><a href="form" class="btn btn-outline-primary btn-sm">등록</a></td>';
						
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
			nav += '<a class="page-link" href="#" id=' + prevPage + '>이전</a>';
			nav	+= '</li>';
			
			for (var i = beginPage; i <= endPage; i++) {
				if (i == currentPage) {
					nav += '<li class="page-item active">';
				} else {
					nav += '<li class="page-item">';
				}
				nav += '<a class="page-link" href="#" id=' + i + '>';
				nav += i;
				nav += '</a>';
				nav += '</li>';
			}
			
			if (isExistNextBlock) {
				nav += '<li class="page-item">';
			} else {
				nav += '<li class="page-item disabled">';
			}
			nav += '<a class="page-link" href="#" id=' + nextPage + '>다음</a>';
			nav	+= '</li>';
			nav += '</ul>';
			nav += '</nav>';
			
			$pagination.append(nav);
			
			$("#pagination a").click(function(event) {
				event.preventDefault();
				var pageNo = $(this).attr("id");
				$("input[name=current-page]").val(pageNo);
				getMovieList(pageNo);
			});
		}
	} 
</script>
</html>