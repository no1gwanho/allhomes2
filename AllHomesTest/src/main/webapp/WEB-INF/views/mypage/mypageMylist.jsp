<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style>
   .container{
      max-width:1400px;
      margin: 0 auto;
      font-family: 'SCDream3';
      text-align: center;
   }
   
   .col-3{
      text-align:center;
      margin-bottom:10px;
   }
   .scrap-title{
      font-family:'SCDream5';
      margin: 50px auto 50px auto;
   }
   .profile_pic{
      width:35px;
      border-radius: 45%;
   }

   .thumbnail{
      padding:0px;
      margin:0 auto;
      width:270px;
      height: 180px;
      overflow: hidden;
      border-radius: 5%;
   }
   
   .thumbnail img {
      width:100%;
      text-align: center;
      overflow: hidden;
   }
   
   .scrap-owner-info{
      margin: 30px auto 35px auto;
      color:black;
      font-size:20px;
   }
   .card-body{
      margin:0 auto;
   }
   .card-title{
      text-align:center;
   }
   
   .card-title {
      padding:0px;
      font-size: 17px;
      font-weight: bold;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
   }
   
   .filter-option-inner{
      font-size:18px;
      font-family: 'SCDream5';
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
<script>
   $(function(){
   
   

   $('#order').change(function(){
      var selectedOrder = $("#order option:selected").val();
      location.href="/myapp/mypageMylist?order="+selectedOrder;
   });
});




</script>

<div class="container">
   <h3 class="scrap-title">내가쓴글</h3>
   
   <div class="scrap-owner-info">
   <img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${m_pic}"/>
   ${nickname } 
   </div>
   <div class="row" id="orderSelect">
            
            <select class="selectpicker show-tick" id="order" name="order">
               <option class="orderName" value="homeboard" 
                  <c:if test="${order == 'homeboard'} ">selected</c:if>>집들이</option> 
               <option class="orderName" value="qnaboard" 
                  <c:if test="${order == 'qnaboard' }">selected</c:if>>질문과답변</option>
            </select>
   </div>
   <br/>
   <br/>
   <c:if test="${order eq 'homeboard' }">
      <div class="row">
      <c:forEach var="vo" items="${hbList}">

      <div class="col-3">
         <div class="thumbnail">
            <a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
         </div>
         <div class="card-body">
            <div class="card-title">
               <a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
            </div>
            <p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }
            </p>
            </div> 
         </div>
      </c:forEach>
   </div>



   </c:if>
   
   
   <c:if test="${order eq 'qnaboard' }">

      
      <div class="row">
      <c:forEach var="vo" items="${qnaList }">
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
      </div>
      
      

   </c:if>
   
   <div style="margin-top:100px;"></div>

   
   
   
   

</div>