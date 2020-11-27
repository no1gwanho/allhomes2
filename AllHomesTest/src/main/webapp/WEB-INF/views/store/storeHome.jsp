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
		<div class="col" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate1.png"/><br/>&nbsp;가구</a></div>
		<div class="col" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate2.png"/><br/>&nbsp;홈데코</a></div>
		<div class="col" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate4.png"/><br/>&nbsp;가전</a></div>
		<div class="col" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate3.png"/><br/>&nbsp;수납</a></div>
		<div class="col" style="text-align:center;"><a href="/myapp/storeCategory"><img src="${pageContext.request.contextPath}/resources/img/category/cate6.png"/><br/>&nbsp;DIY/공구</a></div>
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
				<select id="sortPd">
					<option value="1">최신순</option>
					<option value="2">좋아요순</option>
					<option value="3">판매순</option>
					<option value="4">최저가순</option>
				</select>
			</label>			
		</div>
	</div>
	<hr/>
	<div class="row">
		<c:forEach var="vo" items="${list}">
			<div class="col-3">
				<a href="/myapp/storeDetail?pd_no=${vo.pd_no}">
					<img src="${vo.main_img}"/><br/>
					[${vo.s_no }] ${vo.pd_name }<br/>
					<c:if test="${vo.discount != 0}">
						${vo.price - vo.discount} <del>${vo.price }</del><br/> 
					</c:if>
					<c:if test="${vo.discount == 0 }">
						${vo.price }<br/>
					</c:if>
					<h6>별 / 리뷰&nbsp;&nbsp;
					<c:if test="${vo.status!=null }">
						<span class="badge badge-secondary">${vo.status }</span>
					</c:if>
					</h6>
				</a>
			</div>
		</c:forEach>
	</div>				

<%--  	<div class="row">
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
	</div> --%>
	<br/>
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 페이징 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
 	<div id="paging">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<c:if test="${pageVO.nowPage>1}">
					<a style="color:pink;background-color:#fff;" class="page-link" href="/myapp/storeHome?nowPage=${pageVO.nowPage-1}">&laquo;</a>
				</c:if>
				<c:if test="${pageVO.nowPage==1}">
					<a style="color:pink;background-color:#fff;" class="page-link">&laquo;</a>
				</c:if>
			</li>
			<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageRecord-1}">
				<c:if test="${p<=pageVO.totalPage}">	
					<li class="page-item">
						<a style="color:pink;background-color:#fff;" class="page-link" href="/myapp/storeHome?nowPage=${p}">${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<li class="page-item">
				<c:if test="${pageVO.nowPage<pageVO.totalPage}">
					<a style="color:pink;background-color:#fff;" class="page-link" href="/myapp/storeHome?nowPage=${pageVO.nowPage+1}">&raquo;</a>
				</c:if>
			</li>
		</ul>
	</div>
</div>



	
