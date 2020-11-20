<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.col-3 {
	text-align:center;
	margin-bottom:10px;
	}
	.col-3 img {
		left: 100px;
		width: 180px;
		height: 230px;
	}
	.col-lg-12{
		margin:0 auto;
	}
</style>
<div class="container">
	<div class="row">
		
		<div class="col-lg-12" style="text-align:left;">
			<br/><br/>
			<img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist.png" style="width:40px;float:left;"/>
			<h4 style="width:30%;float:left;height:40px;line-height:40px;">&nbsp;&nbsp;위시리스트</h4>
			<br/><br/><hr><br/>
		</div><br/>
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
	
	
	
	</div>
</div>