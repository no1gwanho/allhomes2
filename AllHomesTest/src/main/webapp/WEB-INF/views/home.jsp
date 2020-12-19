<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">


<style>
	#bxslider img{
		width:1400px;
		height:450px;
		border-radius:30px;
	}
	#bxslider{
		border-radius:30px;
	}
	
	.bx-wrapper {
       -moz-box-shadow: none !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        padding:0;
        margin:0;
   }
	.col-3 {
		text-align:center;
		margin-bottom:10px;
	}
   
	.card-body {
	padding-top:10px;
	height:150px;
	flex: none;
	overflow: hidden;
	}
	

	
	.storeThumbnail img{
		width:320px;
		height: 207px;
		border-radius: 5%;
		text-align: center;
	
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
	}
	
	.homeboard-container{
		font-family: 'SCDream3';
	}
	
	.store-list-container{
		font-family: 'SCDream3';
	}
	
	.profile_pic{
		width:25px;
		border-radius: 45%;
	
	}
	
		.product-name{
		font-family:'SCDream5'
	}
	.store-name{
		color:gray;
		font-size:12px;
	}
	.store-discount{
		font-family:'SCDream5';
		font-size:20px;
		color: #E98374
	}
	
	.store-price{
		color: black;
		font-family:'SCDream5';
		font-size:20px;
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
			auto : true //자동시작(true,false)
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
				
		
	}); //Jquery 
</script>
<!-- 메인 홈페이지 배너 -->
<br/>
<div class="container" style="width:1400px">

	
		<ul id="bxslider">
		  	<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner_christmas_01.jpg"/></a></li>
		  	<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner_christmas_02.jpg"/></a></li>
		  	<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner_christmas_03.jpg"/></a></li>
		  	<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner_christmas_04.jpg"/></a></li>
		  	<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner_christmas_05.jpg"/></a></li>
	</ul>




<!-- 집들이 리스트 -->
<div class="container homeboard-container" style="margin-top:45px;">

	<div class="row">
		<div class="col-10">
			<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;인기집들이</h3>
		</div>
		<div class="col-2" style="text-align:right;">
			<a href="/myapp/homeboardTop?order=recentBest">더보기</a>
		</div>
		<br/>
		<!-- 집들이 리스트 나오는 곳  -->
		<c:forEach var="vo" items="${hbList }" end="7">

		<div class="col-3">
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
</div>
<!-- 상품리스트 -->
	<div class="container store-list-container" style="margin-top:45px;">
		<div class="row">
			<div class="col-10">
				<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;스토어</h3>
			</div>
			<div class="col-2" style="text-align:right;">
				<a href="/myapp/storeHome?order=recent">더보기</a>
			</div>
		</div>
		<div class="row">
			
			<c:forEach var="vo" items="${list }" end="7">
				<div class="col-3 store-list" style="cursor:pointer;" onclick="window.location='/myapp/storeDetail?pd_no=${vo.pd_no}'">
						<div class="thumbnail">
							<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
						</div>	
						<div class="card-body">	
							<div class="store-name">${vo.s_name }</div>
							<div class="product-name">  ${vo.pd_name }</div>
							<c:if test="${vo.discount != 0 }">
							<span class="store-discount">${vo.discount }%</span>
							</c:if>
							<span class="store-price">${vo.price }원</span>
							
							<c:if test="${vo.status!=null && vo.status == '판매중'}">
								<span class="badge badge-info">${vo.status }</span>
							</c:if>
							<c:if test="${vo.status!=null && vo.status == '품절임박'}">
								<span class="badge badge-warning">${vo.status }</span>
							</c:if>
							<c:if test="${vo.status!=null && vo.status == '입고대기'}">
								<span class="badge badge-secondary">${vo.status }</span>
							</c:if>
						</div>	
					</div>
			</c:forEach>
		</div>
			
		
	</div>
</div>