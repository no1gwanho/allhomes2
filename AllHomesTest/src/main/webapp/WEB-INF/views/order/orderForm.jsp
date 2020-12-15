<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
   input{
      margin-top:5px;
   }
 
	.col-3, .col-lg-3, .col-xs-6{
		text-align:center;
		margin-bottom:10px;
	}
	.container{
		font-family: 'SCDream3';
	}
	td{
		height:120px; 
		line-height:120px;
	}

</style>
<script>
	$(function(){
		
		
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
			$("#a_codeOk").val($("#a_code").val());  
			
			$("#addrListDiv").css("display","none");
		});
	});

</script>
<br/>
<div class="container">
	<div class="col-lg-12">
		<div class="card mb-3" style="border:0px">
				<div class="card-header">
					상품
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					
					<table class="table">
						<thead>
							<tr>
								
								<th>IMAGE</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								
							</tr>
						</thead>
						<tbody>
						
							<c:set var="totalP" value="0"/>
		
							<c:forEach var="vo" items="${oList}">
								
										<input type="hidden" value="${vo.c_no}"/>
										<td>
											<img
												src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"
												style="height:200px;" />
										</td>
										<td>
											${vo.s_name}] ${vo.pd_name } [옵션:${vo.o_value}]
										</td>
										<td>
											${vo.num}개
										</td>
										<td>
											${vo.price * vo.num - vo.discount}원
										
										</td>
											
											<c:set var="totalP" value="${totalP + vo.price*vo.num-(vo.discount*vo.price*vo.num/100) }"/>
								
											<c:set var="shipping_c" value="${shipping_c + vo.shipping_c}"/>
										
							</c:forEach>
								
						</tbody>
					</table>
					
					<br/>
					<br/>
					<hr/>
					
					<div>
						<div class="col-lg-6" style="float:right;font-size:20px;">
							<div class="row">
								<div class="col-lg-6">
									배송비
								</div>
								<div class="col-lg-6" style="text-align:right">
									<b><fmt:parseNumber value="${shippint_c}" integerOnly="true"/>원</b>
								</div>
								
								<div class="col-lg-6">
									상품
								</div>
								<div class="col-lg-6" style="text-align:right">
									<b><fmt:parseNumber value="${totalP}" integerOnly="true"/>원</b>
								</div>
								
								
							</div>
								
						</div>
						<br/><br/><br/><hr/>
						
						<div class="col-lg-6" style="float:right;font-size:20px;">
							<div class="row">
								<div class="col-lg-6" style="font-size:30px;">
									<b>총 가격</b>
								</div>
								<div class="col-lg-6" style="text-align:right;font-size:30px;color:#EE8374">
									 = <span id="totalPrice" style="color:#EE8374">0</span> 원 
								</div>
							</div>
						</div>
					</div>
				</div>
		</div><!-- card 끝 -->
	
	
	
	
	<div class="card mb-3" style="border:0px">
				<div class="card-header">
					배송지
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					<button id="selectAddrBtn" class="btn btn-secondary mb-3 mt-3">배송지 선택</button>
					
		
 
		<div class="col-lg-12" id="addrListDiv" style="display:none">
			<div class="row">
				<c:forEach var="aVO" items="${aList}">
					<div class="col-lg-6">
					
						<div class="row">
							<input type="hidden" id="a_code" value="${aVO.a_code}"/>
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
			<form action="<%=request.getContextPath()%>/orderPurchase" method="post"><!-- 폼 시작 -->
			<input type="text" name="c_no" value="${c_no}"/>
			<div class="row">
							<input type="number" name="a_code" id="a_codeOk"/>
							<input type="hidden" name="shipping_c" value="2500"/>
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
							<input class="col-lg-8 form-control" type="text" name="memo" id="memo"/>
							  
 
			</div>
				</div>
		</div><!-- card 끝 -->
	
	
	
		
		
		
		<!-- ---------------------------------------------------------------- -->
		
		
		<!-- ---------------------------------------------------------------- -->
		<div class="my-2"></div><br/><br/>
		<div class="col-2"><h4>주문자</h4></div>
		<hr>

	
		<div class="row">
			<input type="hidden" name="c_no" value="${oList}"/>
			<input type="hidden" name="m_no" value="${rVO.m_no}"/><!-- 회원번호 -->
			<input type="text" name="userid" value="${rVO.userid}"/> <!-- 아이디 -->
			<input type="number" name="total_p" value="${totalP}"/><!-- 결제 총 가격 -->
			
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
				<input type="text" value="${rVO.tel}"/><br/>
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


		
		<div style="margin-top:45px;border-bottom:1px solid #eee"><h4>거래 관련 공지사항</h4></div>		
		<div id="payNotice">
			<ul>
				<li>올홈즈스토리의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 이베이코리아 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</li>
				<li>이베이코리아 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-016-00003입니다. </li>
				<li>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.</li>
				<li>당사의 결제시스템을 통하지 않고 판매자에게 직접 상품대금을 지급하는 직거래 시 피해가 발생할 수 있으므로 주의 바랍니다.</li>
				<li>직거래로 인해 발생한 피해에 대해 올홈즈스토리는 책임을 지지 않습니다.</li>
				<li>전자상거래 등에서의 소비자보호법에 관한 법률에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 취소할 수 있습니다.</li>
			</ul>			
	
		</div>
		<br/>
		<div>
			<input type="checkbox"> 결제 진행 필수사항 제공에 동의합니다.
		
			<button id="payBtn" type="submit" class="btn-block" style="outline:0;border:0;background-color:#ee8374;color:#fff;">결제하기</button>
		</div>	
		</form><!-- 여기까지 폼 -->
	</div>
			<button id="payBtn" class="btn-block" style="outline:0;border:0;background-color:#ee8374;color:#fff;">결제하기</button>

</div>