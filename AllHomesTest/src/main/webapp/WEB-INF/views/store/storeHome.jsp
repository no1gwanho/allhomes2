<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>

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
	.col-3 {
		text-align:center;
		margin-bottom:10px;
	}
	.col-3 img {
		border-radius: 5%;
		width: 255px;
		height: 215px;
	}
	.title {
		font-height: bold;
		font-size: 1.2em;
	}
	#list>ul, #list li{
		list-style-type:none;
		margin:0px;
		padding:0px;
	}
	#list li{
		float:left;
		width:25%;
		text-align:center;
	}
	
	.container{
		max-width:1400px;
		margin: 0 auto;
		font-family: 'SCDream3';
	}
	
	.category-image-menu{
		margin-top:80px;
		
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
		
		var selectOption = $('#order').val();
		
		$('#order').change(function(){
			var selectedOrder = $('#order option:selected').val();
			location.href="/myapp/storeHome?order="+selectedOrder;
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
	<div class="row category-image-menu">
			<div class="col-1"></div>
	
<%-- 		<c:forEach var="c" items="cate"> --%>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=가구"><img src="${pageContext.request.contextPath}/resources/upload/category/cate1.png"/><br/>&nbsp;가구</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate2.png"/><br/>&nbsp;홈데코</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate4.png"/><br/>&nbsp;가전</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate3.png"/><br/>&nbsp;수납</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate6.png"/><br/>&nbsp;DIY/공구</a></div>
<%-- 		</c:forEach> --%>
			<div class="col-1"></div>
	
	
	
	</div>
	
	<br/>
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상품리스트 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<div class="row">
		<div class="col-lg-9" style="text-align:left;">
			<h6>상품 리스트</h6>
		</div>
		<div class="col-3" style="text-align:center;">
			<select class="selectpicker" name="order" id="order">
				<option value="recent" <c:if test="${order == 'recent' }">selected</c:if>>최신순</option>
				<option value="sale" <c:if test="${order == 'sale' }">selected</c:if>>판매순</option>
				<option value="price" <c:if test="${order == 'price' }">selected</c:if>>최저가순</option>
			</select>
		</div>
	</div>
	<article>
	<div class="block">
			<hr/>
			<div class="row">
				<c:forEach var="vo" items="${shList}">
					<div class="col-3">
						<a href="/myapp/storeDetail?pd_no=${vo.pd_no}">
							<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
							<c:if test="${vo.discount != 0 }">
							<span class="badge badge-danger">${vo.discount }%</span>
							</c:if>
							<span style="font-size:0.8em">${vo.price }원 ${vo.sale }개판매(테스트후삭제예정)</span><br/>
							<c:if test="${vo.status!=null }">
								<span class="badge badge-secondary">${vo.status }</span>
							</c:if>
						</a>
					</div>
				</c:forEach>
					
				
			</div>	
		</div>
	</article>
</div>
