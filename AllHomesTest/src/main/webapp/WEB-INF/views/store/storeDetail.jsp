<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
   $(function(){
       	$(".thumbs>a").click(function(){            //클릭 시
           	var imgPath = $(this).attr("href");     //클릭한 a태그의 하이퍼링크를 변수저장
		$("#mainImg>img").attr({src:imgPath})   //메인 이미지의 주소 속성에 할당
           	.hide()                                 //fadein()효과를 보여주기 위해 숨김처리
           	.fadeIn();                              //fadeIn()
        	return false;                           //<a> 의 본래기능 (하이퍼링크) 작동방지
       	});
       
       	$("#buy").click(function(){
			location.href="/myapp/order" 
       	});
/* 		$(window).scroll(function(event){
			if(jQuery(window).scrollTop() > jQuery("#banner").offset().top) {
    			jQuery("#chase").css("position", "fixed");
    		}else if((jQuery(window).scrollTop() < jQuery("#banner").offset().top)) {
    			jQuery("#chase").css("position", "static");
    		}
    	}); */
       	$( document ).ready( function() {
       	  var offSet = $( '#chase' ).offset();
       	  $( window ).scroll( function() {
       	    if ( $( document ).scrollTop() > offSet.top ) {
       	      $( '#chase' ).addClass( 'active' );
       	    }
       	    else {
       	      $( '#chase' ).removeClass( 'active' );
       	    }
       	  });
       	});
   });
</script>
<style>
	.nav nav-tabs, .nav-item{
		list-style-type:none;
	}
	input[type=number]{
    	width: 85px;
	} 
