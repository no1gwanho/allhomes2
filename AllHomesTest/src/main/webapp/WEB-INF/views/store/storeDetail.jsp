<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br/>
<style>
   ul, li {
      margin:0px;
      padding:0px;
      list-style-type:none;
   }
   li{
      float:left;
      width:8%;
   }
   
   <!-- 썸네일 이미지 -->
   
   .thumbs {
      width:100px; 
      float:left;
      margint-left:15px;
   }
   .thumbs img {
       border:1px solid #ccc;
       padding:5px;
       margin-bottom:3px;
       width:90px;
       height:80px;
   }
   .thumbs img:hover {
       border-color:tomato;
   }
    
   #mainImg {
       border:solid 1px #ccc;
       width:430px;
       height:300px;
       padding:5px;
       margin-left:20px;
   }
   #mainImg>img{
      width:420px;
      height:290px;
   }
   .thumbs img{
   	width:90%
   }
</style>

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
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<img src="${vo.main_img}" alt="image" style="width:400px;height:380px;" />
		</div>
		<!-- 상품명/재고/설명/옵션 -->
		<div class="col-md-8" style="left:380px;">
			<div class="product-details">
				<form method="post" action="/myapp/cartList"> <!-- 액션 넣어주세요 -->
					<div class="product-details">
						Category : <a href="#">메인카테고리</a> > <a href="#">${vo.sub_c }</a><br/>
						<h2 class="product-name">${vo.pd_name}</h2>
						<div>
							<div class="product-ration">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<a class="review-link" href="#review"><span style="color:#ee8374">8,154</span>&nbsp;&nbsp;리뷰</a>
						</div>
						<span style="font-size:1.4em;">원가:<del class="product-old-price">${vo.price}</del></span><br/>
						<span style="font-size:1.4em;">할인가:${vo.price-(vo.price*vo.discount/100)}</h3></span><br/>
						<span class="product-available">재고:${vo.stock}</span>
						<p>${vo.pd_exp }</p>
						<div class="product-options">
							<label>
								옵션 : 
								<select class="input-select">
									<option value="1">옵션1</option>
									<option value="2">옵션2</option>
									<option value="3">옵션3</option>	
								</select>
							</label>
						</div>
						<div class="qty-label">
							수량 : <input type="number"/>
						</div>
					</div>
					<div class="add-to-cart">
						<i class="fa fa-shopping-cart" style="color:#ee8374"></i><input type="submit" id="cart" class="btn" value="장바구니"/>
						<img src="<%=request.getContextPath()%>/resources/img/icon/card.png"><button id="buy" class="btn">바로구매</button>
					</div>
				</form>
			</div>	
		</div>
    </div>
	<br/>
	<div class="row">
		<div class="col-10">
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
					<p>상품정보 영역 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id ornare libero. Vivamus iaculis, justo vel mattis pharetra, nisi ligula varius nisl, sit amet mollis tortor ligula vitae nisi.</p>
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
       						2500원 (50000원 이상 구매시 무료배송)
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
           		<div class="tab-pane fade" id="review">
					<h5>리뷰 <span style="color:#ee8374">8,127</span></h5><br/>
					<div class="row">
						<div class="col-6">
							<h2 style="position:absolute;top:50%;margin-top:-50px;height:200px;">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<b>4.6</b>
							</h2>
						</div>
						<div class="col-6">
							5점 : 
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:30%;background-color:#ee8374" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							4점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:32%;background-color:#ee8374" aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							3점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:18%;background-color:#ee8374" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							2점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:13%;background-color:#ee8374" aria-valuenow="13" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							1점 :
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width:7%;background-color:#ee8374" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
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
									<option value="num5">5점</option>
									<option value="num5">4점</option>
									<option value="num5">3점</option>
									<option value="num5">2점</option>
									<option value="num5">1점</option>
								</select>
							</label>
						</div>
					</div>					
					<hr/>
					<div class="row" style="text-align:center;">
						<div class="col-1">
							<a href="#"><img src="<%=request.getContextPath()%>/resources/img/admin/user_basic.png" style="width:65%;"/></a>
						</div>
						<div class="col-11" style="text-align:left;">
							회원닉네임
						</div>
					</div>
					<div class="row" style="background-color:#eee;margin-top:15px;margin-bottom:25px;">
						<div class="col-12" style="text-align:center;margin-bottom:5px;">
							총점 :
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="col-3">
							내구성 :
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>	
						</div>
						<div class="col-3">
							가격 :
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="col-3">
							디자인 :
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="col-3">
							배송 :
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>							
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							제품명 / 옵션 / 구매일
						</div>
						<div class="col-12" style="margin-bottom:25px;">
							리뷰내용 <br/>
							이미지 첨부시 리뷰내용 아래 세팅
						</div>
						<div class="col-3">
							<button class="btn btn" style="background-color:#ee8374;color:#fff;">도움이 되요</button>
						</div>
						<div class="col-9">
							<span style="font-size:0.85em;outline:1px;">230명에게 도움이 되었습니다.</span>
						</div>
						<hr/>
					</div>				
				</div>
           	</div>
         	<br/>
		</div>
		<div class="col-2">
			스티키 배너 들어갈 자리
		</div>
	</div>
</div>
<br/>