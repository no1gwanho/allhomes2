<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<!-- bxslider -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
	.sec3_list li {
	transition: 0.5s all;
	border-radius: 4%;
}
.bx-wrapper {
       -moz-box-shadow: none !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        padding:0;
        margin:0;
   }
.sec3_list li span {
	display: block;
	position: relative;
	height: 200px;
	margin-top:25px;
	overflow: hidden;
}

.sec3_list li span img {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width:200px;
	height:200px;
	
}

.sec3_list li dl {
	height: 150px;
	padding: 25px;
	background: #fff;
	transition: 0.5s all;
	text-align:center;
}

.sec3_list li dl dt {
	font-size: 17px;
	color: #444;
	line-height: 1;
}

.sec3_list li dl dt:after {
	content: "";
	display: block;
	width: 20px;
	height: 2px;
	background: red;
	margin-top: 10px;
}

.sec3_list li dl dd {
	font-size: 16px;
	color: #444;
	margin-top: 10px;
}

.sec3_list li dl dd span{
	font-size: 13px;
	color: #bbbbbb;
	margin-top: 10px;
}

.sec3_list li:hover {
	transform: translateY(-20px);
}

.sec3_list li:hover dl {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, .15);
}
	
</style>
<script>
	$(function(){
		
		//bxslider
		$('.sec3_list').bxSlider({
			auto : false,
			pager : false,
			controls : true,
			autoControls : false,
			minSlides : 4,
			maxSlides : 20,
			moveSlides : 3,
			slideWidth : 370,
			slideMargin : 10,
			autoHover : true,
			prevText : "",
			nextText : ""
		});
			
	});
</script>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								Member</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${memberCnt}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-users fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								Sales</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${saleSum}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">Board
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${boardCnt}</div>
								</div>
								<div class="col"></div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-pen fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								Store</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${storeCnt }</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-store fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- 관리자-->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">관리자</h6>
					
				</div>
				<!-- Card Body -->
				<div class="card-body" >
					<div id="banner_list">
						<ul class="sec3_list">
							<c:forEach var="vo" items="${aList}">
							<li>
								<span>
									<img src="<%=request.getContextPath()%>/resources/img/admin/${vo.profile}"
									 style="border-radious:70%;border:0.3px solid gray;" class="rounded-circle"/>
								</span>
								<dl>
									<dd>
										
										<b style="font-size:20px;">${vo.empname}</b><br/>
										${vo.tel}<br/>
										${vo.email}
									</dd>
								</dl></li>
							</c:forEach>
							
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">주문 상태 현황</h6>
			
				</div>
				<!-- Card Body -->
				<div class="card-body" style="padding-bottom:90px">
					<input type="hidden" value="${waiting}" id="w"/>
					<input type="hidden" value="${payment}" id="p"/>
					<input type="hidden" value="${deliveryPre}" id="dp"/>
					<input type="hidden" value="${delivery}" id="d"/>
					<input type="hidden" value="${confirm}" id="c"/>
					
					<canvas id="doughnutChart" style="margin-top:50px"></canvas>
						<script>
							//doughnut
							var ctxD = document.getElementById("doughnutChart").getContext('2d');
							var myLineChart = new Chart(ctxD, {
								type : 'doughnut',
								data : {
									
									datasets : [ {
										
										backgroundColor : [ "#5C484B",
												"#E1B0B9", "#A85161",
												"#DB5A51", "#A82C2C" ],
										hoverBackgroundColor : ["#5C484B",
											"#E1B0B9", "#A85161",
											"#DB5A51", "#A82C2C" ],
									    data : [ $("#w").val(), $("#p").val(), $("#dp").val(),
									    	$("#d").val(), $("#c").val()]
									} ],
									labels : [ "입금대기", "결제완료", "배송준비",
										"배송중", "구매확정" ]
								},
								options : {
									responsive : true
								}
							});
						</script>
					
					
					
				</div>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-lg-6 mb-4">

			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Review Rating</h6>
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

		<div class="col-lg-6 mb-4">

			<!-- Illustrations -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
				</div>
				<div class="card-body">
					<div class="text-center">
						<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
							style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
					</div>
					<p>
						Add some quality, svg illustrations to your project courtesy of <a
							target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
						a constantly updated collection of beautiful svg images that you
						can use completely free and without attribution!
					</p>
					<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
						Illustrations on unDraw &rarr;</a>
				</div>
			</div>

			<!-- Approach -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Development
						Approach</h6>
				</div>
				<div class="card-body">
					<p>SB Admin 2 makes extensive use of Bootstrap 4 utility
						classes in order to reduce CSS bloat and poor page performance.
						Custom CSS classes are used to create custom components and custom
						utility classes.</p>
					<p class="mb-0">Before working with this theme, you should
						become familiar with the Bootstrap framework, especially the
						utility classes.</p>
				</div>
			</div>

		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>