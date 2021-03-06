<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#summaryTB td{
	text-align:right;
}
</style>
<script>
	$(function(){
		//datepicker
		$("#date,#date2").datepicker({
			dateFormat: 'yy-mm-dd'
			,numberOfMonths:1 
		});
		
		//매출 조회 클릭
		$("#salesSearchBtn").click(function(){
			var date = $("#date").val();
			var date2 = $("#date2").val();
			var s_no = ${storeVO.s_no};
			
			if(date==null || date2 == null){
				alert("기간을 선택해주십시오.");
				return false;
			}
			
			var url = "/myapp/storeSalesSearch";
			var data = { "date": date, "date2": date2, "s_no" : s_no };
			
			var totalShippingC = 0; //총 운송비용
			var totalSales = 0; //총 판매액
			
			
			$.ajax({
				url:url,
				data: data,
				dataType:"json",
				success:function(result){
					var tag = "<table class='table table-bordered'><thead><tr><th>주문번호</th><th>상품번호</th><th>상품명</th><th>주문자 ID</th><th>확정일</th><th>수량</th><th>운송비용</th><th>판매액</th></tr></thead><tbody>";
					 
						$.each(result,function(i, v) {
							
							tag += "<tr><td>"+v.pc_no+"</td>";
							tag += "<td>"+v.pd_no+"</td>";
							tag += "<td>"+v.pd_name+"</td>";
							tag += "<td>"+v.userid+"</td>";
							tag += "<td>"+v.pc_date+"</td>";
							tag += "<td>"+v.num+"</td>";
							tag += "<td style='text-align:right'>"+v.shipping_c+"원</td>";
							tag += "<td style='text-align:right'>"+v.total_p+"원</td></tr>"; 
							
							totalShippingC += v.shipping_c;
							totalSales += v.total_p;
							
						});
						
						tag += "<tr><th colspan='4'>총 판매액</th>";
						tag += "<th colspan='4' style='text-align:right;color:#EE8374'>"+totalSales+"원</th></tr>";
						tag += "<tr><th colspan='4'>(-)총 운송비용</th>";
						tag += "<td colspan='4' style='text-align:right;'>(-)"+totalShippingC+"원</td></tr>";
						tag += "<tr><th colspan='4'>총 판매이익</th>";
						tag += "<th colspan='4' style='text-align:right;color:#EE8374'>"+(totalSales - totalShippingC)+"원</th></tr>";
						tag += "</tbody><table>";
						
						$("#searchTB").append(tag);
				},error: function(){
					console.log("매출,주문 조회 에러");
				}
			});
		});
	});
	
