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

.note {
    height: 211px;
    width: 394px;
    border: 1px solid #ddd;
    background-color: #feffdd;
    box-shadow: 7px 7px 7px rgba(0,0,0,.1);
}


/* 달력 */
*:before, *:after {
  box-sizing: inherit;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
  float: none;
}

/* ======== Calendar ======== */
.my-calendar {
  width: 700px;
  margin-top: 30px;
  padding-left:70px;
  text-align: center;
  font-weight: 800;
  border: 0px;
  cursor: default;
}
.my-calendar .clicked-date {
  border-radius: 25px;
  margin-top: 10px;
  float: left;
  width: 42%;
  padding: 46px 0 26px;
  background: #ddd;
}
.my-calendar .calendar-box {
  float: right;
  width: 58%;
  padding-left: 30px;
}

.clicked-date .cal-day {
  font-size: 24px;
}
.clicked-date .cal-date {
  font-size: 130px;
}

.ctr-box {
  padding: 0 16px;
  margin-bottom: 20px;
  font-size: 20px;
}
.ctr-box .btn-cal {
  position: relative;
  float: left;
  width: 25px;
  height: 25px;
  margin-top: 5px;
  font-size: 16px;
  cursor: pointer;
  border: none;
  background: none;
}
.ctr-box .btn-cal:after {
  content: '<';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  line-height: 25px;
  font-weight: bold;
  font-size: 20px;
}
.ctr-box .btn-cal.next {
  float: right;
}
.ctr-box .btn-cal.next:after {
  content: '>';
}

