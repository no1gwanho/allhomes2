<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h2>장바구니</h2>
	<div class="row">
		<div class="col-md-7">
			<input type ="checkbox" value="allChk" style="background-color:#ee8374;"/>&nbsp;모두 체크
		</div>
		<div class="col-md-2"><button class="btn btn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">선택삭제</button></div>
	</div>
	<br/>
	<div class="container">
		<div class="row">
			<div class="col-md-2"><input type="checkbox"/>&nbsp;<img style="width:150px; height:125px;" src="<%=request.getContextPath()%>/resources/img/tb/tb01.png"/></div>
			<div class="col-md-3"><b style="font-size:1.5em;">상품명</b></div>
			<div class="col-md-3">
		  		<label>
		  			옵션 : 
					<select class="input-select">
						<option value="0">옵션1</option>
						<option value="0">옵션2</option>
						<option value="0">옵션3</option>
					</select>
				</label>
				<br/>수량 : <input type="number" size="2" style="margin-bottom:5px;"/>
				<br/><button class="btn btn" style="font-size:0.9em;background-color:#ee8374;color:#fff;border:0;">수정</button>&nbsp;&nbsp;
				<button class="btn btn" style="font-size:0.9em;background-color:#ee8374;color:#fff;border:0;">삭제</button>
			</div>
			<div class="col-md-4">
				총 상품금액&nbsp;&nbsp;50000원<br/>
				총 배송비&nbsp;&nbsp;0원<br/>
				총 할인금액&nbsp;&nbsp;3000원<br/>
				<b>결제금액&nbsp;&nbsp;125,800</b><br/>
				<a href="/myapp/order"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;">상품구매</button></a>
				<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;">위시리스트</button>
			</div>
		</div>
	</div>
</div>
<br/>
<div>
	
</div>
