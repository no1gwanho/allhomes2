<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
td {
	height: 50px;
	line-height: 50px
}
</style>
<script>
	$(function(){
		//선택 검색하기
		$("#searchBtn").click(function(){
			var value = $("#searchSelect option:selected").val();
			var key = $("#searchKeyword").val();
			
			location.href = "/myapp/adminStoreSearch?key="+key+"&value="+value;
		});
		
		
		//상세조회 검색 누르기
		$("#searchDetailBtn").click(function(event){
			if($("#searchDiv").css("display","none")){
				$("#searchDiv").show("fast");
			}else if(!$("#searchDiv").css("display","none")){
				$("#searchDiv").hide("fast");
			}
					
		});
		
		
		
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="my-2"></div>

		<!-- 검색 옵션 -->
		<div class="col-lg-12">
			<div style="float: left">
				<select class="selectpicker" id="searchSelect">
					<optgroup label="검색 필터">
						<option value="s_name">스토어명으로 검색</option>
						<option value="s_id">판매자 ID로 검색</option>
						<option value="staff_n">담당자 이름으로 검색</option>
						<option value="staff_t">담당자 연락처로 검색</option>
						<option value="staff_e">담당자 이메일로 검색</option>
					</optgroup>
				</select>
			</div>

			<!-- search 검색 -->
			<div class="input-group col-lg-4" id="searchKey" style="float: left">
				<input type="text" id="searchKeyword"
					class="form-control bg-light border-0 small"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-dark" type="button" id="searchBtn">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
			<!-- search 검색 끝 -->

			<div style="float: right">
				<button class="btn btn-user alert-clean shadow-sm mb-4"
					id="searchDetailBtn">상세조회</button>
			</div>
		</div>
		<!-- 검색 옵션 끝 -->

		<!-- 상세조회 -->
		<div class="col-lg-12" id="searchDiv" style="display: none">
			<div class="card shadow mb-4 mt-4">
				<div class="card-header py-3">
					<h6 class="m-0  font-weight-bold text-primary" style="float: left">상세조회</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<form method="post" action="/myapp/adminStoreDetailSearch">
						<p>
							<span class="col-lg-5" style="float: left">스토어명</span>
							<input type="text" class="form-control col-lg-4" id="s_name" name="s_name" />
						</p>
						<p>
							<span class="col-lg-5" style="float: left">판매자 ID</span>
							<input type="text" class="form-control col-lg-4" id="s_id" name="s_id"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">담당자 이름</span>
							<input type="text" class="form-control col-lg-4" id="staff_n" name="staff_n"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">담당자 연락처</span>
							<input type="text" class="form-control col-lg-4" id="staff_t" name="staff_t"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">담당자 email</span>
							<input type="text" class="form-control col-lg-4" id="staff_e" name="staff_e"/>
						</p>
			
	
						<button class="btn btn-primary btn-icon-split"
							id="searchDetailOkBtn">
							<span class="icon text-white-50"> <i class="fas fa-search"></i>
							</span> <span class="text">조회</span>
						</button>
					</form>
				</div>
			</div>
		</div>

		<!-- 상세조회 끝 -->
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>스토어명</th>
								<th>사업자등록번호</th>
								<th>프로필</th>
								<th>ID</th>
								<th>담당자 Tel</th>
								<th>입점일</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="vo" items="${list}">
								<tr
									onClick="location.href='/myapp/adminStoreDetail?s_no=${vo.s_no}'">

									<td>${vo.s_no}</td>
									<td>${vo.s_name}</td>
									<td>${vo.s_num}</td>
									<td><img src="<c:url value='/storeImg/${vo.s_pic}'/>"
										style="width: 50px; height: 50px; border-radius: 70%;" /></td>
									<td>${vo.s_id}</td>
									<td>${vo.staff_t}</td>
									<td>${vo.openingdate}</td>
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
				<!-- card body 끝 -->
			</div>
			<!-- card 끝 -->
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>