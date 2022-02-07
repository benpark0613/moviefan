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
	<style type="text/css">
		.list-group {
		    max-height: 500px !important;
		    overflow-y: auto !important;
		}
		.list-group-item.active, .btn.active {
			color: #fff !important;
    		background-color: #212529 !important;
		}
		.btn:focus {
		 	outline: none !important;
			box-shadow: none !important;
		}
		.btn {
			transition: none !important;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row my-3">
		<div class="col-12">
			<h1>영화선택</h1>
		</div>
	</div>
	<div class="row">
		<table class="table table-bordered mb-0">
			<thead>
				<tr>
					<th class="col-3 bg-dark text-center text-white border-start-0">영화</th>
					<th class="col-4 bg-dark text-center text-white" colspan="2">극장</th>
					<th class="col-1 bg-dark text-center text-white">날짜</th>
					<th class="col-4 bg-dark text-center text-white border-end-0">시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:choose>
					<c:when test="${empty movies }">
						<td class="col-3 bg-light border-start-0 align-middle text-center">
							<span>상영중인 영화가 없습니다.</span>
						</td>
					</c:when>
					<c:otherwise>
						<td class="col-3 bg-light border-start-0">
							<div class="list-group rounded-0" id="">
								<c:forEach var="movie" items="${movies }" varStatus="loop">
									<a class="list-group-item list-group-item-action bg-light border-light d-flex align-items-center" id="" data-bs-toggle="list" href="#">
										<c:choose>
											<c:when test="${movie.rate == '전체관람가' }"><span class="badge bg-success rounded-pill me-1">전체</span></c:when>
											<c:when test="${movie.rate == '12세이상관람가' }"><span class="badge bg-primary rounded-pill me-1">12</span></c:when>
											<c:when test="${movie.rate == '15세이상관람가' }"><span class="badge bg-warning rounded-pill me-1">15</span></c:when>
											<c:when test="${movie.rate == '청소년관람불가' }"><span class="badge bg-danger rounded-pill me-1">청불</span></c:when>
										</c:choose>
										${movie.title }
									</a>
								</c:forEach>
							</div>
						</td>
					</c:otherwise>
					</c:choose>
					<td class="col-2 bg-light pe-0 border-end-0">
						<div class="list-group rounded-0" id="">
							<c:forEach var="city" items="${cities }" varStatus="loop">
								<c:if test="${loop.count == 1 }">
									<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light active" id="" data-bs-toggle="list" href="#">${city.name }(${fn:length(city.cinemas)})</a>
								</c:if>
								<c:if test="${loop.count != 1 }">
									<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">${city.name }(${fn:length(city.cinemas)})</a>
								</c:if>
							</c:forEach>
						</div>
					</td>
					<td class="col-2 bg-light ps-0 border-start-0">
						<div class="list-group rounded-0" id="">
							<c:forEach var="city" items="${cities }" varStatus="loop">
								<c:forEach var="cinema" items="${city.cinemas }">
									<c:if test="${loop.count == 1 }">
										<c:set var = "name" value = "${cinema.name }"/>
										<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">${fn:replace(name, 'MVF ', '')}</a>
									</c:if>
									<c:if test="${loop.count != 1 }">
										<c:set var = "name" value = "${cinema.name }"/>
										<a class="list-group-item list-group-item-action bg-light border-light d-none" id="" data-bs-toggle="list" href="#">${fn:replace(name, 'MVF ', '')}</a>
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
					</td>
					<td class="col-1 bg-light">
						<div class="list-group rounded-0" id="">
							
						
							<!-- <a class="list-group-item list-group-item-action bg-light border-light text-center disabled" id="" data-bs-toggle="list" href="#">
								<span>2022</span>
								<span>1월</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>금</span>
								<span>21</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>토</span>
								<span>22</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>일</span>
								<span>23</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>월</span>
								<span>24</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>화</span>
								<span>25</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>수</span>
								<span>26</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>목</span>
								<span>27</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>금</span>
								<span>28</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>토</span>
								<span>29</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>일</span>
								<span>30</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>월</span>
								<span>31</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center disabled" id="" data-bs-toggle="list" href="#">
								<span>2022</span>
								<span>2월</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>화</span>
								<span>1</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>수</span>
								<span>2</span>
							</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#">
								<span>목</span>
								<span>3</span>
							</a> -->
						</div>
					</td>
					<td class="col-4 bg-light border-end-0">
						<div class="py-2">
							<p>2D(라스트 특가)5관(Laser) 10층(총172석)</p>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
						</div>
						<div class="py-2">
							<p>2D(라스트 특가)5관(Laser) 10층(총172석)</p>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
							<a class="btn bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="button" href="#">09:00</a><span class="align-middle" style="display: inline-block; width: 70px;">155석</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3">영화선택</span>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3">극장선택</span>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-lg disabled" href="/ticket/seat" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>
			</div>
		</div>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col-1 d-flex justify-content-center align-items-center">
				<img src="/resources/images/84949_185.jpg" style="width: 74px; height:104px;">
			</div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block"><strong>스파이더맨-노웨이홈</strong></span>
					<span class="d-block"><strong>2D(라스트특가)</strong></span>
					<span class="d-block"><strong>12세 관람가</strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col-3 d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block"><span style="display: inline-block; width: 70px;">극장</span><strong>CGV 강남</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">일시</span><strong>2022.1.24(월) 18:00</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">상영관</span><strong>5관(Laser) 10층</strong></span>
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong></strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택 <i class="bi bi-chevron-right"></i> 결제</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-danger btn-lg" href="/ticket/seat"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>좌석선택</strong></a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		
		
		
		
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>