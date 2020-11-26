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
<!-- 메인 홈페이지 배너 -->
<div class="container" style="margin-top:15px;">
	<ul id="bxslider">
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner1.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner2.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner3.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner4.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner5.png"/></a></li>
	</ul>
</div>
<!-- 집들이리스트 -->
<div class="container" style="margin-top:15px;">
	<div class="title">
		<div class="row">
			<div class="col-sm-9">
				<h6>집들이</h6>
			</div>
			<div class="col-sm-3" style="text-align:right;">
				<h6><a href="/myapp/homeboardHome">더보기</a></h6>
			</div>
		</div>
		<hr/>
	</div>
	<div class="row">
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah01.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah02.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah03.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah04.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah05.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah06.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>	
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah07.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>	
		<div class="col-3">
			<a href="#">
      			<img src="${pageContext.request.contextPath}/resources/img/main/ah08.jpg"/><br/>
				집들이 게시글 타이틀<br/>
        		작성자
    		</a>
		</div>	
				<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh01.jpg"/><br/>
					집들이 게시글 타이틀<br/>
					작성자
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh02.jpg"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh03.png"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh04.jpg"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh05.jpg"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>
		<div class="col-3">
			<a href="">
			<img src="${pageContext.request.contextPath}/resources/img/main/oh06.jpg"/><br/>
			집들이 게시글 타이틀<br/>
			작성자
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh07.jpg"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/main/oh08.jpg"/><br/>
				집들이 게시글 타이틀<br/>
				작성자
			</a>
		</div>					
	</div>
</div>
<!-- 스토어 리스트 -->
<div class="container" style="margin-top:45px;">
	<div class="title">
		<div class="row">
			<div class="col-sm-9">
				<h6>스토어</h6>
			</div>
			<div class="col-sm-3" style="text-align:right;">
				<h6><a href="/myapp/storeHome">더보기</a></h6>
			</div>
		</div>
		<hr/>
	</div>
	<div class="row">
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd02.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">최저가</span>
   			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd03.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd04.png"/><br/>
				[빈티지리빙] / 빙하의 잔 유리 풍경<br/>
				0% / 21800<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd05.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
	    <div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd06.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">히트상품</span>
			</a>
		</div>
    	<div class="col-3">
			<a href="">
    			<img src="${pageContext.request.contextPath}/resources/img/pd/pd07.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span>
		    </a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd08.png"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
				<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd09.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">2차 입고</span>
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd10.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd11.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd12.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd13.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span>
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd14.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd15.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
		<div class="col-3">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd16.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				별 / 리뷰&nbsp;&nbsp;
			</a>
		</div>
	</div>	
</div>
<br/>