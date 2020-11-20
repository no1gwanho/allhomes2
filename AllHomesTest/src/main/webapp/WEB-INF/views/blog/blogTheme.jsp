<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#blogTitle {
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
	<h3 id="blogTitle">테마별 인기글</h3>


	<!-- 탭메뉴  -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active" id="home-tab"
			data-toggle="tab" href="#home" role="tab" aria-controls="home"
			aria-selected="true">테마1</a></li>
		<li class="nav-item"><a class="nav-link" id="profile-tab"
			data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
			aria-selected="false">테마2</a></li>
		<li class="nav-item"><a class="nav-link" id="contact-tab"
			data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
			aria-selected="false">테마3</a></li>
		<li class="nav-item"><a class="nav-link" id="contact-tab"
			data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
			aria-selected="false">테마4</a></li>
	</ul>


	<!-- 테마1 본문-->
	<div class="tab-content" id="myTabContent">


		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">

			<!-- 내용시작 -->
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
			<!-- 테마1 내용끝 -->


		</div>
		<!-- 테마1 끝 -->




		<div class="tab-pane fade" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">
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
			<!-- 테마2 내용끝 -->
		</div>

		<!-- 테마3시작 -->
		<div class="tab-pane fade" id="contact" role="tabpanel"
			aria-labelledby="contact-tab">
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
			<!-- 테마3 내용끝 -->
		</div>
		<!-- 테마3끝 -->


		<!-- 테마4시작 -->
		<div class="tab-pane fade" id="contact" role="tabpanel"
			aria-labelledby="contact-tab">
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
			<!-- 테마4 내용끝 -->
		</div>
		<!-- 테마4끝 -->



	</div>
	<!-- tap content 끝 -->
	

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