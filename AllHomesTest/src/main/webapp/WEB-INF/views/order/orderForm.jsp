<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	input{
		margin-top:5px;
	}
</style>
<script>
	$(function(){
		$('#payBtn').click(function(){
			location.href="/myapp/payForm"
		});
	});
</script>
<br/>
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
		<div class="mb-4" style="border-bottom:1px solid #eee"><h4>주문상품</h4></div>
		
		<c:set var="totalP" value="0"/>
		<c:forEach var="vo" items="${oList}">
			<div class="col-lg-12 mr-2 ml-2 mb-2">
				<div class="row">
					<div class="col-2" style="border-bottom: 1px solid #eee">
						<img
							src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"
							style="height:200px;" />
					</div>
					<div class="col-7" style="border-bottom: 1px solid #eee">
						<p>${vo.s_name}] ${vo.pd_name }</p>
						<p>옵션:${vo.o_value} / ${vo.num}개</p>
						<p>가격:${vo.price}<br /> (-)할인: ${vo.discount}%<br />
						<b>최종 가격: ${vo.price-(vo.discount*vo.price)}원</b></p>
						<c:set var="totalP" value="${totalP + (vo.price-(vo.discount*vo.price)) }"/>
					</div>
					<div class="col-2" style="border-bottom: 1px solid #eee">
						배송비: ${vo.shipping_c}원<br /> 
					</div>
				</div>
			</div>
		</c:forEach>
		
		<br/>
		<!-- ---------------------------------------------------------------- -->
		<div class="row">
			<div class="col-9">
				총 상품 금액
			</div>
			<div class="col-3">
				<b><c:out value="${totalP}"/>원</b>
			</div>
			<div class="col-9">
				배송비
			</div>
			<div class="col-3">
				2,500
			</div>
			<div class="col-12" style="margin-left:1025px;">
				<h4><b></b></h4>
			</div>
		</div>
		<hr/>
		<br/>	
		<!-- ---------------------------------------------------------------- -->
		<div class="row">
			<div class="col-2" style="border-bottom:1px solid #eee"><h4>배송지</h4></div>
			<div class="col-10" style="border-bottom:1px solid #eee">
				<button style="outline:0;border:0;background-color:#ee8374;color:#fff;">배송지 선택</button>
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
		<div style="border-bottom:1px solid #eee"><h4>결제수단</h4></div>		
		<div class="row">
			<div class="col-3" style="margin-bottom:5px;">
				<img src=""/>카드결제
			</div>
			<div class="col-3" style="margin-bottom:5px;">
				<img src=""/>계좌이체
			</div>
		</div>
		<div id="payNotice" style="width:1400px;height:300px;background-color:#eee;">
			공지사항 및 결제 주의사항			
		</div>		
		<br/>
		<div>
			<input type="checkbox"> 결제 진행 필수사항 제공에 동의합니다.
			<button id="payBtn" class="btn-block" style="outline:0;border:0;background-color:#ee8374;color:#fff;">결제하기</button>
		</div>	
	</div>
</div>
<br/>