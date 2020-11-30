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

#bxslider img {
	width: 1400px;
	height: 500px;
}
</style>
<script>
	$(function() {
		$("#bxslider").bxSlider({
			mode : 'horizontal'//'horizontal'(기본), 'vertical', 'fade'
			,
			slideWidth : 1400,
			slideHeight : 500,
			speed : 2000 //변환속도
			,
			auto : false //자동시작(true,false)
			,
			randomStart : true,
			captions : true//true, falase/ title값을 설명으로 표시 
			,
			infiniteLoop : false,
			hideControlOnEnd : true//처음과 마지막 컨트롤러 표시 여부 결정 
			//easing
			,
			useCSS : false
		//easing 사용여부 설정(true,false) true-> easing사용안함, false-> easing사용함

		});
	});
</script>
<!-- Page Content -->


<div class="container">
	<ul id="bxslider">
		<li><a href="#"><img
				src="<%=request.getContextPath()%>/resources/img/banner/banner1.png"
				title="room01" /></a></li>
		<li><a href="#"><img
				src="<%=request.getContextPath()%>/resources/img/banner/banner2.png"
				title="room02" /></a></li>
		<li><a href="#"><img
				src="<%=request.getContextPath()%>/resources/img/banner/banner3.png"
				title="room03" /></a></li>
		<li><a href="#"><img
				src="<%=request.getContextPath()%>/resources/img/banner/banner4.png"
				title="room04" /></a></li>
		<li><a href="#"><img
				src="<%=request.getContextPath()%>/resources/img/banner/banner5.png"
				title="room05" /></a></li>

	</ul>

	<div>
		<h3>인기글</h3>
	</div>
	<div style="text-align: right;">
		<a href="/myapp/homeboardTop">더보기</a>
	</div>

	<!-- Page Features -->
	<div class="row text-center">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/homeboardView?b_no=13"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/homeboardView?b_no=13">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
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
					<a href="/myapp/homeboardView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/homeboardView?b_no=10">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
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
					<a href="/myapp/homeboardView"><img
						src="<%=request.getContextPath()%>/resources/img/main/ah02.jpg"
						alt="글번호" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/homeboardView?b_no=11">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
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
						<a href="/myapp/homeboardView?b_no=12">할머니와 함께 살던 집의 변신할머니와 함께 살던 집의 변신할머니와 함께 살던 집의
							변신할머니와 함께 살던 집의 변신</a>
					</div>
					<a href="#" class="card-text">써니웨이</a>
					<p class="card-detail">스크랩: 43건 | 조회: 1000건</p>
				</div>
			</div>
		</div>

	</div>
	<!-- /.row -->
	<div>
		<h3>테마별</h3>
	</div>
	<div style="text-align: right;">
		<a href="/myapp/homeboardTheme">더보기</a>
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


	<div>
		<h3>인기 해시태그</h3>
	</div>
	<h6>올홈즈에서 지금 가장 인기있는 해시태그로 검색해보세요.</h6>
	<div style="text-align: right;">
		<a href="#">더보기</a>
	</div>
	<div class="alert alert-info" role="alert">
		<a href="#">#아기방</a><a href="#">#자취팁</a><a href="#">#셀프인테리어</a><a
			href="#">#컨셉있는방</a><a href="#">#아기방</a><a href="#">#자취팁</a><a
			href="#">#셀프인테리어</a><a href="#">#컨셉있는방</a><a href="#">#아기방</a><a
			href="#">#자취팁</a><a href="#">#셀프인테리어</a><a href="#">#컨셉있는방</a><a
			href="#">#아기방</a><a href="#">#자취팁</a><a href="#">#셀프인테리어</a><a
			href="#">#컨셉있는방</a><a href="#">#아기방</a><a href="#">#자취팁</a><a
			href="#">#셀프인테리어</a><a href="#">#컨셉있는방</a>
	</div>
	<br /> <br /> <br /> <br /> <br /> <br /> <br />
	
	


</div>
<!-- /.container -->