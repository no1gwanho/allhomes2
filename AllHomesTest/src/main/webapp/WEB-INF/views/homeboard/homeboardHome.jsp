<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">

<style>

	#bxslider img{
			width:1400px;
			height:450px;
			border-radius:30px;
		}
	.bx-wrapper {
	       -moz-box-shadow: none !important;
	        -webkit-box-shadow: none !important;
	        box-shadow: none !important;
	        padding:0;
	        margin:0;
	}
	.col-3, .col-lg-3, .col-xs-6{
			text-align:center;
			margin-bottom:10px;
	}
	.card-body {
		padding-top:10px;
		height:150px;
		flex: none;
		overflow: hidden;
		}
	
	.thumbnail{
		padding:0px;
		margin:0px;
		width:320px;
		height: 207px;
		overflow: hidden;
		border-radius: 5%;
		}
		
	.thumbnail img {
		width:100%;
		text-align: center;
		overflow: hidden;
		}
	.card-title {
			padding:0px;
			font-size: 17px;
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
		font-size: 11px;
	}
	.container{
			max-width:1700px;
			margin: 0 auto;
			font-family: 'SCDream3';
	}
	.profile_pic{
		width:25px;
		border-radius: 45%;
	}

</style>

<script>
	$(function() {
		$("#bxslider").bxSlider({
			mode : 'horizontal'//'horizontal'(기본), 'vertical', 'fade'
			,
			slideWidth : 1700,
			slideHeight : 600,
			slideWidth : 1400,
			slideHeight : 450,
			speed : 1000 //변환속도
			,
			auto : false //자동시작(true,false)
			,
			randomStart : true,
			captions : false//true, falase/ title값을 설명으로 표시 
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
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner1.png" title="room01" /></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner1.png" title="room02" /></a></li>

	</ul>

<div class="container" style="margin-top:45px;">
	<div class="row">
		<div class="col-10">
			<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;새로 올라온 집들이</h3>
		</div>
		<div class="col-2" style="text-align:right">
			<a href="/myapp/homeboardTop?order=0">더보기</a>
		</div>
	
	

	<!-- 리스트 나오는 곳 -->
	<c:forEach var="vo" items="${list }">

		<div class="col-lg-3">
			<div class="thumbnail">
				<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
			</div>
			<div class="card-body">
				<div class="card-title">
					<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
				</div>
				<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}"/>
				<a href="#" class="card-text">${vo.userid }</a>
				<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }(확인후지울예정)
				</p>
				</div> 
		</div>
		
	</c:forEach>
	</div>

	<!-- 해시태그 리스트 (이 기능 없앨지 말지 고민중)--> 
	<div>
		<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;올홈즈 해시태그</h3>
	</div>
	<h6>올홈즈에서 지금 가장 인기있는 해시태그로 검색해보세요.</h6>
	<div style="text-align: right;">
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

</div>