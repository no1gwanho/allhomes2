<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chkBox").prop("checked", true);
			} else {
				$(".chkBox").prop("checked", false);
			}
		});
		
		$(".chkBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		$("#orderCancel").click(function(){
			var confirm_val = confirm("주문을 취소하시겠습니까?");
			if(confirm_val){
				var chkList="";
				
				$("input[class='chkBox']:checked").each(function(i){
					if(i>0){
						chkList += ",";
					}
					chkList += $(this).val();
				});
				
				location.href='<%=request.getContextPath() %>/orderCancel?pc_no='+chkList;
			}
		})
		
	      $("#selectDelBtn").click(function() {
	          var confirm_val = confirm("주문 내역을 삭제하시겠습니까?");
	          if (confirm_val) {
	             
	             var chkList="";
	             
	             $("input[class='chkBox']:checked").each(function(i) {
	                if(i > 0){
	                   chkList += ",";
	                }
	                chkList += $(this).val();
	             });
	             
	             location.href='<%=request.getContextPath()%>/orderListDel?pc_no='+chkList;
	          }
	       });
	})
</script>
<style>
	.col-3{
	      text-align:center;
	      margin-bottom:10px;
	}
	#myShopping{
		text-align:center;
		margin-top:40px;
		height:200px;
	}
	#state{
		float:left;
		background-color: #eeee;
		width:14%;
		margin:5px;
		display:inline-block;
		vertical-align:middle;
	}
	#myShopping hr{
		width:70%;
	}
	
	#searchDetail input{
		margin-right:10px;
	}
	#searchDetail input{
		margin-right:10px;
	}
	.nav nav-tabs, .nav-item{
		list-style-type:none;
	}
	 .container{
      font-family: 'SCDream3';
   }
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div id="myShopping">
				<div id="state"><br/>입금 대기<hr>${cntPre}건<br/><br/></div>
				<div id="state"><br/>결제완료<hr>${cntConfirm}건<br/><br/></div>
				<div id="state"><br/>배송중<hr>${cntDelivery}건<br/><br/></div>
				<div id="state"><br/>배송완료<hr>${cntDeliveryDone}건<br/><br/></div>
				<div id="state"><br/>구매확정<hr>${cntConfirmPur}건<br/><br/></div>
				<div id="state"><br/>리뷰완료<hr>${cntReviewDone}건<br/><br/></div>
				
			</div>
		
		<div>
       		
       		
			<form id="searchDetail" class="form-inline" style="display:none">
				<br/><br/><br/>
				<div class="form-group">
					<input class="form-control" type="text" placeholder="YYYY-MM-DD">-&nbsp;<input  class="form-control" type="text" placeholder="YYYY-MM-DD">
				</div>
				
				<select class="form-control">
					<option selected>전체</option>
					<option>입금대기</option>
					<option>결제완료</option>
					<option>배송준비</option>
					<option>배송중</option>
					<option>배송완료</option>
					<option>구매확정</option>
				</select>
				<input class="form-control" type="submit" value="검색" style="background-color:#EE8374;color:white;margin-left:10px;"/>
			</form>
		</div>
		</div><!-- col-lg-12 끝 -->
	</div>
	<br/>
<!-- 탭메뉴 시작 -->
	<div class="row">
		<div class="col-12">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#orderList">주문내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#cancelList">취소내역</a>
				</li>               
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="orderList">
					<div class="row" style="margin:10px 0px 0px 10px;">
						<div class="col-8" style="margin-bottom:25px;">
							<input type="checkbox" id="allCheck">&nbsp;&nbsp;모두 선택
						</div>
						<div class="col-4" style="text-align:right;margin-bottom:25px;">
							<button id="orderCancel" class="btn btn">주문취소</button>&nbsp;&nbsp;
							<button id="selectDelBtn" class="btn btn-secandary">삭제</button>							
						</div>
						<c:if test="${empty list }">
							아직 주문한 내역이 없습니다.
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="p" items="${list }">
							<c:if test="${p.chk_c == 0 }">
								<div class="col-2">
									<input type="checkbox" class="chkBox" value="${p.pc_no }">&nbsp;&nbsp;
									<img src="<%=request.getContextPath() %>/resources/upload/productImg/${p.s_no}/${p.main_img}" style="widht:180px;height:120px;"/>
								</div>
								<div class="col-5">
									<b>${p.pd_name }</b><br/>
									<c:if test="${p.o_value == null }">
										옵션없음 / ${p.num }
									</c:if>
									<c:if test="${p.o_value != null }">
										옵션 : ${p.o_value }<br/>구매수량 : ${p.num } 개
									</c:if>
									<br/>주문번호 : ${p.pc_no }<br/>주문일자 : ${p.pc_date }
								</div>
								<div class="col-2">
									<b>현재 주문배송 상태</b><br/>${p.status }
								</div>
								<div class="col-3">
									<c:if test="${p.status eq '결제완료' || p.status eq '배송중' || p.status eq '배송완료'}">
										<a href="https://www.doortodoor.co.kr/parcel/pa_004.jsp" target="_blank"><button class="btn btn-secondary">배송추적</button></a><br/>
										<a href="/myapp/setInPurchase?pc_no=${p.pc_no }"><button class="btn btn-secondary" style="background-color:#ee8374;color:fff;border:0;margin-top:10px;">구매확정</button></a>
									</c:if>
									<c:if test="${p.status eq '구매확정' && p.confirm eq 'Y'}">
										<form method="post" action="/myapp/reviewWrite?pc_no=${p.pc_no }">
											<button class="btn btn-secondary" style="background-color:#ee8374;color:fff;border:0;margin-bottom:10px;">리뷰쓰기</button><br/>
										</form>
										<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><button class="btn btn-secondary">재구매</button></a>
									</c:if>
									<c:if test="${p.confirm eq 'Y' && p.status eq '리뷰완료' }">
										<form method="post" action="/myapp/storeDetail?pd_no=${p.pd_no }">
											<button class="btn btn-secondary" style="background-color:#ee8374;color:fff;border:0;margin-bottom:10px;">리뷰확인</button><br/>
										</form>																						
										<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><button class="btn btn-secondary">재구매</button></a>
									</c:if>

									</div>
								<div class="col-12" style="margin-bottom:25px;">
									<hr/>
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="tab-pane fade show activ" id="cancelList">
					<div class="row" style="margin:10px 0px 0px 10px;">
						<div class="col-8" style="margin-bottom:25px;">
							<input type="checkbox" id="allCheck">&nbsp;&nbsp;모두 선택
						</div>
						<div class="col-4" style="text-align:right;margin-bottom:25px;">
							<button id="delBtn" class="btn btn-secandary">삭제</button>							
						</div>
						<c:if test="${empty cList }">
							아직 취소한 내역이 없습니다.
						</c:if>			
						<c:if test="${!empty cList }">
							<c:forEach var="c" items="${cList }">
								<c:if test="${c.chk_c == 1 }">
									<div class="col-12"><hr/></div>
									<div class="col-2">
										<input type="checkbox" class="chkBox">&nbsp;&nbsp;
										<img src="<%=request.getContextPath() %>/resources/upload/productImg/${c.s_no}/${c.main_img}" style="widht:180px;height:120px;"/>
									</div>
									<div class="col-12">
										<b>${c.pd_name }</b><br/>
										<c:if test="${c.o_value == null }">
											옵션없음 / ${c.num }
										</c:if>
										<c:if test="${c.o_value != null }">
											${c.o_value } / ${c.num } 개
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</c:if>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>