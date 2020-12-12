<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script>
function numCheck(){
   	var num = document.getElementByName("num");
   	
   	if(num.value=="") {
           alert("구매수량을 입력해주세요");
           num.focus();
           
           return false;
       }
   	
   	return true;
   }
</script>
<style>
	.container{
		max-width:1400px;
		margin: 0 auto;
		font-family: 'SCDream3';
	}	
	.nav nav-tabs, .nav-item{
		list-style-type:none;
	}
</style>
<div class="container" style="margin:15px auto">
	<form method="post" action="/myapp/cartInsert?pd_no=${vo.pd_no }" onsubmit="numChek()">
		<span style="font-size:0.8em;">Category : ${sub.main_c } > <a href="/myapp/storeCategory">${sub.sub_c }</a></span>
		<div class="row">
			<div class="col-8">
				<img style="margin-top:15px;border-radius:5%;width:900px;height:720px"src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
			</div>
			<div class="col-4" style="padding-top:15px;">
				<div class="row">
					<div class="col-12">
						<span style="font-size:0.7em;">${vo.s_name }<br/></span>	
						<span style="font-size:1.8em;color:#343a40"><b>${vo.pd_name }</b></span>
					</div>
					<div class="col-12" style="margin-top:20px;">
						<c:if test="${result==0 }">
							<c:if test="${rvo.rating==0 }">
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>								
								</span>							
							</c:if>
							아직 등록된 리뷰가 없습니다
						</c:if>
						<c:if test="${result!=0 }">
							<c:if test="${rvo.rating >= 1.0 && rvo.rating < 1.8 }">
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span>
							</c:if>
							<c:if test="${rvo.rating >= 1.8 && rvo.rating < 2.8 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span>
							</c:if>
							<c:if test="${rvo.rating >= 2.8 && rvo.rating < 3.8}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span>
							</c:if>
							<c:if test="${rvo.rating >= 3.8 && rvo.rating < 4.8}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
								</span>								
							</c:if>
							<c:if test="${rvo.rating >= 4.8 && rvo.rating == 5.0}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</c:if>
							&nbsp;&nbsp;
							<a class="review-link" href="#review">
								<span style="color:#ee8374;font-size:1.5em;">${result} 개</span>
								<span style="font-size:1.3em;">의 리뷰가 있습니다</span>
							</a>
						</c:if>
					</div>
					<c:if test="${vo.discount!=0}">
						<div class="col-12" style="margin-top:20px;">
							<del> 
								<span style="font-size:1.5em;color:#aaa;">판매가격	</span>
								<span style="font-size:1.5em;margin-left:40px;color:#aaa;">${vo.price }원</span>
							</del>
						</div>
						<div class="col-12">
							<span style="font-size:1.5em;color:#343a40;"> 할인가격</span>
							<b style="font-size:1.8em;margin-left:40px;">
							${vo.dc_price}원</b>
							<span style="color:#ee7384;font-size:1.8em;margin-left:25px;">${vo.discount }%↓</span>
						</div>
					</c:if>
					<c:if test="${vo.discount==0 }">
						<div class="col-12" style="margin-top:20px;">
							<span style="font-size:1.5em;color:#333;"> 판매가격</span>
							<b style="font-size:1.8em;margin-left:25px;color:#333;">${vo.price }원 </b>
						</div>
					</c:if>
					<div class="col-12">
						<c:if test="${vo.shipping_c==0 }">
							<span style="font-size:1.5em;color:#343a40;">무료배송</span>
						</c:if>
						<c:if test="${vo.shipping_c!=0 }">
							<span style="font-size:1.5em;color:#343a40;">배송료</span><span style="margin-left:75px;font-size:1.5em;color:#343a40">${vo.shipping_c }원</span>
						</c:if>
					</div>
					<div class="col-12" style="margin-top:20px;">
						<span style="font-size:1.5em;color:#343a40">옵션</span>
						<select class="input-select" style="font-size:1.5em;margin-bottom:8px;width:265px;height:45px;margin-left:100px" name="o_value">
							<c:if test="${ options != null}">
								<c:forEach var="o" items="${options}">
									<option  value="${o}">${o}</option>
								</c:forEach>
							</c:if> 
							<c:if test="${ options ==null}">
								<option value="X">옵션없음</option>
							</c:if>
						</select><br/>
					</div>
					<div class="col-12">
						<span style="font-size:1.5em;color:#343a40">수량</span>
						<input type="number" name="num" style="font-size:1.2em;margin-bottom:8px;width:265px;height:45px;margin-left:100px"/>
					</div>
					<div class="col-12" style="height:233px;margin-top:20px;">
						<input type="submit" class="btn btn-outline-dark" style="width:430px;height:58px;color:#ee8374;" value="장바구니">
						<button class="btn btn-outline-dark" style="width:430px;height:58px;margin-top:15px;color:#ee8374;">바로구매</button>
						<button class="btn btn-outline-dark" style="width:430px;height:58px;margin-top:15px;color:#ee8374;">위시리스트</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="row">
		<div class="col-12"><hr/></div>
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
					<img src="<%=request.getContextPath() %>/resources/upload/productImg/${vo.s_no}/${vo.pd_img }" style="width:900px;"/>		
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
					<h5> 등록된 리뷰가 없습니다. </h5>
					<div class="row">
						<div class="col-5">
							<h2 style="position:absolute;top:50%;margin-top:-50px;height:200px;">
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>								
								</span><br/>
								평점 : 0.0	
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
				</div>
				</c:if>
				<c:if test="${result!=0 }">
           		<div class="tab-pane fade" id="review" style="margin-top:15px;">
					<h5><span style="color:#ee8374">${result}</span>개의 리뷰가 있습니다.</h5>
           			<div class="row">
						<div class="col-5" style="text-align:center;">
							<h2 style="position:absolute;top:23%;height:200px;">
							<c:if test="${rvo.rating >= 1 && rvo.rating < 1.8}">
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span>
							</c:if>
							<c:if test="${rvo.rating >= 1.8 && rvo.rating < 2.8}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span><br/>
							</c:if>
							<c:if test="${rvo.rating >= 2.8 && rvo.rating < 3.8 }">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</span>
							</c:if>
							<c:if test="${rvo.rating >= 3.8 && rvo.rating < 4.8}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<span style="color:#aaa">
									<i class="fa fa-star"></i>
								</span>								
							</c:if>
							<c:if test="${rvo.rating >= 4.8 && rvo.rating == 5}">
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
								<button class="btn btn" style="background-color:#ee8374;color:#fff;">좋아요</button><br/>
							</div>
							<div class="col-12" style="margin-top:5px;text-align:right">
								${r.hit } 명에게 도움이 되었습니다.
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
