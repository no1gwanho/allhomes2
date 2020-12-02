<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<style>
td{
	height: 40px;
	line-height: 40px;
}
.sec3_list li {
	transition: 0.5s all;
	border-radius: 4%;
}

.sec3_list li span {
	display: block;
	position: relative;
	height: 200px;
	margin-top:25px;
	overflow: hidden;
}

.sec3_list li span img {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width:302px;
	height:200px;
	background-color: cadetblue;
}

.sec3_list li dl {
	height: 150px;
	padding: 25px;
	background: #fff;
	transition: 0.5s all;
	text-align:center;
}

.sec3_list li dl dt {
	font-size: 17px;
	color: #444;
	line-height: 1;
}

.sec3_list li dl dt:after {
	content: "";
	display: block;
	width: 20px;
	height: 2px;
	background: red;
	margin-top: 10px;
}

.sec3_list li dl dd {
	font-size: 16px;
	color: #444;
	margin-top: 10px;
}

.sec3_list li dl dd span{
	font-size: 13px;
	color: #bbbbbb;
	margin-top: 10px;
}

.sec3_list li:hover {
	transform: translateY(-20px);
}

.sec3_list li:hover dl {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, .15);
}

.wordCut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
</style>
<script>
	$(function(){
		$('.sec3_list').bxSlider({
			auto : false,
			pager : false,
			controls : true,
			autoControls : false,
			minSlides : 4,
			maxSlides : 20,
			moveSlides : 3,
			slideWidth : 302,
			slideMargin : 20,
			autoHover : true,
			prevText : "",
			nextText : ""
		});
	
	});
</script>
<div class="container-fluid">
	<div class="row">
		<!-- 카드 들 -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-danger text-uppercase mb-1">
								Home Board</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countHb}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-home fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-warning text-uppercase mb-1">
								Q&A Board</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countQa}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-question fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-info text-uppercase mb-1">
								Review</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countReview}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-star fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 카드 끝 -->

		

		<div class="col-lg-12">
			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary" style="float:left">HomeBoard</h6>
					<a href="/myapp/adminHomeBoard" style="float:right;height:10px">더보기</a>
				</div>
				<div class="card-body" style="height:440px">
					<div id="banner_list">
						<ul class="sec3_list">
							<c:forEach var="vo" items="${hList}">
							<li onClick="location.href='/myapp/adminHomeBoardView?b_no=${vo.b_no}'"><span><img
									src="/myapp/resources/img/admin/06.jpg" alt=""></span>
								<dl>
									<dt class="wordCut">${vo.title}</dt>
									<dd>
										${vo.userid}<br/>
										${vo.writedate}<br/>
										<span>조회수:${vo.hit}  스크랩:${vo.scrap}</span>
									</dd>
								</dl></li>
							</c:forEach>
							
							<li onClick="location.href='#'"><span><img
									src="/myapp/resources/img/admin/Vice City.jpg" alt=""></span>
								<dl>
									<dt class="wordCut">집들이 게시판 테스트 페이지1</dt>
									<dd>
										testID<br/>
										2020-12-02<br/>
										<span>조회수:0  스크랩:0</span>
									</dd>
								</dl></li>
							<li onClick="location.href='#'"><span><img
									src="/myapp/resources/img/admin/Cocoaa Ice.jpg" alt=""></span>
								<dl>
									<dt class="wordCut">집들이 게시판 테스트 페이지2</dt>
									<dd>
										testID<br/>
										2020-12-02<br/>
										<span>조회수:0  스크랩:0</span>
									</dd>
								</dl></li>
							<li onClick="location.href='#'"><span><img
									src="/myapp/resources/img/admin/Nelson.jpg" alt=""></span>
								<dl>
									<dt class="wordCut">집들이 게시판 테스트 페이지3</dt>
									<dd>
										testID<br/>
										2020-12-02<br/>
										<span>조회수:0  스크랩:0</span>
									</dd>
								</dl></li>
								
						</ul>
					</div>
				<!-- card-body끝 -->
			</div>
			</div>
			<!-- card 끝 -->


			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Q&A Board</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="" items="">
								<tr onClick="location.href=''">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><a href="#" class="btn btn-danger btn-circle"> <i
											class="fas fa-trash"></i>
									</a></td>
								</tr>
							</c:forEach> --%>
						</tbody>
					</table>

					<!-- pagination -->
					<div style="display: inline-block">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
					<!-- pagination 끝 -->


				</div>
				<!-- card-body끝 -->
			</div>
			<!-- card 끝 -->
			
			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Review</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>스토어번호</th>
								<th>스토어명</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>별점</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="" items="">
								<tr onClick="location.href=''">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach> --%>
						</tbody>
					</table>

					<!-- pagination -->
					<div style="display: inline-block">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
					<!-- pagination 끝 -->


				</div>
				<!-- card-body끝 -->
			</div>
			<!-- card 끝 -->
			


		</div>
		<!-- col-lg-12 끝 -->
	</div>
</div>