.cal-table {
  width: 100%;
}
.cal-table th {
  width: 14.2857%;
  padding-bottom: 5px;
  font-size: 16px;
  font-weight: 900;
}
.cal-table td {
  padding: 3px 0;
  height: 50px;
  font-size: 15px;
  vertical-align: middle;
}
.cal-table td.day {
  position: relative;
  cursor: pointer;
}
.cal-table td.today {
  background: #ffd255;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.day-active {
  background: #ff8585;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.has-event:after {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 4px;
  background: #FFC107;
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
				<div class="card-body" style="padding-bottom:110px;margin-top:20px;">
					<input type="hidden" value="${waiting}" id="w"/>
					<input type="hidden" value="${payment}" id="p"/>
					<input type="hidden" value="${deliveryPre}" id="dp"/>
					<input type="hidden" value="${delivery}" id="d"/>
					<input type="hidden" value="${confirm}" id="c"/>
	 				<input type="hidden" value="${reviewDone}" id="r"/>
					
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
												"#DB5A51", "#A82C2C", "#FF4061" ],
										hoverBackgroundColor : ["#5C484B",
											"#E1B0B9", "#A85161",
											"#DB5A51", "#A82C2C", "#FF4061" ],
									    data : [ $("#w").val(), $("#p").val(), $("#dp").val(),
									    	$("#d").val(), $("#c").val(), $("#r").val()]
									} ],
									labels : [ "입금대기", "결제완료", "배송준비",
										"배송중", "구매확정", "리뷰완료" ]
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
				<div class="card-body mt-3 mb-3">
					<h4 class="small font-weight-bold">
						★ <span class="float-right">${one}%</span>
					</h4>
					<div class="progress mb-4 mt-2">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width:${one}%" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold mt-3">
						★★<span class="float-right">${two}%</span>
					</h4>
					<div class="progress mb-4 mt-3">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width:${two}%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold mt-3">
						★★★<span class="float-right">${three}%</span>
					</h4>
					<div class="progress mb-4 mt-3">
						<div class="progress-bar" role="progressbar"
							style="width:${three}%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold mt-3">
						★★★★<span class="float-right">${four}%</span>
					</h4>
					<div class="progress mb-4 mt-3">
						<div class="progress-bar bg-info" role="progressbar"
							style="width:${four}%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold mt-3">
						★★★★★<span class="float-right">${five}%</span>
					</h4>
					<div class="progress mt-3">
						<div class="progress-bar bg-success" role="progressbar"
							style="width:${five}%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>



		</div>

		<div class="col-lg-6 mb-4">
			<div class="card shadow mb-4">

				<div class="card-body">

					<div class="my-calendar clearfix">
						<div class="clicked-date">
							<div class="cal-day"></div>
							<div class="cal-date"></div>
						</div>
						<div class="calendar-box">
							<div class="ctr-box clearfix">
								<button type="button" title="prev" class="btn-cal prev">
								</button>
								<span class="cal-month"></span> <span class="cal-year"></span>
								<button type="button" title="next" class="btn-cal next">
								</button>
							</div>
							<table class="cal-table">
								<thead>
									<tr>
										<th>S</th>
										<th>M</th>
										<th>T</th>
										<th>W</th>
										<th>T</th>
										<th>F</th>
										<th>S</th>
									</tr>
								</thead>
								<tbody class="cal-body"></tbody>
							</table>
						</div>
					</div>
					<!-- // .my-calendar -->
					<script>
					  const init = {
					  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
					  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
					  today: new Date(),
					  monForChange: new Date().getMonth(),
					  activeDate: new Date(),
					  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
					  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
					  nextMonth: function () {
					    let d = new Date();
					    d.setDate(1);
					    d.setMonth(++this.monForChange);
					    this.activeDate = d;
					    return d;
					  },
					  prevMonth: function () {
					    let d = new Date();
					    d.setDate(1);
					    d.setMonth(--this.monForChange);
					    this.activeDate = d;
					    return d;
					  },
					  addZero: (num) => (num < 10) ? '0' + num : num,
					  activeDTag: null,
					  getIndex: function (node) {
					    let index = 0;
					    while (node = node.previousElementSibling) {
					      index++;
					    }
					    return index;
					  }
					};

					const $calBody = document.querySelector('.cal-body');
					const $btnNext = document.querySelector('.btn-cal.next');
					const $btnPrev = document.querySelector('.btn-cal.prev');

					/**
					 * @param {number} date
					 * @param {number} dayIn
					*/
					function loadDate (date, dayIn) {
					  document.querySelector('.cal-date').textContent = date;
					  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
					}

					/**
					 * @param {date} fullDate
					 */
					function loadYYMM (fullDate) {
					  let yy = fullDate.getFullYear();
					  let mm = fullDate.getMonth();
					  let firstDay = init.getFirstDay(yy, mm);
					  let lastDay = init.getLastDay(yy, mm);
					  let markToday;  // for marking today date
					  
					  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
					    markToday = init.today.getDate();
					  }

					  document.querySelector('.cal-month').textContent = init.monList[mm];
					  document.querySelector('.cal-year').textContent = yy;

					  let trtd = '';
					  let startCount;
					  let countDay = 0;
					  for (let i = 0; i < 6; i++) {
					    trtd += '<tr>';
					    for (let j = 0; j < 7; j++) {
					      if (i === 0 && !startCount && j === firstDay.getDay()) {
					        startCount = 1;
					      }
					      if (!startCount) {
					        trtd += '<td>'
					      } else {
					        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
					        trtd += '<td class="day';
					        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
					        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
					      }
					      trtd += (startCount) ? ++countDay : '';
					      if (countDay === lastDay.getDate()) { 
					        startCount = 0; 
					      }
					      trtd += '</td>';
					    }
					    trtd += '</tr>';
					  }
					  $calBody.innerHTML = trtd;
					}

					/**
					 * @param {string} val
					 */
					function createNewList (val) {
					  let id = new Date().getTime() + '';
					  let yy = init.activeDate.getFullYear();
					  let mm = init.activeDate.getMonth() + 1;
					  let dd = init.activeDate.getDate();
					  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

					  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

					  let eventData = {};
					  eventData['date'] = date;
					  eventData['memo'] = val;
					  eventData['complete'] = false;
					  eventData['id'] = id;
					  init.event.push(eventData);
					  $todoList.appendChild(createLi(id, val, date));
					}

					loadYYMM(init.today);
					loadDate(init.today.getDate(), init.today.getDay());

					$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
					$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

					$calBody.addEventListener('click', (e) => {
					  if (e.target.classList.contains('day')) {
					    if (init.activeDTag) {
					      init.activeDTag.classList.remove('day-active');
					    }
					    let day = Number(e.target.textContent);
					    loadDate(day, e.target.cellIndex);
					    e.target.classList.add('day-active');
					    init.activeDTag = e.target;
					    init.activeDate.setDate(day);
					    reloadTodo();
					  }
					});
			</script>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->


	<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>