</style>
<div class="container" style="margin-top:15px;">
	<div class="row">
		<div class="col-md-5">
			<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}" alt="image" style="width:720px;height:680px;"/>
		</div>
		<!-- 상품명/재고/설명/옵션 -->
		<div class="col-md-7" style="left:350px;">
			<div class="product-details">
				<form method="post" action="/myapp/cartList"> <!-- 액션 넣어주세요 -->
					<div class="product-details">
						Category : <a href="#">메인카테고리</a> > <a href="#">${vo.sub_c }</a><br/>
						<h2 class="product-name"></h2>
						<div>
							<div class="product-ration">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<a class="review-link" href="#review"><span style="color:#ee8374">${result }개</span>&nbsp;&nbsp;리뷰</a>
						</div>
						<c:if test="${vo.discount!=0 }">
							<span style="font-size:1.4em;">원가:<del>${vo.price }원</del></span><br/>
							<span style="font-size:1.4em;">할인가:${vo.price-(vo.price*vo.discount/100) }원</span><br/>
							<span style="font-size:1.4em;">배송비:${vo.shipping_c }원</span><br/>
						</c:if>
						<c:if test="${vo.discount==0 }">
							<span style="font-size:1.4em;">원가:${vo.price }원</span><br/>
							<span style="font-size:1.4em;">배송비:${vo.shipping_c }원</span><br/>
						</c:if>
						<div style="height:450px;margin-top:15px; ">
							${vo.pd_exp } 
						</div>
					</div>
					<div id="banner" class="sticky-top">
						옵션 : 
							<select class="input-select" style="margin-bottom:8px;">
								<%-- <c:forEach var="oVo" items="${oList}">
									<option value="${oVo.o_value}">${oVo.o_value}</option>
								</c:forEach>	 --%>
								<c:if test="${vo.o_value!=null }">
									<option value="${vo.o_value1}">${vo.o_value1}</option>
									<option value="${vo.o_value2}">${vo.o_value2}</option>
									<option value="${vo.o_value3}">${vo.o_value3}</option>
								</c:if>
							</select><br/>
						수량 : <input type="number" value="1"/> (<span style="font-size:0.8em;">재고: ${vo.stock } 개</span>)<br/>
						<i class="fa fa-shopping-cart" style="color:#ee8374"></i><input type="submit" id="cart" class="btn" value="장바구니"/>
						<img src="<%=request.getContextPath()%>/resources/img/icon/card.png"><input type="button" id="buy" class="btn" value="바로구매"/>
					</div>
				</form>
			</div>	
		</div>
    </div>
	<br/>
	<div class="row">
		<div class="col-8">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#descript">상품정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#info">배송환불</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#review">구매리뷰</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="descript">
						<img src="<%=request.getContextPath() %>/resources/upload/productImg/${vo.s_no}/${vo.pd_img }"/>		
           		</div>
           		<div class="tab-pane fade" id="info">
       				<div class="row">
       					<div class="col-10" style="margin-bottom:18px;">
       						<span style="font-size:1.5em;">배송 안내</span>
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						배송		
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						일반택배
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						배송비
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						${vo.shipping_c }
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						도서산간 추가 배송비
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						5000원
       					</div>
       				</div>
       				
       				<div class="row" style="margin-top:30px;">
       					<div class="col-10" style="margin-bottom:18px;">
       						<span style="font-size:1.5em">교환/환불 안내</span>
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						반품배송비
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						2500원 (최초 배송비가 무료인 경우 5000원 부과)
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						교환배송비
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						5000원
       					</div>
       					<div class="col-3" style="border-bottom:1px solid #eee;">
       						교환/반품 주소
       					</div>
       					<div class="col-7" style="border-bottom:1px solid #eee;">
       						주소 : 서울시 서대문구 올홈즈스토리 / 대표전화 : 02-222-1111 
       					</div>
       				</div>
       				<p></p>
           		</div>
           		<c:if test="${result==0 }">
           		<div class="tab-pane fade" id="review">
					<h5>리뷰 <span style="color:#ee8374">${result}</span></h5><br/>
				</div>
				</c:if>
				<c:if test="${result!=0 }">
           		<div class="tab-pane fade" id="review">
					<h5>리뷰 <span style="color:#ee8374">${result}</span></h5><br/>
           			<div class="row">
						<div class="col-6">
							<h2 style="position:absolute;top:50%;margin-top:-50px;height:200px;">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<b></b>
							</h2>
						</div>
						<div class="col-6">
							5점 : 
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:33%;background-color:#ee8374" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							4점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:33%;background-color:#ee8374" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							3점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:33%;background-color:#ee8374" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							2점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							1점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>

					</div>	
					<br/>
					<hr/>
					<div class="row">
						<div class="col-2">
							<a href="#">베스트순</a>
						</div>
						<div class="col-2">
							<a href="#">최신순</a>
						</div>
						<div class="col-3">
							<a href="#">사진리뷰</a>
						</div>
						<div class="col-5" style="text-align:right;">
							<label>
								별점 : 
								<select>
									<option value="5">5점</option>
									<option value="4">4점</option>
									<option value="3">3점</option>
									<option value="2">2점</option>
									<option value="1">1점</option>
								</select>
							</label>
						</div>
					</div>					
					<hr/>
					<c:forEach var="r" items="${rList}">
					<div class="row">
						<div class="col-12">
							<a href="#"><img src="<%=request.getContextPath()%>${r.img}" style="width:65%;"/></a>
						</div>
						<div class="col-12">
							작성자 : ${r.userid}
						</div>
						<div class="col-12">
							별점 :
							<c:if test="${r.rating==1 }">
								<i class="fa fa-star"></i>
							</c:if>
							<c:if test="${r.rating==2 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</c:if>
							<c:if test="${r.rating==3 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>								
							</c:if>
							<c:if test="${r.rating==4 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>								
								<i class="fa fa-star"></i>								
							</c:if>
							<c:if test="${r.rating==5 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>								
								<i class="fa fa-star"></i>	
								<i class="fa fa-star"></i>								
							</c:if>							
						</div>
					</div>
						<div class="row">
							<div class="col-12">
								상품명 : ${vo.pd_name} <br/>
								옵션 : ${vo.o_value} 
							</div>
							<div class="col-12" style="margin-bottom:25px;">
								구매일 : ${pvo.pc_date}<br/>
								${r.content}
							</div>
							<div class="col-12" style="margin-bottom:15px;text-align:right">
								<button class="btn btn" style="background-color:#ee8374;color:#fff;">좋아요</button><br/>
								<span style="margin-bottom:35px;font-size:0.85em;outline:1px;">230명에게 도움이 되었습니다.</span>
							</div>
						</div>
						<hr/>	
					</c:forEach>		
				</div>
				</c:if>
           	</div>
         	<br/>
		</div>
	</div>
</div>
<br/>