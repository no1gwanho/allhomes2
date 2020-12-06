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
	width: 315px;
	height: 300px;
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
<script>
	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
    	//추가되는 임시 콘텐츠
    	//window height + window scrollY 값이 document height보다 클 경우,
    	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    		//실행할 로직 (콘텐츠 추가)
        	count++;
        	var addContent = '<div class="block"><p>'+ count +'</p></div>';
        	//article에 추가되는 콘텐츠를 append
        	$('article').append(addContent);
    	}
	};
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
				<select name="sortPd">
					<option value="">최신순</option>
					<option value="">판매순</option>
					<option value="rowPrice">최저가순</option>
				</select>
			</label>			
		</div>
	</div>
	<article>
    	<div class="block">
			<hr/>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-3">
						<a href="/myapp/storeDetail?pd_no=${vo.pd_no}">
							<img src="<%=request.getContextPath() %>${vo.main_img}"/><br/>
							[${vo.s_no}] ${vo.pd_name }<br/>
							<c:if test="${vo.discount != 0}">
								${vo.price - (vo.price*vo.discount/100)}원 <del>${vo.price }원</del><br/> 
							</c:if>
							<c:if test="${vo.discount == 0 }">
								${vo.price }원<br/>
							</c:if>
							<h6>평점 / 리뷰&nbsp;&nbsp;
							<c:if test="${vo.status!=null }">
								<span class="badge badge-secondary">${vo.status }</span>
							</c:if>
							</h6>
						</a>
					</div>
				</c:forEach>
			</div>	
		</div>
	</article>
</div>


	
