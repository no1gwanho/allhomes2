<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/69f9d4fad2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/allhomes_header2.css" type="">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<style>
	.container{
		font-family:'SCDream3';
		margin:45px auto;
		padding:0;
		width:1400px;
	}
	.top{
		border-bottom:2px solid #1f1f1f;
		padding:5px;
	}
	h1{
		color:1f1f1f;
		margin-bottom:25px;
	}
</style>
</head>
<body>
<div class="container">
	<form method="post" action="/myapp/orderCancelOk?pc_no=${vo.pc_no }">
		<input type="hidden" name="pd_no" value="${vo.pd_no }">
		<h1>주문 취소 페이지</h1>
		<div class="row">
			<div class="col-12" style="color:#1f1f1f;padding:5px;margin-top:25px;border-bottom:2px solid #ddd;">
				<span style="font-size:1.2em;color:#1f1f1f;">주문정보</span>
			</div>
			<div class="col-3" style="padding:5px;">주문번호</div>
			<div class="col-9" style="padding:5px;">${vo.pc_no }</div>
			<div class="col-3" style="padding:5px;">주문일</div>
			<div class="col-9" style="padding:5px;">${vo.pc_date }</div>
			
			<div class="col-12" style="color:#1f1f1f;padding:5px;margin-top:25px;border-bottom:2px solid #ddd;">
				<span style="font-size:1.2em;color:#1f1f1f;">상품정보</span>
			</div>
			<div class="col-3" style="padding:5px;">상품명</div>
			<div class="col-9" style="padding:5px;">${vo.pd_name }</div>
			<c:if test="${vo.o_value != null }">
				<div class="col-3" style="padding:5px;">옵션</div>
				<div class="col-9" style="padding:5px;">${vo.o_value }</div>							
			</c:if>
			<c:if test="${vo.o_value == null }">
				<div class="col-3" style="padding:5px;">옵션</div>
				<div class="col-9" style="padding:5px;">없음</div>							
			</c:if>	
			<div class="col-3" style="padding:5px;">수량 </div>
			<div class="col-9" style="padding:5px;">${vo.num} 개</div>					
			
			<div class="col-12" style="color:#1f1f1f;padding:5px;margin-top:25px;border-bottom:2px solid #ddd;">
				<span style="font-size:1.2em;color:#1f1f1f;">환불정보</span>
			</div>
			<div class="col-3" style="padding:5px;">
				취소금액 
			</div>
			<div class="col-9" style="padding:5px;">${vo.total_p } 원</div>
			<div class="col-3" style="padding:5px;">취소사유</div>
			<div class="col-9" style="padding:5px;"><input type="radio" name="rating" value="5"> <span style="margin-right:11px;color:#1f1f1f;">단순변심</span>
													<input type="radio" name="rating" value="4"> <span style="margin-right:11px;color:#1f1f1f;">취소 후 옵션 재선택</span>
													<input type="radio" name="rating" value="4"> <span style="margin-right:11px;color:#1f1f1f;">다른 상품 구매</span>						
													<input type="radio" name="rating" value="3"> <span style="margin-right:11px;color:#1f1f1f;">기타</span><br/>
			</div>							
			<div class="col-3" style="padding:5px;">환불수단 </div>
			<div class="col-9" style="padding:5px;">
				환불절차에 따라 결제 정보로 자동환불이 됩니다.<br/>
				<span style="font-size:0.9em;color:#1f1f1f;">
<!-- 					계좌 환불 - 취소 신청 확인 후 즉시 환불(1~2일 소요)<br/>
					신용카드 환불 -  -->카드사로 결제 취소 요청이 전달된 후 환불까지 평일 기준 3~7일이 소요
				</span>
			</div>
		</div>
		<div class="row" style="margin-top:45px;">
			<div class="col-6" style="text-align:right;">
				<input type="submit" class="btn btn" style="background-color:#ee8374;color:#fff;" value="신청">
			</div>
			<div class="col-6" style="text-align:left">
				<input type="button" class="btn btn-secondary" value="취소">
			</div>	
		</div>
	</form>		
</div>
</body>
</html>