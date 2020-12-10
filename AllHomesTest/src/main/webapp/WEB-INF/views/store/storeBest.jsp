<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.col-3 {
		text-align:center;
		margin-bottom:10px;
	}
	.col-3 img {
		border-radius: 5%;
		width: 255px;
		height: 215px;
	}
</style>
<script>

</script>
<div class="container">
<!-- Collapse buttons -->
	<br/>
	<div class="row">
		<div class="col-lg-9" style="text-align:left;">
			<h6>베스트 스토어</h6>
		</div>
		<div class="col-3" style="text-align:center;">
			<select class="selectpicker" name="sortPd" id="sortPd">
				<option value="saled" <c:if test="${bestPd == 'recent' }">selected</c:if>>최근인기순</option>
				<option value="recent" <c:if test="${bestPd == 'history' }">selected</c:if>>역대인기순</option>
			</select>
		</div>
	</div>
	<br/>
	<!-- 상품리스트 -->
	<h6>상품 리스트</h6>
	<hr/>
	<div class="row">
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>
		<div class="col-3">
			<a href="#">
				<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg"/><br/>
				[스토어명] / 상품명<br/>
				할인율 / 가격<br/>
				<h6>별 / 리뷰&nbsp;&nbsp;<span class="badge badge-secondary">품절임박</span></h6>
    		</a>
		</div>		
	</div>
	<br/>
	<!-- 페이징 -->
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
