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
	
	#homeboardTitle {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: 20px;
		font-family:'SCDream5'
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
		
	.card-body {
		padding-top:10px;
		height:150px;
		flex: none;
		overflow: hidden;
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
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=가구&sub_c=total"><img src="${pageContext.request.contextPath}/resources/upload/category/cate1.png"/><br/>&nbsp;가구</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=홈데코&sub_c=total"><img src="${pageContext.request.contextPath}/resources/img/category/cate2.png"/><br/>&nbsp;홈데코</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=가전&sub_c=total"><img src="${pageContext.request.contextPath}/resources/img/category/cate4.png"/><br/>&nbsp;가전</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=수납&sub_c=total"><img src="${pageContext.request.contextPath}/resources/img/category/cate3.png"/><br/>&nbsp;수납</a></div>
			<div class="col-2" style="text-align:center;"><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=total"><img src="${pageContext.request.contextPath}/resources/img/category/cate6.png"/><br/>&nbsp;DIY/공구</a></div>
<%-- 		</c:forEach> --%>
			<div class="col-1"></div>
	
	
	
	</div>
	
	<br/>
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상품리스트 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	
		
		
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3" style="text-align:center;">
			<select class="selectpicker" name="order" id="order">
				<option value="recent" <c:if test="${order == 'recent' }">selected</c:if>>최신순</option>
				<option value="sale" <c:if test="${order == 'sale' }">selected</c:if>>판매순</option>
				<option value="price" <c:if test="${order == 'price' }">selected</c:if>>최저가순</option>
			</select>
			</div>
		</div>
	

	
		<hr/>
		<!-- 상품리스트 -->
		<div class="row">
				<c:forEach var="vo" items="${shList}">
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
