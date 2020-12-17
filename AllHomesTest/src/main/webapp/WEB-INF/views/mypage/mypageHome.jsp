<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
   #myShopping{
      text-align:center;
   }
   #myShopping>div{
      float:left;
      text-align:center;
      border:1px solid lightblue;
      width:16%;
      margin:5px;
   }
   #myShopping hr{
      width:70%;
   }
   
   .col-3{
      text-align:center;
      margin-bottom:10px;
   }
   
   .container{
      max-width:1400px;
      margin: 0 auto;
      font-family: 'SCDream3';
   }
   #mypage-title {
      margin-top: 40px;
      margin-bottom: 15px;
      margin-left:20px;
      font-family:'SCDream5'
   }
   .profile-img{
      width:200px;
      height:200px;
      
      
      
   }
   
   .profile-img>img{
      width:200px;
      height:200px;
      border-radius: 50%;
      border: 0.5px solid #8f8d8d;
      
   }
   
   .profile-img{
      margin: 0 auto;
   }
   
   .thumbnail{
      padding:0px;
      margin:0px;
      width:220px;
      height:160px;
      overflow: hidden;
      border-radius: 5%;
      }
      
   .thumbnail img {
      width:220px;height:100%;
      text-align: center;
      
      }

   .card-title {
      text-align:center;
      padding:0px;
      font-size: 17px;
      font-weight: bold;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      }
      
   .qna-content{
      height:100px;
      overflow:hidden;
      text-overflow: ellipsis;
      
   }
   
   .qna-card{
      border: 1px solid #c2c1c0;
      border-radius: 5%
   }
   
