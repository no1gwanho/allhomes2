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
		
		//배송지 선택
		$("#selectAddrBtn").click(function(){
			$("#addrListDiv").css("display","block");
		});
		
		//배송지 선택 OK
		$("#selectAddrOkBtn").click(function(){
			$("#receiverOk").val($("#receiver").val());
			$("#zipcodeOk").val($("#zipcode").val());
			$("#addrOk").val($("#addr").val()); 
			$("#addrdetailOk").val($("#addrdetail").val());
			$("#telOk").val($("#tel").val());  
			
			$("#addrListDiv").css("display","none");
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
					<input type="hidden" value="${vo.c_no}"/>
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
				<button id="selectAddrBtn" style="outline:0;border:0;background-color:#ee8374;color:#fff;">배송지 선택</button>
			</div>
		</div>

		<div class="col-lg-12" id="addrListDiv" style="display:none">
			<div class="row">
				<c:forEach var="aVO" items="${aList}">
					<div class="col-lg-6">
						<input type="radio" name="a_code" value="${aVO.a_code}" />
						<div class="row">
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">받는분</span>
							<input class="col-lg-8 form-control" type="text" id="receiver" value="${aVO.receiver}" /> 
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">우편번호</span>
							<input class="col-lg-8 form-control" type="text"  id="zipcode"value="${aVO.zipcode}" />
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">주소</span>
							<input class="col-lg-8 form-control" type="text" id="addr" value="${aVO.addr}" /><br />
							<span class="col-lg-4" style="color: #000000; line-height: 40px;"></span>
							<input class="col-lg-8 form-control" type="text" id="addrdetail" value="${aVO.addrdetail}" />
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">연락처</span>
							<input class="col-lg-8 form-control" type="text"  id="tel" value="${aVO.tel}" />

						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-12">
				<button id="selectAddrOkBtn"
					style="outline: 0; border: 0; background-color: #ee8374; color: #fff; margin: 0 auto;">선택</button>
			</div>
			
			<br/><hr/><br/>
			
						
			
		</div>
			<div class="row">
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">받는분</span>
							<input class="col-lg-8 form-control" type="text" id="receiverOk"
								name="receiver"/>
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">우편번호</span>
							<input class="col-lg-8 form-control" type="text" name="zipcode" id="zipcodeOk"/>
							<span class="col-lg-4"style="color: #000000; line-height: 40px;">주소</span> 
							<input class="col-lg-8 form-control" type="text" name="addr" id="addrOk"/><br />
							<span class="col-lg-4"style="color: #000000; line-height: 40px;"></span>
							<input class="col-lg-8 form-control" type="text" name="addrdetail" id="addrdetailOk"/> 
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">연락처</span>
							<input class="col-lg-8 form-control" type="text" name="tel" id="telOk"/>
							<span class="col-lg-4" style="color: #000000; line-height: 40px;">배송 메모</span>
							<input class="col-lg-8 form-control" type="text" name="memo" id="telOk"/>
							  

			</div>
		
		<!-- ---------------------------------------------------------------- -->
		<div class="my-2"></div><br/><br/>
		<div class="col-2"><h4>주문자</h4></div>
		<hr>
		
		<div class="row">
			<div class="col-2">
				이름
			</div>
			<div class="col-10">
				<input type="text" name="username" value="${rVO.username}"/>
			</div>
			<div class="col-2">
				이메일
			</div>
			<div class="col-10">
				<input type="text" name="email" value="${rVO.email}"/>
			</div>
			<div class="col-2">
				휴대전화
			</div>
			<div class="col-10">
				<input type="text" name="tel" value="${rVO.tel}"/><br/>
			</div>						
		</div>
		<br/>
		
		<!-- ---------------------------------------------------------------- -->		
		<div style="border-bottom:1px solid #eee"><h4>결제수단</h4></div>		
		<div class="row">
			<div class="col-3" style="margin-bottom:5px;">
				<input type="radio" value="card" name="payment">
				<img src=""/>카드결제
			</div>
			<div class="col-3" style="margin-bottom:5px;">
				<input type="radio" value="account" name="payment">
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