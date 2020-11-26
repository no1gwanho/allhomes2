<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
<br/>
<div class="container">
	<h2>'커튼'에 대한 스토어 겸색 결과 <span style="color:#ee8374;">8,321개</span></h2>
	<br/>
	<div class="row">
		<div class="col-12" style="text-align:right;">
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
	<hr>
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