</script>
<div class="container-fluid">
	<div class="row">


		<div class="col-lg-8">
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">STORE</h6>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6 mt-5 mb-4" style="text-align: center">
							<img
								src="<%=request.getContextPath()%>/resources/upload/storeImg/${storeVO.s_pic}"
								style="width: 200px; height: 200px; border-radius: 70%; margin: 0 auto;" />
						</div>
						<div class="col-lg-6 mt-5 mb-4">
							<div class="row mb-3 mt-2">
								<div class="col-lg-5">스토어명</div>
								<div class="col-lg-7">${storeVO.s_name}</div>
							</div>
							<div class="row mb-4">
								<div class="col-lg-5">판매자 ID</div>
								<div class="col-lg-7">${storeVO.s_id}</div>
							</div>
							<div class="row mb-4">
								<div class="col-lg-5">입점일</div>
								<div class="col-lg-7">${storeVO.openingdate}</div>
							</div>
							<div class="row mb-4">
								<div class="col-lg-5">제품 수</div>
								<div class="col-lg-7">${cntPd}</div>
							</div>
							<div class="row mb-1">
								<div class="col-lg-5">평균 별점</div>
								<div class="col-lg-7">
									<span style="color:#EE8374">
										<c:if test="${avgRating <= 1 }">
										★
										</c:if>
										<c:if test="${avgRating <= 2 and avgRating>1}">
										★★
										</c:if>
										<c:if test="${avgRating <= 3 and avgRating>2}">
										★★★
										</c:if>
										<c:if test="${avgRating <= 4 and avgRating>3}">
										★★★★
										</c:if>
										<c:if test="${avgRating <= 5 and avgRating>4}">
										★★★★★
										</c:if>
									</span>
								<fmt:formatNumber value="${avgRating}" pattern=".0"/> (${countReview})</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-4">
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">REVIEW</h6>
				</div>
				<div class="card-body">
					<h4 class="small font-weight-bold">
						★ <span class="float-right">${one}%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width:${one}%" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						★★<span class="float-right">${two}%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width:${two}%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						★★★<span class="float-right">${three}%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar" role="progressbar"
							style="width:${three}%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						★★★★<span class="float-right">${four}%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-info" role="progressbar"
							style="width:${four}%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						★★★★★<span class="float-right">${five}%</span>
					</h4>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar"
							style="width:${five}%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-lg-12">
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">매출&주문 요약</h6>
				</div>

				<!-- card body -->
				<div class="card-body">
					<div class="col-lg-12">
						<table class="table table-bordered" id="summaryTB">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">스토어명</th>
									<th scope="col">기간</th>
									<th scope="col">주문 건수</th>
									<th scope="col">구매확정</th>
									<th scope="col">매출액</th>
									<th scope="col">(-)운송비용</th>
									<th scope="col">매출이익</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th rowspan="3">${storeVO.s_no}</th>
									<th rowspan="3">${storeVO.s_name}</th>
									<th>오늘</th>
									<td>${cntToday}건</td>
									<td>${todayVO.confirmCnt}건</td>
									<td>${todayVO.sales}원</td>
									<td>(-)${todayVO.totalShippingC}원</td>
									<td>${todayVO.sales - todayVO.totalShippingC}원</td>
								</tr>
								<tr>
									<th>최근 1개월</th>
									<td>${cntMonth}건</td>
									<td>${monthVO.confirmCnt}건</td>
									<td>${monthVO.sales}원</td>
									<td>(-)${monthVO.totalShippingC}원</td>
									<td>${monthVO.sales - monthVO.totalShippingC}원</td>
								</tr>
								<tr>
									<th>최근 3개월</th>
									<td>${cntThree}건</td>
									<td>${threeVO.confirmCnt}건</td>
									<td>${threeVO.sales}원</td>
									<td>(-)${threeVO.totalShippingC}원</td>
									<td>${threeVO.sales - threeVO.totalShippingC}원</td>
								</tr>
								<tr>
									<th colspan="4">총 확정 주문 건수</th>
									<th colspan="4" style="text-align:right;color:#EE8374">${totalVO.confirmCnt}건</th>
								</tr>
								<tr>
									<th colspan="4">총 매출액</th>
									<th colspan="4" style="text-align:right;color:#EE8374">${totalVO.sales}원</th>
								</tr>
								<tr>
									<th colspan="4">(-)총 운송비용</th>
									<td colspan="4" style="text-align:right;">(-)${totalVO.totalShippingC}원</td>
								</tr>
								<tr>
									<th colspan="4">총 매출이익</th>
									<th colspan="4" style="text-align:right;color:#EE8374">${totalVO.sales - totalVO.totalShippingC}원</th>
								</tr>

							</tbody>
						</table>

					</div>
				</div>
				<!-- card body 끝  -->
			</div>
			<!-- card 끝 -->
		</div>
		<!-- col-lg-12 끝 -->
		
		<div class="col-lg-12">
			<div class="card shadow mt-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">매출 조회</h6>
				</div>

				<!-- card body -->
				<div class="card-body">
					<div class="col-lg-12">
						<div class="col-lg-8" style="margin:0 auto;">							
							<div class="row">
								<span class="col-lg-2" >기간</span> 
								<input type="text" id="date" name="date" class="form-control col-lg-3" style="float:left;"/>
								<span class="col-lg-1" style="text-align:center"> - </span> 
								<input type="text" id="date2" name="date2" class="form-control col-lg-3" style="float:left"/>
								<button id="salesSearchBtn" class="col-lg-1 ml-4 btn alert-clean shadow-sm">조회</button>
							</div>
						</div>
						<div class="col-lg-12 mt-4 mb-4" id="searchTB">
						
						</div>
					</div>
				</div>
				<!-- card body 끝  -->
			</div>
			<!-- card 끝 -->
		</div>
		<!-- col-lg-12 끝 -->
		
	</div>
	</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>