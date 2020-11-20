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
   });
</script>
<div class="container">
   <div class="row">
      <div class="col-md-6" >
         <div class="thumbs">
              <a href="<%=request.getContextPath()%>/resources/img/pd/tb01.png"" title="image1"><img src="<%=request.getContextPath()%>/resources/img/pd/tb01.png"/></a>
              <a href="<%=request.getContextPath()%>/resources/img/pd/tb02.png"" title="image2"><img src="<%=request.getContextPath()%>/resources/img/pd/tb02.png"/></a>
              <a href="<%=request.getContextPath()%>/resources/img/pd/tb03.png"" title="image3"><img src="<%=request.getContextPath()%>/resources/img/pd/tb03.png"/></a>
              <a href="<%=request.getContextPath()%>/resources/img/pd/tb04.png"" title="image4"><img src="<%=request.getContextPath()%>/resources/img/pd/tb04.png"/></a>
              <a href="<%=request.getContextPath()%>/resources/img/pd/tb05.png"" title="image5"><img src="<%=request.getContextPath()%>/resources/img/pd/tb05.png"/></a>
          </div>
          <div id="mainImg"><img src="<%=request.getContextPath()%>/resources/img/pd/tb01.png" alt="image" /></div>
      </div>
   
   <!-- 상품명/재고/설명/옵션 -->
      <div class="col-md-6">
         <div class="product-details">
            Category :<a href="#"> 메인카테고리</a> > <a href="#">서브카테고리</a><br/>
            <h2 class="product-name">product name goes here</h2>
            <div>
               <div class="product-rating">
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star-o"></i>
               </div>
                  <a class="review-link" href="#">10 Review(s) | Add your review</a>
            </div>
            <h3 class="product-price">할인가 <del class="product-old-price">원가</del></h3><br/>
            <span class="product-available">재고</span>
            <p>간단한 설명</p>
            <div class="product-options">
               <label>
                  Size :
                  <select class="input-select">
                     <option value="0">X</option>
                     <option value="0">L</option>
                     <option value="0">XL</option>
                  </select>
               </label>
               <label>
                  Color :
                     <select class="input-select">
                        <option value="0">Red</option>
                        <option value="0">Black</option>
                        <option value="0">White</option>
                     </select>
               </label>
            </div>
      
            <div class="add-to-cart">
               <div class="qty-label">
                  수량 : <input type="number"/>
               </div>
               <button class="btn" style="margin-top:15px;"><i class="fa fa-shopping-cart"></i> 장바구니</button>
               <button class="btn" style="margin-top:15px;"><img src="<%=request.getContextPath()%>/resources/img/icon/card.png">&nbsp;바로구매</button>
            </div>
         </div>
      </div>
   </div>
   <br/>
   <div class="row">
     <div class="col">
         <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link active" data-toggle="tab" href="#descript">상품정보</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#info">배송/환불</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#review">리뷰</a>
           </li>
         </ul>
         <div class="tab-content">
           <div class="tab-pane fade show active" id="descript">
             <p>상품정보 영역Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id ornare libero. Vivamus iaculis, justo vel mattis pharetra, nisi ligula varius nisl, sit amet mollis tortor ligula vitae nisi.</p>
           </div>
           <div class="tab-pane fade" id="info">
             <p>배송/환불 영역Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
           </div>
           <div class="tab-pane fade" id="review">
             <p>리뷰 영역Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
           </div>
         </div>
     </div>
   </div>
</div>
<br/>