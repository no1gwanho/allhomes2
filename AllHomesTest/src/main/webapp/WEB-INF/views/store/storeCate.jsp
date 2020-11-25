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
.dropdown-toggle::after {
    display: none;
}
</style>
<br/>
<div class="container">
	<div class="row">
		<!-- 사이드 메뉴 -->
		<div class="col-3">
			<nav id="sidebar">
				<h5>All Homes</h5>
				<ul class="list-unstyled components mb-5">
					<li>
						<a href="#pageSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">가구</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu1">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리1</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리2</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리3</button></a></li>
						</ul>
					</li>
					<li>
						<a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">홈데코</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu2">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리1</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리2</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리3</button></a></li>
						</ul>
					</li>
					<li>
			        	<a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">가전</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu3">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리1</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리2</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리3</button></a></li>
						</ul>
					</li>
					<li>
			        	<a href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">수납</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu4">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리1</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리2</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리3</button></a></li>
						</ul>
					</li>
					<li>
			        	<a href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">DIY/공구</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu5">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리1</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리2</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">서브카테고리3</button></a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<!-- 상품리스트 -->
		<div class="col-sm-9">
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