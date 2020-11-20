<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		<!-- 스토어 현황 -->
		<div class="col-lg-12">
			
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">스토어 현황</h6>
				</div>
				<!-- card body -->
				<div class="card-body" >
					<div class="col-lg-12">
						<table class="table table-borderd">
							<thead>
							<tr>
								<th>번호</th>
								<th>스토어명</th>
								<th>기간</th>
								<th>신규주문</th>
								<th>구매확정</th>
								<th>총 매출액</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<th rowspan="3">1454623</th>
								<th rowspan="3">자연가구</th>
								<th>오늘</th>
								<th>5건</th>
								<th>19건</th>
								<th>515,432</th>
							</tr>
							<tr>
								<th>최근 일주일</th>
								<th>75건</th>
								<th>106건</th>
								<th>1,345,432</th>
							</tr>
							<tr>
								<th>최근 한달</th>
								<th>147건</th>
								<th>321건</th>
								<th>5,325,339</th>
							</tr>
							</tbody>	
						</table>
					
					</div>
				</div><!-- card body 끝  -->
			</div><!-- 스토어 현황 끝 -->
			
			<br/>
			
			<!-- 상세조회 -->
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">상세 조회</h6>
				</div>
					
				<!-- card-body -->
				<div class="card-body">
					<div class="col-lg-12">
						
						<form class="user" method="post" action="">
							스토어명		<input type="text" name="s_name"/>
							기간		<input type="text" name=""/>-<input type="text" name=""/>		
							카테고리	<select multiple class="form-control">
										<option>가구</option>
										<option>가전</option>
										<option>반려동물</option>
										<option>수납</option>
									</select>
							
							<br/>		
							<!-- 검색 버튼 -->
							<div style="text-align:center">
								<a href="#" class="btn btn-secondary btn-icon-split">
		                              <span class="icon text-white-50">
		                              <i class="fas fa-check"></i></span>
		                             <span class="text">검색</span>
		                    	</a>
							</div><br/>	
						</form>
						
					</div>
				</div>
			</div>
		</div>
		<!-- 상세조회 끝 -->
			
			
			
		
	</div>
</div>	
	
	
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>