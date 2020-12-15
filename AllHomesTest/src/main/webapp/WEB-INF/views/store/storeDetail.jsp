<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/69f9d4fad2.js"></script>
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
   });
</script>

<style>
	.col-3{
      text-align:center;
      margin-bottom:10px;
   }
	#floatingbanner {
		position:absolute;
		width:440px;
		top:120px;
		left:1400px;
		z-index:100;
	}
	#content{
		max-width:1400px;
		margin:15px auto;
		font-family:'SCDream3';
	}
	#imgWrapper>img{
		margin-top:15px;
		border-radius:5%;
		width:900px;
		height:720px;
	}
	#opt, #num {
		margin-bottom:8px;
		width:270px;
		height:45px;
	}
	#cart, #buy, #wish{
		width:430px;
		height:58px;
		color:#fff;
		background-color:#ee8374;
	}
	#buy, #wish{
		margin-top:15px;
	}
</style>

<div class="container" id="content">
	<form method="post" action="/myapp/cartInsert?pd_no=${vo.pd_no}" onsubmit="numchek()">
	<!-- 상품 정보  -->
		<span>Category : ${vo.main_c} > <a href="/myapp/sotreCategory">${vo.sub_c}</a></span>
		<div class="row">
			<div class="col-8" id="imgWrapper">
				<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
			</div>
			<div class="col-4" style="padding-top:15px;" id="floatingbanner">
				<div class="row">
					<div class="col-12">
						<div style="height:30px;"><span>${vo.s_name}</span></div>
						<div style="heihgt:105px;"><span style="font-size:1.8em;">${vo.pd_name}</span></div>
					</div>
					<div class="col-12" style="margin-top:15px;height:45px;line-height:45px;">
						<c:if test="${result==0 && rvo.rating == 0}">
							<span style="color:#aaa">
								<i class="fas fas-star"></i>
								<i class="fas fas-star"></i>
								<i class="fas fas-star"></i>
								<i class="fas fas-star"></i>
								<i class="fas fas-star"></i>								
							</span>	
							아직 등록된 리뷰가 없습니다
						</c:if>
						<c:if test="${result != 0 && rvo.rating == 1 }">
								<i class="fa fa-star"></i>
							<span style="color:#aaa">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</span>
						</c:if>
						<c:if test="${result != 0 && rvo.rating == 2 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							<span style="color:#aaa">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</span>
						</c:if>
						<c:if test="${result != 0 && rvo.rating == 3 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>																
							<span style="color:#aaa">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</span>
						</c:if>
						<c:if test="${result != 0 && rvo.rating == 4 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							<span style="color:#aaa">
								<i class="fa fa-star"></i>
							</span>
						</c:if>
						<c:if test="${result != 0 && rvo.rating == 5 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
						</c:if>	
						&nbsp;&nbsp;
						<a class="review-link" href="#review">
							<span style="color:#ee8374;font-size:1.2em;">${result}개 </span><span style="font-size:1.2em;">의 리뷰가 있습니다 </span>
						</a>																							
					</div>
					<div class="col-12" style="margin-top:15px;height:55px;">
						<c:if test="${vo.discount!=0 }">
							<span style="color:#343a40;"> 판매가격</span>
							<b style="font-size:1.8em;margin-left:55px;">${vo.dc_price}원</b>
							<span style="color:#ee7384;font-size:1.5em;">${vo.discount }%↓</span>
						</c:if>
						<c:if test="${vo.discount==0 }">
							<span style="color:#333;"> 판매가격</span>
							<b style="font-size:1.8em;margin-left:55px;color:#333;">${vo.dc_price }원 </b>							
						</c:if>
					</div>
					<div class="col-12">
						<c:if test="${vo.shipping_c==0 }">
							<span style="color:#343a40;">무료배송</span>
						</c:if>
						<c:if test="${vo.shipping_c!=0 }">
							<span style="color:#343a40;">배송료</span><span style="margin-left:57px;color:#343a40">${vo.shipping_c }원</span>
						</c:if>
					</div>
					<div class="col-3" style="margin-top:35px;">
						<span style="color:#343a40">옵션</span>
					</div>
					<div class="col-9" style="margin-top:35px;text-align:right;">
						<select class="input-select" id="opt" name="o_value">
							<c:if test="${ options != null}">
								<c:forEach var="o" items="${options}">
									<option  value="${o}">${o}</option>
								</c:forEach>
							</c:if> 
							<c:if test="${ options == null}">
								<option value="X">옵션없음</option>
							</c:if>
						</select>
					</div>		
					<div class="col-3" style="margin-top:15px;">
						<span style="color:#343a40">수량</span>
					</div>
					<div class="col-9" style="margin-top:15px;text-align:right;">
						<input type="number" name="num" id="num"/>
					</div>	
					<div class="col-12" style="height:233px;margin-top:50px;">
						<input type="submit" class="btn btn-block" id="cart" value="장바구니">
						<button class="btn btn-block" id="buy">바로구매</button>
						<a href="/myapp/wishAdd?pd_no=${vo.pd_no }"><button id="wish" type="button" class="btn btn-block">위시리스트</button></a>
					</div>													
				</div>
			</div>
		</div>
		<script>
			function numCheck(){
			   	var num = document.getElementById("num");
			   	
			   	if(num.value=="") {
			           alert("구매수량을 입력해주세요");
			           num.focus();
			           
			           return false;
			    }
			   	
			   	return true;
			}
		</script>	
		<!-- 탭메뉴 시작 -->
		<br/><br/>
		<div class="row">
			<div class="col-8">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#descript">상품정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#info">교환/환불</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#review">구매리뷰</a>
					</li>					
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="descript">
						<div class="row">
							<div class="col-12">
								<br/>
								<c:if test="${vo.pd_img != null }">
									<img src="<%=request.getContextPath() %>/resources/upload/productImg/${vo.s_no}/${vo.pd_img }" style="width:900px;"/>
								</c:if>		
								<c:if test="${vo.pd_img == null }">
									<span style="margin-top:25px;">상품 설명이 없습니다</span>
								</c:if>
							</div>
						</div>
	           		</div>
					<div class="tab-pane fade" id="info">
	           			<br/>
	       				<span class="info_title">교환/반품 정보</span>
	       				<div class="row">
    	   					<div class="col-12"><hr/></div>
	       					<div class="col-3">반품배송비</div>
	       					<div class="col-9">편도 2500원	</div>
	       					<div class="col-3">보내실 곳</div>
	       					<div class="col-9">
	       						<div class="row">
	       							<div class="col-7">서울시 서대문구 백범로23 올홈즈스토리 앞</div>
	       							<div class="col-5">tel : 02-222-1111</div>
	       						</div>
	       					</div>
	       					<div class="col-12"><hr/></div>
	       					
	       					<br/>
	       					<div class="col-12" style="margin-top:25px;">
	       						<span class="info_title">판매자 정보</span>
	       					</div>
	       					<div class="col-12"><hr/></div>
	       					<div class="col-3">상호 / 대표자</div>
	       					<div  class="col-9">올홈즈스토리</div>
	       					<div class="col-3">연락처</div>
	       					<div class="col-9">02-222-1111</div>
	       					<div class="col-3">응대가능시간</div>
	       					<div class="col-9">10시 ~ 17시</div>
	       					<div class="col-3">E-mail</div>
	       					<div class="col-9">cs@homes.com</div>
	       					<div class="col-3">FAX</div>
	       					<div class="col-9">02-222-1111</div>
	       					<div class="col-3">사업자 등록번호</div>
	       					<div class="col-9">142-50-98345</div>
	       					<div class="col-3">통신판매업 신고</div>
	       					<div class="col-9">2011-서대문공-0231</div>
	       					<div class="col-3">영업소재지</div>
	       					<div class="col-9">서울시 서대문구 백범로23 올홈즈스토리</div>
	       					<div class="col-12"><hr/></div> 							       					
							
							<br/> 
							<div class="col-12" style="margin-top:25px;">
	       						<span class="info_title">거래 관련 공지사항</span>
	       					</div>
	       					<div class="col-12"><hr/></div> 
	       					<div class="col-12" style="margin-top:15px;">
	       						<h6>거래 조건에 대한 정보</h6>
	 							<ol>
	 								<li>소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나, 지역/대형 화물/설치/예약/발송지체 등의 특이사항에 따라 배송기간은 달라질 수 있습니다.</li>
	 								<li>상품의 특성과 거래조건에 따라 청약철회(변심반품/취소)가 일부 제한되거나 청약철회에 소요되는 비용이 다르게 책정될 수 있습니다.</li>
	 								<li>청약철회는 상품 수령일로부터 7일 이내에 신청하실 수 있으며, 판매자는 ‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따른 지연이자 지급의 책임이 있습니다.</li>
	 								<li>제품 사용 상 불만과 피해보상에 관하여는 당사의 고객센터로 문의 주시면 관계법령과 규정에 부합하는 기준에 따라 문제 해결에 도움을 드리겠습니다.</li>
	 							</ol>
	       					</div>
							<div class="col-12"><hr/></div>
	       					<div class="col-12" style="margin-top:25px;">
	       						<h6>거래 주의사항</h6>
	       						<ol>
	       							<li>당사의 결제시스템을 통하지 않고 판매자에게 직접 상품대금을 지급하는 직거래 시 피해가 발생할 수 있으므로 주의 바랍니다.</li>
	       							<li>직거래로 인해 발생한 피해에 대해 올홈즈스토리는 책임을 지지 않습니다.</li>
	       							<li>전자상거래 등에서의 소비자보호법에 관한 법률에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 취소할 수 있습니다.</li>
	       						</ol>
	       					</div>
       					</div>	
       				</div>	      
       				<div class="tab-pane fade" id="review" style="margin-top:15px;">       				
           			<c:if test="${result == 0 }">
						<div class="row">
							<div class="col-5" style="text-align:center;">
								<h2 style="position:absolute;top:23%;height:200px;">
									<span style="color:#aaa">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>								
									</span><br/><br/>
									<b style="margin-top:5px;left:45px;">평점 <span style="margin-left:55px;color:#343a40;">0.0</b></span>
								</h2>							
							</div>
							<div class="col-7">
								5점 : 
								<div class="progress">
	  								<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								4점 :
								<div class="progress">
	  								<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								3점 :
								<div class="progress">
	  								<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
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
						<hr/>
					</c:if>
					<c:if test="${result != 0 }">
						<h6><span style="color:#ee8374">${result}</span>개의 리뷰가 있습니다.</h6>
	           			<div class="row">
							<div class="col-5" style="text-align:center;">
								<h2 style="position:absolute;top:23%;height:200px;">
								<c:if test="${rvo.rating == 1}">
										<i class="fa fa-star"></i>
									<span style="color:#aaa">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</span>
								</c:if>
								<c:if test="${rvo.rating == 2}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									<span style="color:#aaa">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</span><br/>
								</c:if>
								<c:if test="${rvo.rating == 3 }">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									<span style="color:#aaa">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</span>
								</c:if>
								<c:if test="${rvo.rating == 4}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									<span style="color:#aaa">
										<i class="fa fa-star"></i>
									</span>								
								</c:if>
								<c:if test="${rvo.rating == 5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if><br/><br/>
								<b style="margin-top:5px;left:45px;">평점 <span style="margin-left:55px;color:#343a40;">${rvo.rating }</b></span>
								</h2>
							</div>
							<div class="col-7">
								5점 : 
								<div class="progress">
		  							<div class="progress-bar" role="progressbar" style="width:12.5%;background-color:#ee8374" aria-valuenow="12.5" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								4점 :
								<div class="progress">
		  							<div class="progress-bar" role="progressbar" style="width:12.5%;background-color:#ee8374" aria-valuenow="12.5" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								3점 :
								<div class="progress">
		  							<div class="progress-bar" role="progressbar" style="width:62.5%;background-color:#ee8374" aria-valuenow="62.5" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								2점 :
								<div class="progress">
		  							<div class="progress-bar" role="progressbar" style="width:0%;background-color:#ee8374" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								1점 :
								<div class="progress">
		  							<div class="progress-bar" role="progressbar" style="width:12.5%;background-color:#ee8374" aria-valuenow="12.5" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<br/>
						<hr/>
