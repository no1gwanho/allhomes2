<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<style>
td{
	height: 40px;
	line-height: 40px;
}
</style>
<script>
	$(function(){
		
		
		//검색하기
		$("#searchBtn").click(function(){
			var value = $("#searchSelect option:selected").val();
			var key = $("#searchKeyword").val();
			
			location.href= "/myapp/adminHBSearch?key="+key+"&value="+value;
			/* if(col=="userid"){ //아이디로 검색
				location.href = "/myapp/adminHomeboardSearchUserid?key="+keyword;
			}else if(col=="title"){ //제목으로 검색
				location.href = "/myapp/adminHomeboardSearchTitle?key="+keyword;
			}else if(col=="content"){ //글내용으로 검색
				location.href = "/myapp/adminHomeboardSearchContent?key="+keyword;
			} */
		});
		
		//상세조회 검색 누르기
		
		$("#searchDetailBtn").click(function(event){
			if($("#searchDiv").css("display","none")){
				$("#searchDiv").show("fast");
			}else if(!$("#searchDiv").css("display","none")){
				$("#searchDiv").hide("fast");
			}
					
		});
		
		
		
		//상세검색하기
		$("#searchDetailOkBtn").click(function(){
			var col = $("#searchDetailSelect option:selected").val();
			var keyword = $("#searchDetailKeyword").val();
			var date = $("#date").val();
			var date2 = $("#date2").val();
			
			
			if(date=="" || date2==""){
				alert("날짜를 선택해주십시오.");
				return false;
			}
			
			if(col=="userid"){ //아이디로 검색
				if(keyword==""){
					alert("아이디를 입력해주십시오.");
					return false;
				}
				location.href = "/myapp/HBDetailSearchUserid?key="+keyword+"&date="+date+"&date2="+date2;
			}else if(col=="title"){ //제목으로 검색
				if(keyword==""){
					alert("제목을 입력해주십시오.");
					return false;
				}
				location.href = "/myapp/HBDetailSearchTitle?key="+keyword+"&date="+date+"&date2="+date2;
			}else if(col=="content"){ //글내용으로 검색
				if(keyword==""){
					alert("글 내용을 입력해주십시오.");
					return false;
				}
				location.href = "/myapp/HBDetailSearchContent?key="+keyword+"&date="+date+"&date2="+date2;
			}else if(col=="no"){ //선택안함
				location.href = "/myapp/HBDetailSearch?date="+date+"&date2="+date2;
			}
		});
		
		//datepicker
		$("#date,#date2").datepicker({
			dateFormat: 'yy-mm-dd'
			,numberOfMonths:1 //한번에 보여지는 달력의 개월 수 
		});
		
	});
</script>
<div class="container-fluid">
	<div class="row">
		
			<div class="my-2"></div>
			
			<!-- 검색 옵션 -->
			<div class="col-lg-12">
				<div style="float:left">
					<select class="selectpicker" id="searchSelect">
						<optgroup label="검색 필터">
							<option value="userid">회원 ID로 검색</option>
							<option value="title">제목으로 검색</option>
							<option value="content">글 내용으로 검색</option>
						</optgroup>
					</select>
				</div>

				<!-- search 검색 -->
				<div class="input-group col-lg-4" id="searchKey" style="float:left">
					<input type="text" id="searchKeyword" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
					<button class="btn btn-dark" type="button" id="searchBtn">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
				</div>
				<!-- search 검색 끝 -->
				
				<div style="float:right">
					<button class="btn btn-user alert-clean shadow-sm mb-4" id="searchDetailBtn">상세조회</button>
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
					<p>
						<span class="col-lg-5" style="float: left">
							<select class="selectpicker" id="searchDetailSelect">
								<optgroup label="검색 필터">
									<option value="userid">회원 ID로 검색</option>
									<option value="title">제목으로 검색</option>
									<option value="content">글 내용으로 검색</option>
									<option value="no">선택 안함</option>
								</optgroup>
						</select></span>
						<input type="text" class="form-control col-lg-4" id="searchDetailKeyword"/>
					</p>

					<p>
						<span class="col-lg-5" style="float: left">등록일</span> 
						<input type="text" id="date" class="form-control col-lg-2" style="float:left;"/>
						<span style="float:left">&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;</span> 
						<input type="text" id="date2" class="form-control col-lg-2" style="float:left"/><br/><br/>
					</p>
					
					<button class="btn btn-primary btn-icon-split" id="searchDetailOkBtn">
						<span class="icon text-white-50"> 
							<i class="fas fa-search"></i>
						</span> 
						<span class="text">조회</span>
					</button>
				</div>
			</div>
		</div>

		<!-- 상세조회 끝 -->
		
		
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">HomeBoard</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>테마</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>스크랩</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${hList}">
								<tr onClick="location.href='/myapp/adminHomeBoardView?b_no=${vo.b_no}'">
									<td>${vo.b_no}</td>
									<td>${vo.title}</td>
									<td>${vo.theme}</td>
									<td>${vo.userid}</td>
									<td>${vo.writedate}</td>
									<td>${vo.hit}</td>
									<td>${vo.scrap}</td>
									<td><a href="#" class="btn alert-secondary btn-circle"> <i
											class="fas fa-trash"></i>
									</a></td>
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
				<!-- card-body끝 -->
			</div>

			
		</div>	
	</div>
	
</div>
