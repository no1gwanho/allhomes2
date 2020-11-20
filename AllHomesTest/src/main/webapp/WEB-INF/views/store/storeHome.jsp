<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>

<style>
#bxslider img{
	width:1400px;
	height:500px;
}
.col-3 {
	text-align:center;
	margin-bottom:10px;
}
.col-3 img {
	left: 100px;
	width: 180px;
	height: 230px;
}
.title {
	font-height: bold;
	font-size: 1.2em;
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
<div class="container">
	<ul id="bxslider">
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner1.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner2.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner3.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner4.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner5.png"/></a></li>
	</ul>
	<div class="row">
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate1.png"/><br/>&nbsp;&nbsp;메인1</a></div>
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate2.png"/><br/>&nbsp;&nbsp;메인2</a></div>
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate3.png"/><br/>&nbsp;&nbsp;메인3</a></div>
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate4.png"/><br/>&nbsp;&nbsp;메인4</a></div>
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate5.png"/><br/>&nbsp;&nbsp;메인5</a></div>
		<div class="col" style="text-align:center;"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/categori/cate6.png"/><br/>&nbsp;&nbsp;메인6</a></div>
	</div>
	<br/>
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상품리스트 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<div class="row">
		<div class="col-lg-9" style="text-align:left;">
			<h6>상품 리스트</h6>
		</div>
		<div class="col-3" style="text-align:center;">
			<label style="font-size:0.8em;">
				정렬방법
				<select>
					<option value="0">최신순</option>
					<option value="0">좋아요순</option>
					<option value="0">판매순</option>
					<option value="0">최저가순</option>
				</select>
			</label>			
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-3">
			<a href="/myapp/storeDetail">
				<img src="${pageContext.request.contextPath}/resources/img/pd/tb01.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd02.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;</h6>
   			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd03.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;</h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd04.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">MD추천</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd05.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;</h6>
			</a>
		</div>
	    <div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd06.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">2차입고</span></h6>
			</a>
		</div>
    	<div class="col-3">
			<a href="">
    			<img src="${pageContext.request.contextPath}/resources/img/pd/pd07.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;</h6>
		    </a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd08.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">MD추천</span></h6>
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd09.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd10.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd11.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd12.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd13.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd14.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd15.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd16.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">신상품</span></h6>
			</a>
		</div>
	</div>
	<br/>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 페이징 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
		<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
	</ul>
</div>



	