<!-- 						<div class="row">
							<div class="col-2">
								<a href="/myapp/reviewOrder">베스트순</a>
							</div>
							<div class="col-2">
								<a href="#">최신순</a>
							</div>
							<div class="col-3">
								<a href="#">사진리뷰</a>
							</div>
							<div class="col-5" style="text-align:right;">
								<select>
									<option value="1">베스트순</option>
									<option value="2">최신순</option>
									<option value="3">별점순</option>
									<option value="4">사진리뷰</option>
								</select>
							</div>
						</div> -->
						<div class="row">
							<c:if test="${result == 0 }">
								등록된 리뷰가 없습니다.
							</c:if>
							<c:if test="${result != 0 }">
								<c:forEach var="r" items="${rList}">
									<div class="row">
										<div class="col-12">
											<c:if test="${r.img != null}">
												<a href="/mypage/storeDetail?pd_no=${vo.pd_no }">
													<img src="<%=request.getContextPath()%>${r.img}" style="width:65%;"/>
												</a>
											</c:if>
										</div>	
										<div class="col-12" style="margin-top:15px;">
											작성자 : ${r.userid}
										</div>
										<div class="col-12" style="margin-top:15px;">
											별점 :
											<c:if test="${r.rating == 1 }">
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${r.rating == 2 }">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${r.rating == 3}">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>								
											</c:if>
											<c:if test="${r.rating == 4  }">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>								
												<i class="fa fa-star"></i>								
											</c:if>
											<c:if test="${r.rating == 5 }">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>								
												<i class="fa fa-star"></i>	
												<i class="fa fa-star"></i>								
											</c:if>							
										</div>
									</div>										
									<div class="row">
										<div class="col-12" style="margin-top:15px;">
											상품명 : ${vo.pd_name} <br/>
										</div>
										<div class="col-12" style="margin-top:15px;">
											구매일 : <br/>
										</div>
										<div class="col-12" style="margin-top:15px;">
											${r.content}
										</div>
										<div class="col-12" style="margin-top:35px;text-align:right">
											<a href="/myapp/reviewHitAdd?pd_no=${vo.pd_no }&r_no=${r.r_no }">
												<button type="button" class="btn btn" style="background-color:#ee8374;color:#fff;">좋아요</button><br/>
											</a>
										</div>
										<div class="col-12" style="margin-top:5px;text-align:right">
											${r.hit } 명에게 도움이 되었습니다.
										</div>
									</div>
									<hr/>
								</c:forEach>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</div>	
		</div>
	</form>
</div>
<style>
	.nav nav-tabs, .nav-item{
		list-style-type:none;
	}
	.info_title{
		font-size:1.5em;
		margin-top:15px;
		color:#343a40;
		font-wieght:bold
	}
	ol>li{
		line-height:30px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script>
	$(function(){
		var floatPosition = parseInt($("#floatingbanner").css('top'));
		
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */

			$("#floatingbanner").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();
	});
</script>
