<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
td{
	height:40px;
	line-height:40px
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
			alert(value+key);
			location.href = "/myapp/adminMemberSearch?value="+value+"&key="+key;
			
			
		});
		
		//상세조회 나타나기
		$("#searchDetailBtn").click(function(event){
			if($("#searchDiv").css("display","none")){
				$("#searchDiv").show("fast");
			}else if(!$("#searchDiv").css("display","none")){
				$("#searchDiv").hide("fast");
			}
					
		});
		
		//정렬하기
		var orderOption = $('#order').val();
		$('#order').change(function(){
			var selectedOrder = $("#order option:selected").val();
			alert(selectedOrder);
			location.href="/myapp/adminMemberOrder?order="+selectedOrder;
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
							<option value="username">이름으로 검색</option>
							<option value="email">이메일로 검색</option>
							<option value="tel">연락처로 검색</option>
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
				
				<div class="col-lg-1" style="float:left">
					<select class="form-control" id="order" name="order">
						<option class="orderName" disabled selected>정렬</option>
						<option class="orderName" value="userid">ID 순</option>
						<option class="orderName" value="username">이름 순</option>
						<option class="orderName" value="regdate">등록일 순</option>
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
						<form method="post" action="/myapp/adminHBSearchDetail"
							id="HBDetailSearch">
							<p>
								<span class="col-lg-5" style="float: left">작성자 ID</span> <input
									type="text" class="form-control col-lg-4" name="userid"
									id="userid" />
							</p>
							<p>
								<span class="col-lg-5" style="float: left">닉네임</span> <input
									type="text" class="form-control col-lg-4" name="nickname"
									id="nickname" />
							</p>
							<p>
								<span class="col-lg-5" style="float: left">제목</span> <input
									type="text" class="form-control col-lg-4" name="title"
									id="title" />
							</p>
							<p>
								<span class="col-lg-5" style="float: left">글 내용</span> <input
									type="text" class="form-control col-lg-4" name="content"
									id="content" />
							</p>
							<p>
								<span class="col-lg-5" style="float: left">해시태그</span> <input
									type="text" class="form-control col-lg-4" name="hashtag"
									id="hashtag" />
							</p>
							<p>
								<span class="col-lg-5" style="float: left">등록일</span> <input
									type="text" id="date" name="date" class="form-control col-lg-2"
									style="float: left;" /> <span style="float: left">&nbsp;&nbsp;&nbsp;
									- &nbsp;&nbsp;&nbsp;</span> <input type="text" id="date2" name="date2"
									class="form-control col-lg-2" style="float: left" /><br />
								<br />
							</p>

							<button class="btn btn-primary btn-icon-split"
								id="searchDetailOkBtn">
								<span class="icon text-white-50"> <i
									class="fas fa-search"></i>
								</span> <span class="text">조회</span>
							</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 상세조회 끝 -->
			
			
			<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member List</h6>
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
							<c:forEach var="list" items="${viewAll}">
								<tr
									onClick="location.href='/myapp/adminMemberDetail?m_no=${list.m_no}'">
									<td>${list.m_no}</td>
									<td><img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 50px; height: 50px" /></td>
									<td>${list.userid}</td>
									<td>${list.username}</td>
									<td>${list.email1}@${list.email2}</td>
									<td>${list.tel}</td>
									<td>${list.regdate}</td>
									<td>${list.userpwd}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- pagination -->
					<div style="display: inline-block">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="<%=request.getContextPath()%>/adminMemberList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="<%=request.getContextPath()%>/adminMemberList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="<%=request.getContextPath()%>/adminMemberList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
					<!-- pagination 끝 -->
				</div>
			
		</div>

		</div>	
	</div>
	
</div>