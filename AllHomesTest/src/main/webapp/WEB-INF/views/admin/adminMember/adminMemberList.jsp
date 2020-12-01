<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		//search 클릭
		$("#searchBtn").click(function(){
			var col = $("#searchSelect option:selected").val();
			var keyword = $("#searchKeyword").val();
			
			if(col=="userid"){ //아이디로 검색
				location.href = "/myapp/adminMemberSearchUserid?key="+keyword;
			}else if(col=="username"){ //이름으로 검색
				location.href = "/myapp/adminMemberSearchUsername?key="+keyword;
			}else if(col=="email"){//이메일로 검색
				location.href = "/myapp/adminMemberSearchEmail?key="+keyword;
			}else if(col=="tel"){//연락처로 검색
				location.href = "/myapp/adminMemberSearchTel?key="+keyword;
			}
			
			alert(col+" "+keyword);
		});
		
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="my-2"></div>
			
			<!-- 검색 옵션 -->
			<div>
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
				<div class="input-group col-lg-3" id="searchKey">
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
				
			</div>
			<!-- 검색 옵션 끝 -->
			<div class="my-2"></div>
			
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


		</div>	
	</div>
	
</div>