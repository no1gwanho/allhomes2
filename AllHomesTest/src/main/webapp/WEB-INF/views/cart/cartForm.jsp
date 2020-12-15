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
		
		
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
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
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list }">
									
										<input type="hidden" name="${c.m_no }" value="${c.m_no }">
										
											<tr class="mb-3">										
												<td>
													<input type="checkbox" name="chBox" class="chBox" value="${c.c_no }">
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
													<input type="number" class="form-control" style="width:70px" value="${c.num}"/>
												</td>
												<td>
													 ${c.price}원
												</td>
												
												<td>
													<button class="btn btn-secondary">수정</button>
												</td>
																		
								
								</c:forEach>
						</tbody>
					</table>
					
					<br/>
					<br/>
					<hr/>
					
					<div>
						<div style="float:right">
						
						</div>
					</div>
				</div>
		</div><!-- card 끝 -->
	</div>
	
	
	
	<div class="row">
		
		<div class="col-md-2">
			<button class="btn btn" id="selectDelBtn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">선택 삭제</button>
			<button class="btn btn" id="purchaseBtn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">구매</button>
			
		</div>
	</div>
	<br/>
	
</div>

<br/>