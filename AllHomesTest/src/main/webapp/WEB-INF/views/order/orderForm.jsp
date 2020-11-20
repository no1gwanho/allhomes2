<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
   input{
      margin-top:5px;
   }
</style>
<div class="container">
   <div id="title">
      <div class="row">
         <div class="col-12">
            <h2>주문/결제</h2>
            <br/>
         </div>
      </div>      
   </div>
   <div id="orderPd">
      <div style="border-bottom:1px solid #eee"><h4>주문상품</h4></div>
      <div class="row">
         <div class="col-3" style="border-bottom:1px solid #eee">
            <img src=""/>
         </div>
         <div class="col-7" style="border-bottom:1px solid #eee">
            [스토어명] 상품명<br>
            옵션 / 수량<br/>
            <b>가격</b>
         </div>
         <div class="col-2" style="border-bottom:1px solid #eee">
            배송료<br/>
            배송회사
         </div>
      </div>
      <br/>
      <!-- ---------------------------------------------------------------- -->
      <div class="row">
         <div class="col-2" style="border-bottom:1px solid #eee"><h4>배송지</h4></div>
         <div class="col-10" style="border-bottom:1px solid #eee">
            <button data-toggle="modal" data-target="#orderModalCenter" style="outline:0;border:0;background-color:#ee8374;color:#fff;">배송지 선택</button>
         </div>
      </div>
      <div class="row">
         <div class="col-2">
            받는분
         </div>
         <div class="col-10">
            <input type="text" name="username"/>
         </div>
         <div class="col-2">
            우편번호
         </div>
         <div class="col-10">
            <input type="text" name="a_code"/>
         </div>
         <div class="col-2">
            주소
         </div>
         <div class="col-10">
            <input type="text" name="addr"/><br/>
            <input type="text" name="addrdetail"/>
         </div>         
         <div class="col-2">
            휴대전화
         </div>
         <div class="col-10">
            <input type="text" name="tel"/>
         </div>
         <div class="col-2">
            배송메모
         </div>
         <div class="col-10">
            <input type="text" name="memo"/>
         </div>
      </div>
      <br/>
      <!-- ---------------------------------------------------------------- -->
      <div class="row">
         <div class="col-2" style="border-bottom:1px solid #eee"><h4>주문자</h4></div>
         <div class="col-10" style="border-bottom:1px solid #eee">
            <button style="outline:0;border:0;background-color:#ee8374;color:#fff;">배송정보와 동일</button>
         </div>
      </div>
      <div class="row">
         <div class="col-2">
            이름
         </div>
         <div class="col-10">
            <input type="text" name="username"/>
         </div>
         <div class="col-2">
            이메일
         </div>
         <div class="col-10">
            <input type="text" name="email"/>
         </div>
         <div class="col-2">
            휴대전화
         </div>
         <div class="col-10">
            <input type="text" name="tel"/><br/>
            <input type="checkbox">SMS 수신 동의
         </div>                  
      </div>
      <br/>
      <!-- ---------------------------------------------------------------- -->
      <div style="border-bottom:1px solid #eee"><h4>주문자</h4></div>
      <div class="row">
         <div class="col-9">
            총 상품 금액
         </div>
         <div class="col-3">
            30,500
         </div>
         <div class="col-9">
            배송비
         </div>
         <div class="col-3">
            2,500
         </div>
         <div class="col-12" style="margin-left:1025px;">
            <h4><b>33,000원</b></h4>
         </div>
      </div>
      <br/>   
      <!-- ---------------------------------------------------------------- -->      
      <div style="border-bottom:1px solid #eee"><h4>결제수단</h4></div>      
      <div class="row">
         <div class="col-3" style="margin-bottom:5px;">
			<label><input type="radio" name="" value="카드결제"/><img src=""/>카드결제</label>
         </div>
         <div class="col-3" style="margin-bottom:5px;">
            <label><input type="radio" name="" value="계좌이체"/><img src=""/>계좌이체</label>
         </div>
      </div>
      <div id="#orderTerms" class="collapse">
      	<h4> 결제/배송 주의사항 및 약관</h4>
      </div>
      <button type="button" data-toggle="collapse" data-target="#terms" style="outline:0;border:0;background-color:#ee8374;color:#fff;">약관 상세 보기</button>
	  <br/>
      <div>
         <input type="checkbox"> 결제 진행 필수사항 제공에 동의합니다.
         <button class="btn-block" style="outline:0;border:0;background-color:#ee8374;color:#fff;">결제하기</button>
      </div>   
   </div>
   <!-- 배송지 모달 창 -->
	<div class="modal fade" id="orderModalCenter" tabindex="-1" role="dialog" aria-labelledby="orderModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="orderModalCenterTitle">배송지 선택</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<div class="modal-body">
      				<div id="addrList">
      					<form>
		        			배송지명 : <input type="text" name="" value="우리집"/><br/>
		        			받는분 : <input type="text" name="username" value="최은빈"/><br/>
		        			우편번호 : <input type="text" name="a_code" value="10254"/><br/>
		        			주소 : <input type="text" name="addr" value="경기도 고양시 일산동구 지영동 229번길"/><br/>
		        			<input type="text" name="addrdetail" value="7-16 고개 아래 우측 첫집(복성농장)"/><br/>
		        			전화번호 : <input type="text" name="tel" value="010-5196-8803"/><br/>
        				</form>
        			</div>        			
      			</div>
      			<div class="modal-footer">
	        		<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">선택</button><button class="btn btn"style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">삭제</button><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">등록</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>
<br/>