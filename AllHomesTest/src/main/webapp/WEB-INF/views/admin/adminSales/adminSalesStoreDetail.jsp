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
									<th scope="col">주문 건수</th>
									<th scope="col">구매확정</th>
									<th scope="col">총 매출액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th rowspan="3">${storeVO.s_no}</th>
									<th rowspan="3">${storeVO.s_name}</th>
									<td>오늘</td>
									<td>${cntToday}</td>
									<td>${todayVO.confirmCnt}건</td>
									<td>${todayVO.sales}원</td>
								</tr>
								<tr>
									<td>최근 1개월</td>
									<td>${cntMonth}</td>
									<td>${monthVO.confirmCnt}건</td>
									<td>${monthVO.sales}원</td>
								</tr>
								<tr>
									<td>최근 3개월</td>
									<td>${cntThree}</td>
									<td>${threeVO.confirmCnt}건</td>
									<td>${threeVO.sales}원</td>
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