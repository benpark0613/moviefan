<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		.list-group {
		    max-height: 500px;
		    overflow-y: auto;
		}
		.list-group-item.active{
    		background-color: #333 !important;
		}
		.btn.active {
			background-color: #333 !important;
		}
		th {
			background-color: #333 !important;
		}
		* {
		 	border-radius: 0 !important;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mt-3 mb-3">
		<h1>영화선택</h1>
	</div>
	<div class="row mb-3">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-3 text-center text-white border-start-0">영화</th>
					<th class="col-4 text-center text-white" colspan="2">극장</th>
					<th class="col-1 text-center text-white">날짜</th>
					<th class="col-4 text-center text-white border-end-0">시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-3 bg-light border-start-0">
						<div class="list-group" id="">
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 스파이더맨-노웨이홈</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 해적-도깨비깃발</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 킹메이커</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 특송</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-success rounded-pill">전체</span> 씽2게더</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 어나더라운드</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-success rounded-pill">전체</span> 장민호드라마최종회</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 하우스오브구찌</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-success rounded-pill">전체</span> 비욘드라이브더무비:엔시티레조넌스</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 경관의피</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 웨스트사이드스토리</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 블루버스데이</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-success rounded-pill">전체</span> 러브레터</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 청춘적니</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-danger rounded-pill">청불</span> 킹스맨-퍼스트에이전트</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 드라이브마이카</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-warning rounded-pill">15</span> 도쿄리벤저스</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 극장판소드아트온라인-프로그레시브-별없는밤의아리아</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#"><span class="badge bg-primary rounded-pill">12</span> 프랑스</a>
						</div>
					</td>
					<td class="col-2 bg-light pe-0 border-end-0">
						<div class="list-group" id="">
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">서울(30)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">경기(53)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">인천(11)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">강원(3)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">대전/충청(23)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">대구(8)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">부산/울산(17)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">경상(16)</a>
							<a class="list-group-item list-group-item-action bg-secondary bg-opacity-10 border-light" id="" data-bs-toggle="list" href="#">광주/전라/제주(24)</a>
						</div>
					</td>
					<td class="col-2 bg-light ps-0 border-start-0">
						<div class="list-group" id="">
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">강남</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">강변</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">건대입구</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">구로</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">대학로</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">동대문</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">등촌</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">명동</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">명동역 씨네라이브러리</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">목동</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">미아</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">불광</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">상봉</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">성신여대입구</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">송파</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">수유</a>
							<a class="list-group-item list-group-item-action bg-light border-light" id="" data-bs-toggle="list" href="#">신촌아트레온</a>
						</div>
					</td>
					<td class="col-1 bg-light">
						<div class="list-group" id="">
							<a class="list-group-item list-group-item-action bg-light border-light text-center disabled" id="" data-bs-toggle="list" href="#">
								<span>2022</span>
								<span>1</span>
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
								<span>2</span>
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
							</a>
						</div>
					</td>
					<td class="col-4 bg-light border-end-0">
						<div class="list-group list-group-horizontal" id="">
							<span class="mt-2">2D(라스트 특가)5관(Laser) 10층(총172석)</span>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#" style="width: 80px; height:40px;">09:00</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#" style="width: 80px; height:40px;">12:00</a>
							<a class="list-group-item list-group-item-action bg-light border-light text-center" id="" data-bs-toggle="list" href="#" style="width: 80px; height:40px;">15:00</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>