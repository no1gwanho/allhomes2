<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		$("#orderCancel").click(function(){
			var confirm_val = confirm("주문을 취소하시겠습니까?");
			if(confirm_val){
				var chkList="";
				
				$("input[class='chBox']:checked").each(function(i){
					if(i>0){
						chkList += ",";
					}
					chkList += $(this).val();
				});
				
				location.href='<%=request.getContextPath() %>/orderCancel?pc_no='+chkList;
			}
		})
	})
</script>
<style>
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
			<a href="" class="btn btn-secondary">
           		<span class="text">1개월</span>
       		</a>
       		<a href="" class="btn btn-secondary">
           		<span class="text">3개월</span>
       		</a>
       		<a href="" class="btn btn-secondary">
           		<span class="text">6개월</span>
       		</a>
       		&nbsp;&nbsp;&nbsp;
       		<a href="" class="btn" style="background-color:#EE8374;color:white"  id="searchFrm">
           		<span class="text">상세조회</span>
       		</a>
       		
       		
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
					<a class="nav-link active" data-toggle="tab" href="#order">주문내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#cancel">취소내역</a>
				</li>				
			</ul>
					<c:forEach var="p" items="${list }">
			<div class="tab-content">
	
				<div class="tab-pane fade show active" id="order">
						<c:if test="${empty p && p.chk_c==0 }">
							<div style="margin:50px auto;height:800px;">
								<span style="font-size:1.2em;color:#1f1f1f;text-align:center;">주문 내역이 없습니다.</span>
							</div>
						</c:if>
						<c:if test="${!empty p && p.chk_c==0 }">
							<div class="row" style="margin:25px;">
								<div class="col-md-9">
									<input type ="checkbox" name="allCheck" id="allCheck" style="background-color:#ee8374;margin-right:10px;"/><label for = "allCheck">모두 선택</label>
								</div>
								<div class="col-md-3" style="text-align:right;">
									<button class="btn btn" id="orderCancel" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">주문취소</button>
								</div>
							</div>
						</c:if>

							<div class="row">
								<div class="col-3" style="margin-bottom:15px;border-bottom:1px solid #ddd;padding:5px;">
									주문번호 : ${p.pc_no }
								</div>
								<div class="col-9" style="margin-bottom:15px;border-bottom:1px solid #ddd;padding:5px;text-align:right;">
									주문일자 : ${p.pc_date }
								</div>
							</div>
							<div class="row" style="margin-bottom:35px;">
								<div class="col-3" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
									<input type="checkbox" name="chBox" class="chBox" value=${p.pc_no }/>
									<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${p.s_no}/${p.main_img}" style="border-radius:5%;width:180px;height:100px;margin-right:10px;margin-bottom:10px;"/></a>
								</div>
								<div class="col-6" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
									<b style="padding-top:10px;">${p.pd_name }</b><br/>
									결제금액 : ${p.price * p.num + p.shipping_c }원<br/>
									<c:if test="${p.o_value == null }">
										수량 : ${p.num }	/ 업체명 : ${p.s_name }<br/>
									</c:if>
									<c:if test="${p.o_value != null }">
										옵션 : ${p.o_value} / 수량 : ${p.num } / 업체명 : ${p.s_name }<br/>
									</c:if>
									
								</div>
								<div class="col-3" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
									<c:if test="${p.confirm != 'Y' }">
										<a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">배송추적</button></a>
										<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">구매확정</button>
									</c:if>
									<c:if test="${p.confirm == 'Y' }">
										<form method="post" action="/myapp/reviewWrite?pc_no=${p.pc_no }">
											<input type="submit" class="btn btn" value="리뷰쓰기" id="reviewBtn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;"/>
										</form>
										<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><button type="button" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">재구매하기</button></a>
									</c:if>
								</div>
								<hr/>
							</div>
           		</div>
				<div class="tab-pane fade" id="cancel">
					<c:if test="${empty p && p.chk_c>0}">
						<div style="margin:50px auto;height:800px;">
							<span style="font-size:1.2em;color:#1f1f1f;text-align:center;">주문 취소 내역이 없습니다.</span>
						</div>
					</c:if>	
					<c:if test="${!empty p && p.chk_c>0}">
						<div class="row">
							<div class="col-12" style="margin-bottom:15px;border-bottom:1px solid #ddd;padding:5px;">
								주문번호 : ${p.pc_no }
							</div>
						</div>
						<div class="row" style="margin-bottom:35px;">
							<div class="col-3" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
								상품명
							</div>
							<div class="col-9" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
								<b style="padding-top:10px;">${p.pd_name }</b><br/>				
							</div>
							<div class="col-3" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
								취소금액
							</div>
							<div class="col-9" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
								${p.total_p }
							</div>
							<hr/>					
						</div>	
						</c:if>
				</div>
			</div>
									</c:forEach>
		</div>	
	</div>	      
</div>
