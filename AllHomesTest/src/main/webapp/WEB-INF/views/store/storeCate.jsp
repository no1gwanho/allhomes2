<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.col-3 {
	text-align:center;
	margin-bottom:10px;
}
.col-3 img {
	border-radius: 5%;
	width: 180px;
	height: 145px;
}
.dropdown-toggle::after {
    display: none;
}
</style>
<script>
	$(function(){
		$('.pageSub>ul>li>a').hide();
		$('.pageSub').click(function(){
			$(this).next().slideToggle(300);
		 	$('.pageSub').not(this).next().slideUp(300);
			return false;
		});
		$('.pageSub').eq(0).trigger("click");
	});
</script>
<br/>
<div class="container">
	<div class="row">
		<!-- 사이드 메뉴 -->
		<div class="col-3">
			<nav id="sidebar">
				<h5>All Homes</h5>
				<ul class="list-unstyled components mb-5">
					<li>
						<a class="pageSub" href="#pageSubmenu1" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">가구</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu1">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">소파/거실가구</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">학생/서재가구</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">침실가구</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">주방가구</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">테이블/의자/스툴</button></a></li>
						</ul>
					</li>
					<li>
						<a class="pageSub" href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">홈데코</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu2">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">조명</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">장식소품</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">월데코/장식</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">홈갤러리</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">플라워/식물</button></a></li>
						</ul>
					</li>
					<li>
			        	<a class="pageSub" href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">가전</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu3">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">주방가전</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">청소가전</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">생활가전</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">계절가전</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">영상음향가전</button></a></li>
						</ul>
					</li>
					<li>
			        	<a class="pageSub" href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">수납</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu4">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">수납장/서랍장</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">리빙박스/수납함/바구니</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">행거/옷걸이</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">선반</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">현관/신발정리</button></a></li>
						</ul>
					</li>
					<li>
			        	<a class="pageSub" href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn-block" style="outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff">DIY/공구</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu5">
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">벽지/시트지</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">타일/파벽돌</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">페인트/부자재</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">손잡이/방문/유리</button></a></li>
							<li><a href="#"><button class="btn btn" style="color:#ee8374;margin-bottom:3px;">공구/접착제/보수용품</button></a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<!-- 상품리스트 -->
		<div class="col-sm-9">
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-3">
						<a href="/myapp/storeDetail?pd_no=${vo.pd_no}">
							<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
							[${vo.s_no}] ${vo.pd_name }<br/>
							<c:if test="${vo.discount != 0}">
								${vo.price - (vo.price*vo.discount/100)}원 
							</c:if>
							<c:if test="${vo.discount == 0 }">
								${vo.price }원<br/>
							</c:if>
							<h6>
							<c:if test="${vo.status!=null }">
								<span class="badge badge-secondary">${vo.status }</span>
							</c:if>
							</h6>
						</a>
					</div>
				</c:forEach>																				
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