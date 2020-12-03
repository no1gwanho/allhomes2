<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#homeboardTitle {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 20px;
}

.card-body {
	height: 200px;
	padding: 10px;
	flex: none;
	overflow: hidden;
}

.card-top {
	width: 320px;
	height: 207px;
}

.card-img-top {
	border-radius: 5%;
	width: 320px;
	height: 207px;
	overflow: hidden;
}

.card-img-top>a>img {
	width: 325px;
	text-align: center;
}

.card {
	border: none;
}

.card-title {
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.card-title>a:link, .card-title>a:visited, .card-title>a:hover,
	.card-title>a:active {
	text-decoration: none;
}

.card-text {
	font-size: 16px;
}

.card-detail {
	font-size: 12px;
}

.card-body{
		height:150px;
	}

.nav {
	margin: 20px;
}
</style>


<div class="container">
	<h3 id="homeboardTitle">테마별 집들이</h3>

<!-- 탭메뉴  -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		
		<li class="nav-item"><a class="nav-link" id="1-tab" data-toggle="tab" href="#1" role="tab" aria-controls="1" aria-selected="true">코지/내추럴</a></li>
		<li class="nav-item"><a class="nav-link" id="2-tab" data-toggle="tab" href="#2" role="tab" aria-controls="2" aria-selected="true">러블리/로맨틱</a></li>
		<li class="nav-item"><a class="nav-link" id="3-tab" data-toggle="tab" href="#3" role="tab" aria-controls="3" aria-selected="true">모던</a></li>
		<li class="nav-item"><a class="nav-link" id="4-tab" data-toggle="tab" href="#4" role="tab" aria-controls="4" aria-selected="true">빈티지/레트로</a></li>
		<li class="nav-item"><a class="nav-link" id="5-tab" data-toggle="tab" href="#5" role="tab" aria-controls="5" aria-selected="true">한국/아시아</a></li>
	
	</ul>


	<!--탭 본문-->
	<div class="tab-content" id="myTabContent">
		
		<!-- 테마1시작 -->
		<div class="tab-pane fade show active" id="1" role="tabpanel" aria-labelledby="1-tab">
			<!-- 내용시작 -->
			<div class="row text-center">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-img-top">
							<a href="#"><img
								src="<%=request.getContextPath()%>/resources/img/allhomes3.png"/></a>
						</div>
						<div class="card-body">
							<div class="card-title">
								<a href="/myapp/homeboardView?b_no=103">글제목</a>
							</div>
							<a href="#" class="card-text">${vo.nickname}</a>
							<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 테마1 끝 -->
		

	</div><!-- 탭본문 끝 -->
	

	<!-- pagination ===========================================================-->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</nav>

</div>