</style>
<div class="container">
   <h3 id="mypage-title">마이페이지</h3>
   
   <div class="row">
      
      <div class="card col-3 mypage-profile"><br/>
         <!-- 프로필이미지 -->
         <div class="profile-img" style="text-align:center;">
            <img src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}">
         </div><br/>
         <!-- 닉네임 -->
         <h4 style="font-family:SCDream5;">${vo.nickname}</h4>
         <a href="/myapp/mypageEdit" class="btn btn-user alert-clean" style="float:right;color:gray">회원정보수정</a>
         <hr>
         <div class="row">
         <!-- 위시리스트 바로가기버튼-->
         <div class="col-2"></div>
         <div class="col-4">
            <a href="/myapp/mypageWishlist?userid=${vo.userid }">
               <img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist2.png" style="width:60px"/><br/>
               위시리스트
            </a>
         </div>
         <!-- 스크랩 바로가기버튼 -->
         <div class="col-4">
         <a href="/myapp/mypageScrap">
         <img src="<%=request.getContextPath()%>/resources/img/mypage/scrap2.png" style="width:60px"/><br/>
         스크랩</a>
         </div>
         <div class="col-2"></div>
         </div>
         
         <hr>
      </div><!-- mypage 프로필부분 끝 -->
      
      
      <!-- 마이페이지 요약기능 -->
      
      <div class="col-9"><br/>
         <div class="card card border-light mb-3">
            <div class="card-header">
               나의 쇼핑<a href="/myapp/mypageShopping" style="float:right;">더보기</a>
            </div>
            <div class="card-body"><!-- card-body 시작 -->
                        
               <div class="col-lg-12" id="myShopping" class="center-block">
                  <div><br/>입금 대기<hr>0건<br/><br/></div>
                  <div><br/>결제완료<hr>0건<br/><br/></div>
                  <div><br/>배송준비<hr>0건<br/><br/></div>
                  <div><br/>배송중<hr>0건<br/><br/></div>
                  <div><br/>구매확정<hr>0건<br/><br/></div>
               </div>
            
               
            </div>
         </div>
         
         <br/>
         <!-- 위시리스트 -->
         <div class="card card border-light mb-3">
            <div class="card-header">
            <c:if test="${empty list }">
               위시리스트
            </c:if>
            <c:if test="${!empty list }">
               위시리스트<a href="/myapp/mypageWishlist?userid=${vo.userid }"style="float:right;">더보기</a>
            </c:if>
            </div>
            <div class="card-body"><!-- card-body 시작 -->
               <c:if test="${empty list }">
                  <div style="width:100%;height:100px;text-align:center;line-height:100px;">
                     아직 위시리스트에 담은 상품이 없습니다
                  </div>
               </c:if>
               <c:if test="${!empty list }">
               <c:forEach var="w" items="${list }">   
               <div class="row">            
                  <div class="col-12">
                     <div style="float:left;width:33%;text-align:center">
                        <a href="/myapp/storeDetail?pd_no=${w.pd_no }"><img src="/myapp/resources/upload/productMainImg/${w.s_no}/${w.main_img}" style="width:230px;height:130px;border-radius:5%;"/></a><br/>
                         <span style="font-size:0.8em;">${w.pd_name }</span><br/>
                     </div>
                  </div>
               </div>
               </c:forEach>                        
               </c:if>
            </div><!-- card-body 끝 -->
         </div><!-- card끝 -->         
         <br/>
         
         
         <!-- 스크랩 -->
         <div class="card border-light mb-3" style="height:290px;">
            <div class="card-header">
               
               스크랩<a href="/myapp/mypageScrap" style="float:right;">
               <c:if test ="${!empty sList }">
                  더보기
               </c:if>
               </a>
   
            </div>

            <div class="card-body"><!-- card-body 시작 -->
               <div class="row">
                  <c:if test ="${empty sList }">
                  <span style="margin:0 auto;color:black;">아직 관심있는 글이 없습니다</span>
                  </c:if>
                  <c:if test="${!empty sList }">
                  <c:forEach var="vo" items="${sList }" end="3">
                  <div class="col-3">
                     <div class="thumbnail">
                        <a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
                     </div>
                     <div class="card-body">
                        <div class="card-title">
                           <a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
                        </div>
                     </div>
                  </div>
                  </c:forEach>
                  </c:if>
               </div>
            </div>
         </div>
         
         
         <!-- 나의 작성글-->
         <div class="card border-light mb-3">
            <div class="card-header">
               나의 작성 글
               <c:if test="${!empty myHbList and !empty myQnaList}">
               <a href="/myapp/mypageMylist?order=homeboard" style="float:right;">더보기</a>
               </c:if>
               <c:if test="${!empty myHbList and empty myQnaList}">
               <a href="/myapp/mypageMylist?order=homeboard" style="float:right;">더보기</a>
               </c:if>
               <c:if test="${!empty myQnaList and empty myHbList}">
               <a href="/myapp/mypageMylist?order=qnaboard" style="float:right;">더보기</a>
               </c:if>
               
            </div>
            
            <div class="card-body"><!-- card-body 시작 -->
               <div class="row">
               <c:if test="${empty myHbList and empty myQnaList}">
               <div style="width:100%;height:100px;text-align:center;line-height:100px;">
                     아직 작성한 글이 없습니다
               </div>
               </c:if>
               
               
               <c:if test="${!empty myHbList}">
               
               <c:forEach var="vo" items="${myHbList }" end="3">
               
                  <div class="col-3">
                     <div class="thumbnail">
                        <a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
                     </div>
                     <div class="card-body">
                        <div class="card-title">
                           <a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
                        </div>
                     </div>
                  </div>
               
               </c:forEach>
               </c:if>
               
               <c:if test="${!empty myQnaList}">
               <c:forEach var="vo" items="${myQnaList }" end="3">
                  <div class="col-3">
                     <div class="card-body qna-card">
                        <div class="card-title">
                           <a href="/myapp/qnaView?q_no=${vo.q_no }">${vo.title }</a>
                        </div>
                        <hr/>
                        <div class="qna-content">
                           ${vo.content }
                        </div>
                        
                     </div>
                  </div>
               </c:forEach>
               </c:if>
               </div>
               
               
               
            
            </div>
         </div>
         
      </div>      
   </div>
</div>