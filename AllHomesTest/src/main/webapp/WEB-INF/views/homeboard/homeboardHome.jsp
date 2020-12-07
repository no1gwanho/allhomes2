<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">

<style>

.card-body {
	height: 110px;
	padding: 10px;
	flex: none;
	overflow: hidden;
}

.card-img-top {
	border-radius: 5%;
	width: 320px;
	height: 207px;
	overflow: hidden;
	border:0.2px solid #f2f2f2;
	background-color:#E98374;
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
	font-size: 14px;
}

.card-detail {
	font-size: 12px;
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


<div class="container" style="width:1400px">
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
		<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;새로 올라온 집들이</h3>
	</div>
	<div style="text-align: right;">
		<a href="/myapp/homeboardTop">더보기</a>
	</div>

	<!-- Page Features -->
	<div class="row text-center">
	
	<c:forEach var="vo" items="${list }">

		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-100">
				<div class="card-img-top">
					<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>${vo.thumbnail }"/></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
					</div>
					<a href="#" class="card-text">${vo.userid }</a>
					<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }(확인후지울예정)
					</p>
				</div> 
			</div>
		</div>
		
		
	</c:forEach>

	</div>
	<!-- /.row -->
	


	<div>
		<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;올홈즈 해시태그</h3>
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