<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Direct", "Referral", "Social"],
    datasets: [{
      data: [55, 30, 15],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

</script>




<div class="container-fluid">
	<div class="row">
		<!-- 스토어 현황 -->
		<div class="col-lg-12">

			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary" style="float: left">STORE</h6>
					<a href="#" style="float: right; height: 10px">더보기</a>
				</div>
				<!-- card body -->
				<div class="card-body">
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
									<td rowspan="3">1454623</td>
									<td rowspan="3">자연가구</td>
									<td>오늘</td>
									<td>5건</td>
									<td>19건</td>
									<td>515,432</td>
								</tr>
								<tr>
									<td>최근 일주일</td>
									<td>75건</td>
									<td>106건</td>
									<td>1,345,432</td>
								</tr>
								<tr>
									<td>최근 한달</td>
									<td>147건</td>
									<td>321건</td>
									<td>5,325,339</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<!-- card body 끝  -->
			</div>
			<!-- 스토어 현황 끝 -->

			<br />

			<!-- 상세조회 -->
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">상세 조회</h6>
				</div>

				<!-- card-body -->
				<div class="card-body">
					<canvas id="chLine"></canvas>

				</div>
			</div>
			
			
			
		
			<br/>
			<!-- 차트 테스트 -->
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Chart</h6>
				</div>
                <div class="card-body">
                     
                </div>
			</div>
			
			<div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                       <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
         <!-- 차트테스트 끝 -->               
                        
                        
                        
                        
		</div><!-- col-lg-12 끝 -->
	</div>
</div>


<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>