<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.col-3, .col-lg-3, .col-xs-6{
		text-align:center;
		margin-bottom:10px;
	}

	.container{
		font-family: 'SCDream3';
	}

</style>
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
		$("#selectDelBtn").click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			if (confirm_val) {
				var checkArr = new Array();
				$("input[class='chBox']:checked").each(function() {
				});
			}
		});
		
		
		
		$("#purchaseBtn").click(function(){
			var chkList="";
			
			$("input[class='chBox']:checked").each(function(i) {
				if(i > 0){
					chkList += ",";
				}
				chkList += $(this).val();
			});
			alert(chkList); //c_no 배열로 저장
			
			location.href='<%=request.getContextPath()%>/order?c_no='+chkList;
		});
	});
</script>
<br/>
<div class="container">
	<div class="col-lg-12">
		<div class="card mb-3" style="border:0px">
				<div class="card-header">
					장바구니
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					<table class="table">
						<thead>
							<tr>
								<th>
									<input type ="checkbox" name="allCheck" id="allCheck" style="background-color:#ee8374;"/><label for = "allCheck"></label>
								</th>
								<th>IMAGE</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list }">
									<form method="post" action="/myapp/order?userid=${c.userid }">
										<input type="hidden" name="${c.m_no }" value="${c.m_no }">
										
											<div class="col-3">
												<input type="checkbox" name="chBox" class="chBox" value="${c.c_no }">
												<script>
													$(".chBox").click(function(){
														$("#allCheck").prop("checked", false);
													});
												</script>
												<img style="maring-left:15px;width:150px; height:120px;" src="<%=request.getContextPath()%>/resources/upload/productMainImg/${c.s_no}/${c.main_img}"/>
											</div>
											<div class="col-9" style="margin-left:15px;text-align:center">
												<span style="font-size:0.8em;">상품명 : ${c.pd_name }<br/>
													<c:if test="${c.o_value == null }">
														옵션 : 없음
													</c:if>
													<c:if test="${c.o_value != null }">
														옵션 : ${c.o_value}	
													</c:if>	&nbsp;&nbsp;/&nbsp;&nbsp;
													수량 : ${c.num }개<br/>
												</span>
												<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">수정</button>&nbsp;&nbsp;
												<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">삭제</button>
											</div>
						
										
												<span style="font-size:0.8em;">
													결제금액 : ${c.discount }원	&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
													배송비 : ${c.shipping_c }원
												</span>
											
												<input type="submit" class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;" value="상품구매"/>
												<a href="/myapp/wishList?pd_no=${c.pd_no}"><button id="wish" class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;">위시리스트</button></a>
										
								</form>
								</c:forEach>
						
						
						
						
						
						</tbody>
					</table>
				</div>
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col-md-7">
			<input type ="checkbox" name="allCheck" id="allCheck" style="background-color:#ee8374;"/><label for = "allCheck">모두 선택</label>
			
		</div>
		<div class="col-md-2">
			<button class="btn btn" id="selectDelBtn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">선택 삭제</button>
			<button class="btn btn" id="purchaseBtn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">구매</button>
			
		</div>
	</div>
	<br/>
	<c:forEach var="c" items="${list }">
		<form method="post" action="/myapp/order?userid=${c.userid }">
			<input type="hidden" name="${c.m_no }" value="${c.m_no }">
			<div class="row" style="margin-top:15px;">
				<div class="col-3">
					<input type="checkbox" name="chBox" class="chBox" value="${c.c_no }">
					<script>
						$(".chBox").click(function(){
							$("#allCheck").prop("checked", false);
						});
					</script>
					<img style="maring-left:15px;width:150px; height:120px;" src="<%=request.getContextPath()%>/resources/upload/productMainImg/${c.s_no}/${c.main_img}"/>
				</div>
				<div class="col-9" style="margin-left:15px;text-align:center">
					<span style="font-size:0.8em;">상품명 : ${c.pd_name }<br/>
						<c:if test="${c.o_value == null }">
							옵션 : 없음
						</c:if>
						<c:if test="${c.o_value != null }">
							옵션 : ${c.o_value}	
						</c:if>	&nbsp;&nbsp;/&nbsp;&nbsp;
						수량 : ${c.num }개<br/>
					</span>
					<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">수정</button>&nbsp;&nbsp;
					<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">삭제</button>
				</div>
			</div>
			<div class="row" style="border-bottom:1px solid #eee;padding:15px;">
				<div class="col-7">
					<span style="font-size:0.8em;">
						결제금액 : ${c.discount }원	&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
						배송비 : ${c.shipping_c }원
					</span>
				</div>
				<div class="col-5">
					<input type="submit" class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;" value="상품구매"/>
					<a href="/myapp/wishList?pd_no=${c.pd_no}"><button id="wish" class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;">위시리스트</button></a>
				</div>
			</div>
	</form>
	</c:forEach>
</div>

<br/>