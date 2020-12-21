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
			
			if(key==""){
				alert("값을 입력해주십시오.");
				return false;
			}
			location.href= "/myapp/adminHBSearch?value="+value+"&key="+key;
			
		});
		
		//상세조회 나타나기
		$("#searchDetailBtn").click(function(event){
			if($("#searchDiv").css("display","none")){
				$("#searchDiv").show("fast");
			}else if(!$("#searchDiv").css("display","none")){
				$("#searchDiv").hide("fast");
			}
					
		});
		
		//상세검색
		 $("#HBDetailSearch").submit(function(){
			if($("#userid").val()=="" && $("#nickname").val()=="" && $("#title").val()=="" && $("#hashtag").val()==""
				&& $("#content").val()=="" && $("#date").val()=="" && $("#date2").val()==""){
				alert("검색값을 한 개 이상 작성해주십시오");
				return false;
			}
		}); 
		
		
		
		
		//정렬하기
		var orderOption = $('#order').val();
		$('#order').change(function(){
			var selectedOrder = $("#order option:selected").val();
			
			location.href="/myapp/adminHomeBoardOrder?order="+selectedOrder;
		});
		
		//집들이 게시글 삭제
		$("#HBDelBtn").click(function(){
			var result = confirm("게시글을 삭제하시겠습니까?");
			if(result){
				location.href="";
			}
			
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
				<div class="input-group col-lg-3" id="searchKey" style="float:left">
					<input type="text" id="searchKeyword" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-dark" type="button" id="searchBtn">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
					
				</div>
				
				<div class="col-lg-2" style="float:left">
					<select class="form-control" id="order" name="order">
						<option class="orderName" value="title" <c:if test="${order=='title'}"> selected</c:if>>제목 순</option>
						<option class="orderName" value="writedate"  <c:if test="${order=='writedate'}"> selected</c:if>>작성일 순</option>
						<option class="orderName" value="hit"  <c:if test="${order=='hit'}"> selected</c:if>>조회 순</option>
						<option class="orderName" value="scrap"  <c:if test="${order=='scrap'}"> selected</c:if>>스크랩 순</option>
					</select>
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
					<form method="post" action="/myapp/adminHBSearchDetail" id="HBDetailSearch">
						<p>
							<span class="col-lg-5" style="float: left">작성자 ID</span>
							<input type="text" class="form-control col-lg-4" name="userid" id="userid"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">닉네임</span>
							<input type="text" class="form-control col-lg-4" name="nickname" id="nickname"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">제목</span>
							<input type="text" class="form-control col-lg-4" name="title" id="title"/> 
						</p>
						<p>
							<span class="col-lg-5" style="float: left">글 내용</span>
							<input type="text" class="form-control col-lg-4" name="content" id="content"/>
						</p>
						<p>
							<span class="col-lg-5" style="float: left">해시태그</span>
							<input type="text" class="form-control col-lg-4" name="hashtag" id="hashtag"/>
						</p>
						
						<button class="btn btn-primary btn-icon-split" id="searchDetailOkBtn">
							<span class="icon text-white-50"> 
								<i class="fas fa-search"></i>
							</span> 
							<span class="text">조회</span>
						</button>
					</form>
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
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${viewAll}">
								<tr onClick="location.href='<%=request.getContextPath()%>//adminHomeBoardView?b_no=${list.b_no }'">
									<td>${list.b_no}</td>
									<td>${list.title}</td>
									<td>${list.theme}</td>
									<td>${list.userid}</td>
									<td>${list.writedate}</td>
									<td>${list.hit}</td>
									<td>${list.scrap}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- pagination -->
					<div style="display: inline-block">
						
						<ul class="pagination">
							<c:if test="${paging.startPage != 1 }">
								<li class="page-item">
									<a class="page-link"
										href="<%=request.getContextPath()%>/adminHomeBoardOrder?order=${order}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="page-item disabled">
											<a class="page-link">${p }</a>
										</li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li class="page-item">
										<a class="page-link"
											href="<%=request.getContextPath()%>/adminHomeBoardOrder?order=${order}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item">
									<a class="page-link"
										href="<%=request.getContextPath()%>/adminHomeBoardOrder?order=${order}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- pagination 끝 -->


				</div>
				<!-- card-body끝 -->
			</div>

			
		</div>	
	</div>
	
</div>
