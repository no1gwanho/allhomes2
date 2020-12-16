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
	td{
		height:120px; 
		line-height:120px;
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
		
		//장바구니 삭제
		$("#selectDelBtn").click(function() {
			var confirm_val = confirm("장바구니를 삭제하시겠습니까?");
			if (confirm_val) {
				
				var chkList="";
				
				$("input[class='chBox']:checked").each(function(i) {
					if(i > 0){
						chkList += ",";
					}
					chkList += $(this).val();
				});
				
				location.href='<%=request.getContextPath()%>/cartDel?c_no='+chkList;
			}
		});
		
		
		//구매 페이지로 이동
		$("#purchaseBtn").click(function(){
			var chkList="";
			
			$("input[class='chBox']:checked").each(function(i) {
				if(i > 0){
					chkList += ",";
				}
				chkList += $(this).val();
			});
			//alert(chkList); //c_no 배열로 저장
			
			location.href='<%=request.getContextPath()%>/order?c_no='+chkList;
		});
		
		
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		var shipping_c = 0; //배송비
		var dc_price = 0; //상품가격
		
		
		//가격과 배송가격 값 출력
		$(".chBox").change(function(){
		    
		     if($(this).is(":checked")){
		    	shipping_c += Number($(this).next().val()); //배송비
		    	dc_price += Number($(this).next().next().val()); //가격
			     
		     }else{
		    	 shipping_c -= Number($(this).next().val()); //배송비
			     dc_price -= Number($(this).next().next().val()); //가격
		     }
		     
		     //alert("dc_price="+price+"ship"+shipping_c);
		     
		     $("#price").html(price);
		     $("#ship").html(shipping_c);
		     $("#totalPrice").html(price+shipping_c);
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
					<div class="col-lg-12" style="height:50px;">
						<button class="btn btn-secondary" id="selectDelBtn" style="float:right">선택 삭제</button>
					</div>
					
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
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list }">
								<form method="post" action="<%=request.getContextPath()%>/cartEdit">
										<input type="hidden" name="${c.m_no }" value="${c.m_no }" >
										<input type="hidden" name="c_no" value="${c.c_no}"/>
											<tr>										
												<td>
													<input type="checkbox" name="chBox" class="chBox" value="${c.c_no }">
													<input type="hidden" id="shipping_c" value="${c.shipping_c}"/>
													<input type="hidden" id="shipping_c" value="${c.dc_price*c.num}"/>
												</td>
											
												<td>
													<img style="maring-left:15px;width:150px; height:120px;" 
													src="<%=request.getContextPath()%>/resources/upload/productMainImg/${c.s_no}/${c.main_img}"/>
												</td>
											
												<td>
												 ${c.pd_name }
													<c:if test="${c.o_value == null }">
														[옵션 : 없음]
													</c:if>
													<c:if test="${c.o_value != null }">
														[옵션 : ${c.o_value}]	
													</c:if>
													
												</td>
												
												<td>
													<input type="number" name="num" class="form-control" style="margin-top:45px;width:70px" value="${c.num}"/>
												</td>
												<td>
													 <%-- ${c.price*c.num*c.discount*0.01}원 --%>
													 ${c.discount}
												</td>
												
												<td>
													<button type="submit" class="btn btn-secondary">수정</button>
												</td>
											</tr>
									</form>									
								
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
									<span id="ship" style="color:black;">0</span> 원
								</div>
								
								<div class="col-lg-6">
									상품
								</div>
								<div class="col-lg-6" style="text-align:right">
									<span id="price" style="color:black;">0</span> 원
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
	</div>
	
	
	
	<div class="col-lg-12" style="text-align:center">
			<button class="btn" id="purchaseBtn" 
			style="background-color:#ee8374;font-size:25px;width:150px;color:#fff;border:0;">구매</button>
	</div>
	<br/>
	
</div>

<br/>