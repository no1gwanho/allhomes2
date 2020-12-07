<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>

<style>
	#bxslider{
		width:100%;
		margin:0;
  		border: 0;
  		 -moz-box-shadow: none !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        padding:0;
        height:700px;
        overflow:hidden;
  		
	}
	.bx-wrapper {
       -moz-box-shadow: none !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        padding:0;

   }
   
	#bxslider img{
		width:100%;
		height:700px;
		
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
	
	.card-body {
	height: 200px;
	padding: 10px;
	flex: none;
	overflow: hidden;
	}

	.card-top {
		width: 320px;
		height: 207px;
	}
	
	.card-img-top {
		border-radius: 5%;
		width: 320px;
		height: 207px;
		overflow: hidden;
	}
	
	.card-img-top>a>img {
		width: 325px;
		text-align: center;
	}
	
	.card {
		border: none;
	}
	
	.card-title {
		font-size: 20px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.card-title>a:link, .card-title>a:visited, .card-title>a:hover,
		.card-title>a:active {
		text-decoration: none;
	}
	
	.card-text {
		font-size: 16px;
	}
	
	.card-detail {
		font-size: 12px;
	}
	
	.card-body{
			height:150px;
		}
	
	
</style>
<script>
	$(function() {
		$("#bxslider").bxSlider({
			mode : 'horizontal',//'horizontal'(기본), 'vertical', 'fade'	
			slideHeight : 700,
			speed : 900, //변환속도
			auto : true, //자동시작(true,false)
			randomStart : true,
			captions : true,//true, falase/ title값을 설명으로 표시 
			infiniteLoop : true,
			hideControlOnEnd : true,//처음과 마지막 컨트롤러 표시 여부 결정 
			//easing
			useCSS : false//easing 사용여부 설정(true,false) true-> easing사용안함, false-> easing사용함
		});
		
		
		//집들이 리스트 구하기 
		function homeboardListSelect(){
			var url = "/myapp/homeboardListForMain";
			$.ajax({
				url : url,
				success : function(result){
					var $result = $(result);
					var tag = '<div class="row text-center">';
					$result.each(function(i,v){
						tag += '<div class="col-lg-3 col-md-6 mb-4">';
						tag += '<div class="card h-100">';
						tag += '<div class="card-img-top">';
						tag += '<a href="/myapp/homeboardView?b_no='+v.b_no+'"><img src="<%=request.getContextPath()%>'+v.thumbnail+'"/></a></div>';
						tag += '<div class="card-body"><div class="card-title">';
						tag += '<a href="/myapp/homeboardView?b_no='+v.b_no+'">'+v.title+'</a></div>';
						tag += '<a href="#" class="card-text">'+v.userid+'</a><p class="card-detail">스크랩: '+v.scrap+' | 조회: '+v.hit+'</p>';
						tag += '</div></div></div>';
					});
					tag += '</div>';
					$("#homeboardListForMain").html(tag);
				}
				
			});
			
			
		}
		
		//페이지 시작할때 집들이 리스트 보여주기 
		homeboardListSelect();

	}); //Jquery 
	
</script>
<!-- 메인 홈페이지 배너 -->

	<div class="col-lg-12">
	<ul id="bxslider">
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner11.svg"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner1.png" style="width:100%"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner2.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner6.jpg"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner3.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner4.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner9.png"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner10.jpg"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner12.jpg"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/resources/img/banner/banner13.jpg"/></a></li>
	</ul>
	</div>


<!-- 집들이 리스트 Ajax -->
	<div class="container" style="margin-top:45px;">
		<div>
			<h3 style="font-size:22px;font-weight:bold">&nbsp;&nbsp;집들이</h3>
		</div>
		<div style="text-align: right;">
			<a href="/myapp/homeboardTop">더보기</a>
		</div>
		<br/>
		<!-- 집들이 리스트 나오는 곳  -->
		<div id="homeboardListForMain"> </div>
		
		
	</div>




<!-- 스토어 리스트 -->
<div class="container" style="margin-top:45px;">

	<div class="title">
			<div class="row">
				<div class="col-sm-9">
					<h6>스토어</h6>
				</div>
				<div class="col-sm-3" style="text-align:right;">
					<h6><a href="/myapp/homeboardHome">더보기</a></h6>
				</div>
			</div>
			<hr/>
		</div>
	
	<div class="row">
		<c:forEach var="v" items="${list }">
			<div class="col-3">
				<a href="/myapp/storeDetail?pd_no=${v.pd_no }">
					<img src="<%=request.getContextPath() %>${v.main_img }"/><br/>
					[${v.s_no }] / ${v.pd_name }<br/>
					<c:if test="${v.discount != 0}">
						${v.price - (v.price*v.discount/100)}원 <del>${v.price }원</del><br/> 
					</c:if>
					<c:if test="${v.discount == 0 }">
						${v.price }원<br/>
					</c:if>
					<c:if test="${v.status!=null }">
						<h6><span class="badge badge-secondary">${v.status }</span></h6>
					</c:if>					
				</a>
			</div>
		</c:forEach>
	</div>	
</div>
</div>
</div>
<br/>