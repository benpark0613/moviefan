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
			<h1>영화등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<form class="border-top border-bottom">
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
		 						<select class="form-select">
								  <option selected>-전체-</option>
								  <option value="1">1922</option>
								  <option value="2">1923</option>
								  <option value="3">1924</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
		 						<select class="form-select">
								  <option selected>-전체-</option>
								  <option value="1">1922</option>
								  <option value="2">1923</option>
								  <option value="3">1924</option>
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
		 						<input type="text" class="form-control">
 							</div>
 						</div>
 						<div class="row g-0 align-items-center">
 							<div class="col-2">
			 					<label><strong>제작연도</strong></label>
 							</div>
 							<div class="col-4">
 								<select class="form-select">
								  <option selected>-전체-</option>
								  <option value="1">1922</option>
								  <option value="2">1923</option>
								  <option value="3">1924</option>
								</select>
 							</div>
 							<span class="col-1 text-center">~</span>
 							<div class="col-4">
 								<select class="form-select">
								  <option selected>-전체-</option>
								  <option value="1">1922</option>
								  <option value="2">1923</option>
								  <option value="3">1924</option>
								</select>
 							</div>
 						</div>
 					</div>
 					<div class="col-2 d-flex align-items-center">
 						<button class="btn btn-primary btn-lg me-1 fs-6" style="width: 85px;" id="btn-get-movie">조회</button>
 						<button class="btn btn-secondary btn-lg fs-6" style="width: 85px;">초기화</button>
 					</div>
 				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="row">
				<span class="text-start">총 <strong id="strong-total-count">0</strong>건</span>
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
						<td class="text-center" colspan="7">등록할 영화를 조회하세요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
	// 조회버튼을 클릭할 때 실행되는 이벤트핸들러 메소드 등록
	$("#btn-get-movie").click(function(event) {
		// 버튼을 클릭했을 때 폼이 제출되는 기본동작의 실행을 취소시킨다.
		event.preventDefault();
		var $strong = $("#strong-total-count").empty();
		// 테이블의 tbody를 선택하고, tbody안을 비우고, 반환되는 jQuery집합객체를 $tbody에 저장한다.
		var $tbody = $("#table-movie tbody").empty();
		
		var movieName = $("input[name=movie-name]").val();
		
		$.ajax({
			type: "get",
			url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json",
			data: {key: "e8b10fb1808ddda8683a3f66f734a149", curPage: "1", itemPerPage: "10", movieNm: movieName},
			dataType: "json",
			success: function(result) {
				var totalCount = result.movieListResult.totCnt;
				$strong.append(totalCount);
				var movieList = result.movieListResult.movieList;
				
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
					
					row += '<td class="text-center">' + moment(movie.openDt).format('YYYY-MM-DD') + '</td>';
					
					row += '<td class="text-center">' + movie.genreAlt + '</td>';
					if (movie.directors.length == 0) {
						row += '<td class="text-center"></td>';
					} else {
						row += '<td class="text-center">' + movie.directors[0].peopleNm + '</td>';
					}
					row += '<td class="text-center"><button class="btn btn-outline-primary btn-sm">등록</button></td>';
					$tbody.append(row);
				});
			},
			error: function() {
				alert("오류가 발생하였습니다.");
			}
		});
	});
</script>
</html>