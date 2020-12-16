<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
td {
	height: 50px;
	line-height: 50px;
}
#memberChart {
	height: 505px;
}
.cardSize {
	height: 240px;
}
#cards {
	float: left
}
#cards>div {
	float: left
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-6 col-md-6 mb-4">
			<div class="card shadow" id="memberChart">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member Chart</h6>
				</div>
				<div class="card-body">
					<div>
						<input type="hidden" id="count0" value="${count0}"/>
						<input type="hidden" id="count1" value="${count1}"/> 
						<input type="hidden" id="count2" value="${count2}"/> 
						<input type="hidden" id="count3" value="${count3}"/> 
						<input type="hidden" id="count4" value="${count4}"/> 
						<input type="hidden" id="count5" value="${count5}"/> 
						<input type="hidden" id="count6" value="${count6}"/> 
						
                        <canvas id="lineChart"></canvas>
					<script>
						let today = new Date();   
						let month = today.getMonth() + 1;  // 월
						let date = today.getDate();  // 날짜
						var dateList =  new Array(); 
						
						for(var i=0; i<7;i++){
							dateList[i] = month+"/"+date;
							date -= 1;
						}
						var dayone = month+"/"+date;
						
						//line
						var ctxL = document.getElementById("lineChart").getContext('2d');
						var myLineChart = new Chart(
								ctxL,
								{
									type : 'line',
									data : {
										labels : [ dateList[6], dateList[5],
											dateList[4],dateList[3],dateList[2],
											dateList[1],dateList[0] ],
										datasets : [
												{
													label : "회원 수",
													data : [ $("#count6").val(), $("#count5").val(),
														 $("#count4").val(), $("#count3").val(),
														 $("#count2").val(), $("#count1").val(),
														 $("#count0").val(),],
													backgroundColor : [
															'#A4E1E0', ],
													borderColor : [
															'#37C0DB', ],
													borderWidth : 2
												}]
									},
									options : {
										responsive : true,
										lineTension : 6
									}
								});
						
					</script>
                    </div>


				</div>
			</div>
		</div>



		<div class="col-xl-6" id="cards">
			<div class="col-xl-6 col-md-6 mb-4 cardSize">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xl font-weight-bold text-primary text-uppercase mb-1">
									Today</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">+${today}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-users fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-xl-6 col-md-6 mb-4 cardSize">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xl font-weight-bold text-primary text-uppercase mb-1">
									This Month</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">+${month}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-users fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-6 col-md-6 mb-4 cardSize">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xl font-weight-bold text-primary text-uppercase mb-1">
									Total</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">+${allCnt}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-users fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-6 col-md-6 mb-4 cardSize">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xl font-weight-bold text-primary text-uppercase mb-1">
									Loss</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">-${out}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-users fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>




		<div class="col-lg-12">

			<div class="my-2"></div>
			<!-- 테이블 -->

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member List</h6>
					<a href="/myapp/adminMemberList" style="float: right; height: 10px">더보기</a>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>프로필</th>
								<th>ID</th>
								<th>이름</th>
								<th>이메일</th>
								<th>Tel</th>
								<th>가입일</th>
								<th>비밀번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr
									onClick="location.href='/myapp/adminMemberDetail?m_no=${vo.m_no}'">
									<td>${vo.m_no}</td>
									<td><img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 50px; height: 50px" /></td>
									<td>${vo.userid}</td>
									<td>${vo.username}</td>
									<td>${vo.email}</td>
									<td>${vo.tel}</td>
									<td>${vo.regdate}</td>
									<td>${vo.userpwd}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<!-- card 끝 -->
		</div>
		<!-- col끝 -->
	</div>
</div>