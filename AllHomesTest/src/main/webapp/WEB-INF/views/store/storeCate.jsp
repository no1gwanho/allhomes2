<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.container{
			max-width:1400px;
			margin: 0 auto;
			font-family: 'SCDream3';
	}

.col-2, .col-3, .col-4 {
	text-align:center;
	margin-bottom:10px;
}
.col-4 img {
	border-radius: 5%;
	width: 265px;
	height: 225px;
}
.dropdown-toggle::after {
    display: none;
}
.col-3 img {
		border-radius: 5%;
		width: 255px;
		height: 215px;
	}
	
	
.btn-block{
	outline:0;border:0;margin-bottom:3px;background-color:#ee8374;color:#fff;
}

.sidebar-sub-menu{
	color:#ee8374;margin-bottom:3px;
}

#homeboardTitle {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: 20px;
		font-family:'SCDream5'
	}
#cate1,#cate2,#cate3,#cate4,#cate5{
font-family: 'SCDream5';
}

.open-list{
	display:block;
}

</style>
<script>
	$(function(){
	
		var sub_c = $('#sub_c').val();
		var main_c = $("#main_c").val();
		console.log(main_c +','+ sub_c);
		
		$("#cate1").click(function(){
			location.href="/myapp/storeCategory?main_c=가구&sub_c=total";	
		});
		
		$("#cate2").click(function(){
			location.href="/myapp/storeCategory?main_c=홈데코&sub_c=total";
		});
		$("#cate3").click(function(){
			location.href="/myapp/storeCategory?main_c=가전&sub_c=total";
		});
		$("#cate4").click(function(){
			location.href="/myapp/storeCategory?main_c=수납&sub_c=total";
		});
		$("#cate5").click(function(){
			location.href="/myapp/storeCategory?main_c=DIY/공구&sub_c=total";
		});
		
		if(main_c == '가구'){
			$('#pageSubmenu1').addClass("show");
			
		}
		if(main_c == '홈데코'){
			$('#pageSubmenu2').addClass("show");
			
		}
	
		if(main_c == '가전'){
			$('#pageSubmenu3').addClass("show");
			
		}
		if(main_c == '수납'){
			$('#pageSubmenu4').addClass("show");
			
		}
		if(main_c == 'DIY/공구'){
			$('#pageSubmenu5').addClass("show");
			
		}
		
		
		//$('.pageSub>ul>li>a').hide();
		//$('.pageSub').click(function(){
		//	$(this).next().slideToggle(300);
	 	//$('.pageSub').not(this).next().slideUp(300);
		//	return false;
		//});
		//$('.pageSub').eq(0).trigger("click");

		
	});
</script>
<br/>
<div class="container">
<h3 id="homeboardTitle">스토어 카테고리</h3>
<!-- 탭메뉴  -->
	<div class="row">
	<input type="hidden" id="main_c" value="${main_c }"/>
	<input type="hidden" id="sub_c" value="${sub_c }"/>
		
		<div class="col-2">
			
				
				<ul class="list-unstyled components mb-5">
					<li>
						<a id="cate1" class="pageSub" href="#pageSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn btn-block ">가구</button></a>
							<ul class="collapse list-unstyled" id="pageSubmenu1">
								<li><a href="/myapp/storeCategory?main_c=가구&sub_c=소파/거실가구"><button class="btn sidebar-sub-menu">소파/거실가구</button></a></li>
								<li><a href="/myapp/storeCategory?main_c=가구&sub_c=학생/서재가구"><button class="btn sidebar-sub-menu">학생/서재가구</button></a></li>
								<li><a href="/myapp/storeCategory?main_c=가구&sub_c=침실가구"><button class="btn sidebar-sub-menu">침실가구</button></a></li>
								<li><a href="/myapp/storeCategory?main_c=가구&sub_c=주방가구"><button class="btn sidebar-sub-menu">주방가구</button></a></li>
								<li><a href="/myapp/storeCategory?main_c=가구&sub_c=테이블/의자/스툴"><button class="btn sidebar-sub-menu" >테이블/의자/스툴</button></a></li>
							</ul>
					</li>
					
					<li>
						<a id="cate2"class="pageSub" href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn btn-block">홈데코</button></a>
						<ul class="collapse list-unstyled open-list" id="pageSubmenu2">
							<li><a href="/myapp/storeCategory?main_c=홈데코&sub_c=조명"><button class="btn sidebar-sub-menu">조명</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=홈데코&sub_c=장식소품"><button class="btn sidebar-sub-menu">장식소품</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=홈데코&sub_c=월데코/장식"><button class="btn sidebar-sub-menu">월데코/장식</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=홈데코&sub_c=홈갤러리"><button class="btn sidebar-sub-menu">홈갤러리</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=홈데코&sub_c=플라워/식물"><button class="btn sidebar-sub-menu">플라워/식물</button></a></li>
						</ul>
					</li>
					
					
					<li>
			        	<a id="cate3"class="pageSub" href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn btn-block">가전</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu3">
							<li><a href="/myapp/storeCategory?main_c=가전&sub_c=주방가전"><button class="btn sidebar-sub-menu">주방가전</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=가전&sub_c=청소가전"><button class="btn sidebar-sub-menu">청소가전</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=가전&sub_c=생활가전"><button class="btn sidebar-sub-menu">생활가전</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=가전&sub_c=계절가전"><button class="btn sidebar-sub-menu">계절가전</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=가전&sub_c=영상음향가전"><button class="btn sidebar-sub-menu">영상음향가전</button></a></li>
						</ul>
					</li>
					
					
					<li>
			        	<a id="cate4" class="pageSub" href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn btn-block">수납</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu4">
							<li><a href="/myapp/storeCategory?main_c=수납&sub_c=수납장/서랍장"><button class="btn sidebar-sub-menu">수납장/서랍장</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=수납&sub_c=리빙박스/수납함/바구니"><button class="btn sidebar-sub-menu">리빙박스/수납함/바구니</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=수납&sub_c=행거/옷걸이"><button class="btn sidebar-sub-menu">행거/옷걸이</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=수납&sub_c=선반/거치대"><button class="btn sidebar-sub-menu">선반/거치대</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=수납&sub_c=현관/신발정리"><button class="btn sidebar-sub-menu">현관/신발정리</button></a></li>
						</ul>
					</li>
					
					
					<li>
			        	<a id="cate5" class="pageSub" href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><button class="btn btn-block">DIY/공구</button></a>
						<ul class="collapse list-unstyled" id="pageSubmenu5">
							<li><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=현관/신발정리"><button class="btn sidebar-sub-menu">벽지/시트지</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=타일/파벽돌"><button class="btn sidebar-sub-menu">타일/파벽돌</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=페인트/부자재"><button class="btn sidebar-sub-menu">페인트/부자재</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=손잡이/방문/유리"><button class="btn sidebar-sub-menu">손잡이/방문/유리</button></a></li>
							<li><a href="/myapp/storeCategory?main_c=DIY/공구&sub_c=공구/접작체/보수용품"><button class="btn sidebar-sub-menu">공구/접착제/보수용품</button></a></li>
						</ul>
					</li>
				
				
				</ul>
	
			
		</div>
		<!-- 상품리스트 -->
		<div class="col-9">
			<div class="row">
				<c:forEach var="vo" items="${categoryList}">
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
	</div>
	<br/>
	<!-- 페이징 -->
<!-- 	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
		</ul>
	</div> -->
</div>