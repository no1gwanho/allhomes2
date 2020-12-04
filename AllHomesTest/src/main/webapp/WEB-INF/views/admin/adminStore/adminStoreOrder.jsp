<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
	#orderStatus>div{float:left;}
	.wordCut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
	td:nth-child(9n+6){width:20%}
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
</script>

		
		
<div class="container-fluid">
	<div class="row">
	
	
<!-- <!-- Modal 
		<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="orderModalTitle">주문상세</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      
					</div>
					<div class="modal-body">
						<div>
							<table class="table-bordered">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>스토어명</th>
										<th>우편번호</th>
										<th>배송지</th>
										<th>주문자ID</th>
										<th>구매일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>142345123</td>
										<td>512312</td>
										<td>빈티지 체크 커튼</td>
										<td>자연가구</td>
										<td>42101</td>
										<td class="wordCut">서울시 마포구 노고산동 101서울시 마포구 노고산동 101서울시 마포구 노고산동 101서울시 마포구 노고산동 101서울시 마포구 노고산동 101서울시 마포구 노고산동 101</td>
										<td>seran11</td>
										<td>2020-11-11</td>
										<td>배송중</td>
									</tr>
								</tbody>
							</table>
							<hr>
							<div class="col-lg-12" id="orderStatus">
								<div class="col-lg-3">
									<select id="Select1" class="selectpicker">
										<option value="">입금대기</option>
										<option value="">결제완료</option>
										<option value="">배송중</option>
										<option value="">배송완료</option>
										<option value="">구매확정</option>
									</select>
								</div>
								<div class="col-lg-2">
									<a href="" class="btn btn-user alert-secondary">상태 변경</a>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control" id=""/>
								</div>
								<div class="col-lg-3">
									<a href="" class="btn btn-user alert-danger">송장번호입력</a>
								</div>
							</div>
						</div>
					</div>
				</div>modal body 끝
			</div>
		</div>
		
		모달 버튼
		<button class="btn" data-toggle="modal" data-target="#orderModal" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">모달</button>
Modal -->


		
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
		            <table style="cursor:pointer;" class="table table-hover" id="order">
						<thead>
						<tr>
							<th>주문번호</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>스토어명</th>
							<th>우편번호</th>
							<th>배송지</th>
							<th>주문자ID</th>
							<th>구매일</th>
							<th>수량</th>
							<th>옵션</th>
							<th>결제액</th>
							<th>상태</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${list }">
							<tr onClick="location.href='#'">
								<td>${vo.pc_no}</td>
								<td>${vo.pd_no}</td>
								<td>${vo.pd_name}</td>
								<td>${vo.s_name}</td>
								<td>${vo.zipcode}</td>
								<td class="wordCut">${vo.addr}${vo.addrdetail}</td>
								<td>${vo.userid}</td>
								<td>${vo.pc_date}</td>
								<td>${vo.num}</td>
								<td>${vo.o_value}</td>
								<td>${vo.total_p}</td>
								<td>${vo.status}</td>
							</tr>
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