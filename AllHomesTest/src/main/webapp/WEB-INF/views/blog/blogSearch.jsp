<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>

<style>

.card-body {
	height: 200px;
	padding: 10px;
	flex: none;
	overflow: hidden;
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
	font-size: 12px;
}

.card-detail {
	font-size: 8px;
}

.keyword{

	color:#ee8374;
	font-weight:bold;
}


</style>

<!-- Page Content -->


<div class="container">
	<!-- 해시태그, 일반 키워드 중 택1해서 사용  -->

	<!-- 해시태그 -->
	<div style="margin:30px 0 30px 50px;">
		집들이 > <a href="#" class="badge badge-light">#해시태그</a>로 검색한 결과 <span class="keyword">123</span>건
	</div>
	
	<!-- 일반키워드 -->
	<div style="margin:30px 0 30px 50px;">
		집들이 > <span class="keyword">키워드</span>로 검색한 결과 <span class="keyword">123</span>건
	</div>
	
	<hr/>
	<!-- Page Features -->
	<div class="row text-center">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

	</div>
	<!-- Page Features -->
	<div class="row text-center">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

	</div><!-- Page Features -->
	<div class="row text-center">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

	</div><!-- Page Features -->
	<div class="row text-center">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/blogView">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/blogView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="#">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

	</div>
	
	
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
<!-- /.container -->