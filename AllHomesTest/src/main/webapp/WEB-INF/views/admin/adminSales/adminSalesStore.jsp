<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<!-- search 검색 -->
			
	                <div class="input-group col-lg-4">
	                     <input type="text" class="form-control bg-light border-0 small" placeholder="스토어명으로 검색"
	                             aria-label="Search" aria-describedby="basic-addon2">
	                      <div class="input-group-append">
	                       	<button class="btn btn-dark" type="button">
	                                   <i class="fas fa-search fa-sm"></i>
	                         	</button>
	                      </div>
	                 </div>
	       
	       <!-- search 검색 끝 -->
	             
	             
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">스토어별 매출</h6>
				</div>
				
				<!-- card body -->
				<div class="card-body" >
					<div class="col-lg-12">
						<table class="table table-bordered">
							<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">스토어명</th>
								<th scope="col">기간</th>
								<th scope="col">신규주문</th>
								<th scope="col">구매확정</th>
								<th scope="col">총 매출액</th>
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
							
							<tr>
								<th rowspan="3">324123</th>
								<th rowspan="3">리빙빈티지</th>
								<th>오늘</th>
								<th>12건</th>
								<th>52건</th>
								<th>715,410</th>
							</tr>
							<tr>
								<th>최근 일주일</th>
								<th>112건</th>
								<th>146건</th>
								<th>2,52,499</th>
							</tr>
							<tr>
								<th>최근 한달</th>
								<th>521건</th>
								<th>231건</th>
								<th>7,3221,3007</th>
							</tr>
							
							</tbody>	
						</table>
					
					</div>
				</div><!-- card body 끝  -->
			</div><!-- card 끝 -->
		</div><!-- col-lg-12 끝 -->
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>