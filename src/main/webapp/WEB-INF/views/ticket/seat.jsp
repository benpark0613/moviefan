<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>MovieFan</title>
	<link type="image/png" href="/resources/images/logo/moviefan-favicon.png" rel="icon"/>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		.list-group {
		    max-height: 500px !important;
		    overflow-y: auto !important;
		}
		.list-group-item.active, .btn.active {
			color: #fff !important;
    		background-color: #333 !important;
		}
		.btn:focus {
		 	outline: none !important;
			box-shadow: none !important;
		}
		.btn {
			transition: none !important;
		}
		#seat a {
			background-color: #333;
			color: #fff;
			border-radius: 0;
			border-color: #f8f9fa;
			width: 30px;
			height: 30px;
			margin-right: -4px;
			padding: 0;
		}
		#seat .btn.active {
			background-color: #dc3545 !important;
		}
		#seat .btn.none {
			background-color: #f8f9fa !important;
			color: #f8f9fa;
		}		
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mt-3 mb-3">
		<div class="col-xs-12">
			<h1>좌석선택</h1>
		</div>
	</div>
	<div class="row">
		<table class="table table-bordered mb-0">
			<thead>
				<tr>
					<th class="col-12 bg-dark text-center text-white border-start-0 border-end-0" colspan="4">인원/좌석</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-6 bg-light border-start-0" colspan="2">
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">일반</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>
						</div>
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">청소년</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>						
						</div>
						<div class="mb-1">
							<span class="align-middle" style="display: inline-block; width: 70px;">경로</span>
							<a class="btn btn-sm active" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>0</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>1</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>2</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>3</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>4</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>5</strong></a>
							<a class="btn btn-sm" id="" data-bs-toggle="button" href="#" style="border-color: #333; width: 30px; height: 30px;"><strong>6</strong></a>						
						</div>
					</td>
					<td class="col-6 bg-light border-end-0" colspan="2">
						<span class="align-middle">CGV강남</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle">5관(Laser) 10층</span>
						<div class="vr mx-2 align-middle"></div>
						<span class="align-middle">남은좌석 <strong class="text-danger">161</strong>/172</span>
						<span class="d-block fs-3"><strong>2022.01.24(월) 09:00 ~ 11:38</strong></span>
					</td>
				</tr>
				<tr>
					<td class="col-9 bg-light border-start-0" colspan="3">
						<div class="d-flex justify-content-center">
							<div class="text-center" style="background-color: #333; color: #fff; width: 700px;">SCREEN</div>
						</div>
						<div class="d-flex justify-content-center my-5">
							<div class="" style="width: 452px; height: 400px;" id="seat">
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">A</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">B</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">C</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">D</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">E</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">F</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">1</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">2</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">G</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">H</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">I</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">J</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn disabled" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">K</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">L</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
								
								<a class="btn bg-light text-dark border-top border-bottom" id="" data-bs-toggle="button" href="#">M</a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn disabled none" id="" data-bs-toggle="button" href="#"></a>
								<a class="btn" id="" data-bs-toggle="button" href="#">3</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">4</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">5</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">6</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">7</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">8</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">9</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">10</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">11</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">12</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">13</a>
								<a class="btn" id="" data-bs-toggle="button" href="#">14</a>
							</div>
						</div>
					</td>
					<td class="col-3 bg-light border-end-0">
						<span class="d-block">선택</span>
						<span class="d-block">예매완료</span>
						<span class="d-block">선택불가</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col d-flex justify-content-start align-items-center">
				<a class="btn btn-lg" href="/ticket/movie" style="background-color: #333; color: #fff;"><i class="bi bi-caret-left-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>영화선택</strong></a>
			</div>
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
				<span class="fs-3"><i class="bi bi-chevron-right"></i> 좌석선택</span>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-lg disabled" href="/ticket/checkout" style="background-color: #333; color: #fff;"><i class="bi bi-caret-right d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>결제선택</strong></a>
			</div>
		</div>
	</div>
</div>
<div class="bg-dark text-white">
	<div class="container">
		<div class="row" style="height: 150px;">
			<div class="col d-flex justify-content-start align-items-center">
				<a class="btn btn-lg" href="/ticket/movie" style="background-color: #333; color: #fff;"><i class="bi bi-caret-left-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>영화선택</strong></a>
			</div>
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
					<span class="d-block"><span style="display: inline-block; width: 70px;">인원</span><strong>일반 2명</strong></span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block">좌석명: 일반석</span>
					<span class="d-block">좌석번호: C1,C2</span>
				</div>
			</div>
			<div class="vr p-0 my-4"></div>
			<div class="col d-flex justify-content-center align-items-center">
				<div>
					<span class="d-block">일반: 10,000원 X 2</span>
					<span class="d-block">총금액: <strong class="text-danger">20,000원</strong></span>
				</div>
			</div>
			<div class="col d-flex justify-content-end align-items-center">
				<a class="btn btn-danger btn-lg" href="/ticket/checkout"><i class="bi bi-caret-right-fill d-flex justify-content-center" style="font-size: 3rem;"></i> <strong>결제선택</strong></a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>