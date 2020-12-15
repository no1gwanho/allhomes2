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
	
	#homeboardTitle {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: 20px;
		font-family:'SCDream5'
	}
	
	.carousel-item {
		text-align:center;
		width:100%;
		height:500px;
		overflow:hidden;
		
	}
	
	.slide-title>span{
		background-color:white;
		color:black;
		font-family:'SCDream5'
	}
	
	.carousel-caption>p>span{
		color:white;
		background-color:rgba(255,255,255, 0.3);
		
	}
	

</style>

<script>
	$(function() {
		$('.carousel').carousel({
			interval : 3000,
			
		})
		
		$("#hb1").click(function({
			window.location.href="myapp/homeboardView?b_no=124";
		}));
		
	});
</script>

<!-- Page Content -->
<div class="container" style="width:1400px">
<br/>

		<div id="hbSlide" class="carousel slide" data-ride="carousel">
		 	<ol class="carousel-indicators">
			    <li data-target="#hbSlide" data-slide-to="0" class="active"></li>
			    <li data-target="#hbSlide" data-slide-to="1"></li>
			    <li data-target="#hbSlide" data-slide-to="2"></li>
		  	</ol>
	  <div class="carousel-inner">
	    	<div class="carousel-item active">
	      		<a href="/myapp/homeboardView?b_no=139">
	      		<img class="w-100" src="<%=request.getContextPath()%>/resources/img/banner/hb_banner01.JPG" alt="First slide" id="hb1">
	      		 </a>
	      			<div class="carousel-caption d-none d-md-block">
				    <h4 class="slide-title"><span>홈파티를 위한 인테리어</span></h4>
				    <p><span>2.5단계에 걸칠 생일에 조촐하게 친구들을 불러...</span></p>
				 </div>
				
	    	</div>
	    <div class="carousel-item">
	    	<a href="/myapp/homeboardView?b_no=124">
	      <img class="d-block w-100" src="<%=request.getContextPath()%>/resources/img/banner/hb_banner02.JPG" id="hb2">
	      </a>
	      			<div class="carousel-caption d-none d-md-block">
	      			<h4 class="slide-title"><span>크리스마스 준비🎄🐶</span></h4>
				    <p><span>강아지들과 함께 하는 크리스마스 준비!</span></p>
				    </div>
	    </div>
	    <div class="carousel-item">
	    <a href="/myapp/homeboardView?b_no=142">
	      <img class="d-block w-100" src="<%=request.getContextPath()%>/resources/img/banner/hb_banner03.JPG" id="hb3">
	      </a>
	      			<div class="carousel-caption d-none d-md-block">
	      			<h4 class="slide-title"><span>북촌의 작은 주택</span></h4>
				    <p><span>모든 소품과 가구 하나하나에 이야기가 서려있답니다...</span></p>
				    </div>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#hbSlide" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#hbSlide" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

<div class="container" style="margin-top:45px;">
	<div class="row">
		<div class="col-10">
			<h3 id="homeboardTitle">새로 올라온 집들이</h3>
		</div>
		<div class="col-2" style="text-align:right;margin-top:100px;">
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
				<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }
				</p>
				</div> 
		</div>
		
	</c:forEach>
	</div>

	<!-- 해시태그 리스트 (이 기능 없앨지 말지 고민중)--> 
	<div>
		<h3 id="homeboardTitle">올홈즈 해시태그</h3>
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