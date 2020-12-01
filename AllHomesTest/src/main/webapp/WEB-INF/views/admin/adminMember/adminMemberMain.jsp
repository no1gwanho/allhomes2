<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
td {
	height: 50px;
	line-height: 50px;
}

#memberChart {
	height: 500px;
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
<script>
	$(function(){
		$("#orderMember").click(function(){
			var order = $("#orderVal option:selected").val()+" "+$("#order option:selected").val();
			alert(order);
			
			location.href="/myapp/adminMemberMainOrder?val="+order;
		});
	});
</script>
<div class="container-fluid">
	<div class="row">


		<!-- 검색 옵션 -->
		<!-- <div>
				<select class="selectpicker">
	               	<optgroup label="검색 필터"> 
		     	    <option value="">번호</option>
		            <option value="">ID</option>
		            <option value="">이름</option>
	                </optgroup>
	            </select>
	            <input type="text"/>
			</div> 
			
			<div>
	              <select id="orderVal" class="selectpicker">
	               		<optgroup label="검색 필터"> 
		                   <option name="order" value="userid">ID</option>
		                   <option name="order" value="username">이름</option>
		                   <option name="order" value="regdate">가입일</option>
	                   </optgroup>
	               </select>
	               <select id="order" class="selectpicker">
	               		<optgroup label="정렬">
		                   <option name="" value="asc">오름차순</option>
		                   <option name="" value="desc">내림차순</option>
	                   </optgroup>
	               </select>
	               
	               <button id="orderMember" class="btn alert-light"><span class="text">정렬</span></button>
	               
	        </div>-->

		<div class="col-xl-6 col-md-6 mb-4">
			<div class="card shadow" id="memberChart">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member Chart</h6>
				</div>
				<div class="card-body"></div>
			</div>
		</div>



		<div class="col-xl-6" id="cards">
			<div class="col-xl-6 col-md-6 mb-4 cardSize">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col-auto">
								<div class="h3 font-weight-bold text-info text-uppercase mb-1"
									style="float: right">Today</div>
								<i class="fas fa-user fa-3x text-gray-300"></i>
							</div>
							<div class="col-lg-12 mr-2">
								<br />
								<br />
								<div class="h1 mb-0 font-weight-bold text-gray-600">&nbsp;&nbsp;&nbsp;+${today}</div>
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
								<div class="h5 mb-0 font-weight-bold text-gray-800">+${total}</div>
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
								<div class="h5 mb-0 font-weight-bold text-gray-800">-412</div>
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

					<!-- pagination -->
					<div style="display: inline-block">
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
				</div>
			</div>
			<!-- card 끝 -->
		</div>
		<!-- col끝 -->
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>