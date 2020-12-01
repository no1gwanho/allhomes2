<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		//select-기간 선택하면 input box 바꾸기
		$("#searchSelect").change(function(){
			if($("#searchSelect option:selected").val()=="writedate"){
				$("#searchKey").css("display", "none");
			}
			
			
		});
		
		//search 클릭
		$("#searchBtn").click(function(){
			var col = $("#searchSelect option:selected").val();
			var keyword = $("#searchKeyword").val();
			
			if(col=="userid"){ //아이디로 검색
				location.href = "/myapp/adminHomeboardSearchUserid?key="+keyword;
			}else if(col=="title"){ //제목으로 검색
				location.href = "/myapp/adminHomeboardSearchTitle?key="+keyword;
			}else if(col=="content"){ //글내용으로 검색
				location.href = "/myapp/adminHomeboardSearchContent?key="+keyword;
			}
			
			
			
			
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
							<option value="title">제목으로 검색</option>
							<option value="content">글 내용으로 검색</option>
							<option value="writedate">기간으로 검색</option>
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
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary">HomeBoard</h6>
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
									<td><a href="#" class="btn btn-danger btn-circle"> <i
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
