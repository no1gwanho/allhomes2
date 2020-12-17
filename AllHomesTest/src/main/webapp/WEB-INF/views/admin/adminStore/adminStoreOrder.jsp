<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
	#orderStatus>div{float:left;}
	.wordCut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
</style>
<script>
	$(function(){
		 //상세조회 나타났다 사라졌다
		$("#searchDetail").click(function(){
			if($("#searchD").css("display")=="none"){
				$("#searchD").css("display", "block");
			}else{
				$("#searchD").css("display", "none");
			}
		});
		 
		
		
	});
	
	function orderEdit(){
		alert("sd;f");
		var sel = document.getElementById("status");
		var val = sel.options[sel.selectedIndex].value;
		document.$(this).status.value = val;
		document.$(this).submit();
		
	}
</script>

		
		
<div class="container-fluid">
	<div class="row">

		<div class="col-lg-12">
			<!-- 검색 옵션 -->
			<a href="#" class="btn btn-user alert-clean shadow-sm">                
                <span class="text">당일</span>
            </a>&nbsp;
			<a href="#" class="btn btn-user alert-clean shadow-sm">                
                <span class="text">1개월</span>
            </a>&nbsp;
            <a href="#" class="btn btn-user alert-clean shadow-sm">                
                <span class="text">3개월</span>
            </a>&nbsp;
            <a href="#" class="btn btn-user alert-clean shadow-sm" id="searchDetail">                
                <span class="text">상세조회</span>
            </a>
            
            <div class="my-2"></div>
            
            <!-- 상세조회 누르면 나오는 거 -->
            <div class="card shadow" id="searchD" style="display:none">
            	<div class="card-body">
	            	<div class="col-lg-12" style="display:inline-block;margin:0 auto;">
		            	<select class="form-control col-lg-1" style="float:left">
		            		<option>주문번호</option>
		            		<option>ID</option>
		            		<option>우편번호</option>
		            	</select>
		            	<input type="text" class="form-control col-lg-3"/>
	           		</div>
            	</div>
            </div><!-- 상세조회 끝 -->
            
            
            <div class="my-2"></div>
            
            <!-- 테이블 -->
            <div class="card shadow mb-4">
            	<div class="card-body" style="text-align:center">
		            <table style="cursor:pointer;" class="table table-hover" id="orderTable">
						<thead>
						<tr>
							<th>주문번호</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>우편번호</th>
							<th>배송지</th>
							<th>주문자ID</th>
							<th>구매일</th>
							<th>수량</th>
							<th>옵션</th>
							<th>결제액</th>
							<th>상태</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${list }">
							<form method="post" onsubmit="return orderEdit()" action="<%=request.getContextPath()%>/orderStatusEdit">
								<tr onClick="return modalOpen()">
									<input type="hidden" value="${vo.pc_no}" name="pc_no"/>
									<input type="hidden" value="${vo.pd_no}" name="pd_no"/>
									
									<td>${vo.pc_no}</td>
									<td>${vo.pd_no}</td>
									<td>${vo.pd_name}</td>
									<td>${vo.zipcode}</td>
									<td class="wordCut">${vo.addr}${vo.addrdetail}</td>
									<td>${vo.userid}</td>
									<td>${vo.pc_date}</td>
									<td>${vo.num}</td>
									<td>${vo.o_value}</td>
									<td>${vo.total_p}</td>
									<td>
										<select class="selectpicker col-lg-12" name="status">
											<option value="입금대기"
												<c:if test="${vo.status}=='입금대기'">selected</c:if>
												>입금대기</option>
											<option value="결제완료"
												<c:if test="${vo.status}=='결제완료'">selected</c:if>
												>결제완료</option>
											<option value="배송준비"
												<c:if test="${vo.status}=='배송준비'">selected</c:if>
												>배송준비</option>
											<option value="배송중"
												<c:if test="${vo.status}=='배송중'">selected</c:if>
												>배송중</option>
											<option value="구매확정"
												<c:if test="${vo.status}=='구매확정'">selected</c:if>
												>구매확정</option>
										</select>
										


									</td>
									<td>
										<button class="btn alert-primary">수정</button>
									</td>
								</tr>
							</form>
						</c:forEach>
						</tbody>	
					</table>
					
					<!-- pagination -->
					<div style="display:inline-block">
						<ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">4</a></li>
						    <li class="page-item"><a class="page-link" href="#">5</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
					<!-- pagination 끝 -->
					
				</div><!-- card-body 끝 -->
			</div><!-- card 끝 -->
		</div><!-- col-lg-12 끝 -->
		
	</div>
</div>

<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>