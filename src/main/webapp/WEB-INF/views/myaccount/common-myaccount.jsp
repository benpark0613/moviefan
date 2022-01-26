<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<%-- 회원정보 개괄 --%>
	<div class="row mb-3" style="background: #F2F2F2;">
		<div class="col-6 p-4">
		<c:choose>
			<c:when test="${empty LOGINED_CUSTOMER.nickName }">
				<div class="row">
					<p>
						<strong>${ LOGINED_CUSTOMER.name}</strong>님&nbsp; 반갑습니다.&nbsp;
						<a href=""><i class="bi bi-pen" style="font-size: 0.5em;"></i></a>
					</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<p>
						<strong>${ LOGINED_CUSTOMER.nickName}</strong>님&nbsp; 반갑습니다.&nbsp;
						<a href=""><i class="bi bi-pen" style="font-size: 0.5em;"></i></a>
					</p>
				</div>
			</c:otherwise>
		</c:choose>
			<div class="row">
				<p>
					고객님의 등급은 <span class="text-decoration-underline">${LOGINED_CUSTOMER.gradeCode }</span> 입니다.
				</p>
			</div>
			<div class="row">
				<table class="table table-borderless">
					<thead>
						<tr>
							<td><a href="/myaccount/mypoint/history">MVF POINT +</a></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>사용가능 포인트</th>
							<td>10000 점</td>
						</tr>
						<tr>
							<th>다음 등급까지 남은 포인트</th>
							<td>5000 점</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-6 p-4">
			<div class="row"><h3>MY 영화관&nbsp;<a href=""><i class="bi bi-gear" style="font-size: 0.5em;"></i></a></h3></div>
			<div class="row">
				<div class=" d-flex justify-content-evenly">
					<button type="button" class="btn btn-outline-secondary" style="width: 100px; height: 60px;">MVF 가락</button>
					<button type="button" class="btn btn-outline-secondary" style="width: 100px; height: 60px;">MVF 용산</button>
					<button type="button" class="btn btn-outline-secondary" style="width: 100px; height: 60px;">MVF 강남</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="d-flex justify-content-between">
					<span class="h3">찜한 영화</span>
					<span class="align-self-end"><a href="">더 보러 가기</a></span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<div class="card">
						<img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201602/19/htm_20160219165732323457.jpg" class="card-img-top w-100" alt="...">
						<h6 class="card-title mt-1">영화 제목</h6>
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84949/84949_1000.jpg" class="card-img-top w-100" alt="...">
						<h6 class="card-title mt-1">영화 제목</h6>
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85611/85611_1000.jpg" class="card-img-top w-100" alt="...">
						<h6 class="card-title mt-1">영화 제목</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- 서브 네비 --%>
	<div class="row">
		<ul class="nav nav-tabs">
			<li class="nav-item dropdown">
				<a class="nav-link text-dark dropdown-toggle text-decoration-none ${subMenu eq 'myTicket' ? 'fw-bolder' : '' }" data-bs-toggle="dropdown" href="/myaccount/myticket/bookinglist" role="button" aria-expanded="false">결제내역</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'bookingList' ? 'fw-bolder' : '' }" href="/myaccount/myticket/bookinglist">예매내역</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'orderList' ? 'fw-bolder' : '' }" href="/myaccount/myticket/orderlist">구매내역</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'cancleList' ? 'fw-bolder' : '' }" href="/myaccount/myticket/canclelist">취소내역</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link text-dark dropdown-toggle text-decoration-none ${subMenu eq 'movieLog' ? 'fw-bolder' : '' }" data-bs-toggle="dropdown" href="/myaccount/movielog/wish" role="button" aria-expanded="false">MY 무비로그</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'wish' ? 'fw-bolder' : '' }" href="/myaccount/movielog/wish">찜한 영화</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'watched' ? 'fw-bolder' : '' }" href="/myaccount/movielog/watched">내가 본 영화</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link text-dark dropdown-toggle text-decoration-none ${subMenu eq 'movieTalk' ? 'fw-bolder' : '' }" data-bs-toggle="dropdown" href="/myaccount/movietalk/myscrap" role="button" aria-expanded="false">MY 수다</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'myScrap' ? 'fw-bolder' : '' }" href="/myaccount/movietalk/myscrap">스크랩 보기</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'myDocuments' ? 'fw-bolder' : '' }" href="/myaccount/movietalk/mydocuments">작성 글 보기</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'myComments' ? 'fw-bolder' : '' }" href="/myaccount/movietalk/mycomments">작성 한줄평 보기</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'myReplies' ? 'fw-bolder' : '' }" href="/myaccount/movietalk/myreplies">작성 댓글 보기</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link text-dark dropdown-toggle text-decoration-none ${subMenu eq 'myPoint' ? 'fw-bolder' : '' }" data-bs-toggle="dropdown" href="/myaccount/mypoint/info" role="button" aria-expanded="false">MY MVF 포인트</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'info' ? 'fw-bolder' : '' }" href="/myaccount/mypoint/info">포인트 적립/사용안내</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'history' ? 'fw-bolder' : '' }" href="/myaccount/mypoint/history">포인트 적립/사용내역</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link text-dark dropdown-toggle text-decoration-none ${subMenu eq 'myInfo' ? 'fw-bolder' : '' }" data-bs-toggle="dropdown" href="/myaccount/myinfo/modify" role="button" aria-expanded="false">MY 정보관리</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'modify' ? 'fw-bolder' : '' }" href="/myaccount/myinfo/modify">회원 정보 변경</a></li>
					<li><a class="dropdown-item-text text-decoration-none ${subMenuList eq 'delete' ? 'fw-bolder' : '' }" href="/myaccount/myinfo/delete">회원 탈퇴</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

			


