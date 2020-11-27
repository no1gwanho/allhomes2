<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
td {
	height: 40px;
	line-height: 40px;
}
</style>

<div class="container-fluid">
	<div class="row">
		<!-- 카드 들 -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-danger text-uppercase mb-1">
								Home Board</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countHb}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-home fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-warning text-uppercase mb-1">
								Q&A Board</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countQa}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-question fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xl font-weight-bold text-info text-uppercase mb-1">
								Review</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">+${countReview}</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-star fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 카드 끝 -->

		

		<div class="col-lg-12">
			
			<div style="display: none" id="searchDate">
				<!-- 기간으로 검색 눌러야 나오는 검색창 -->
				<input type="text" />-<input type="text" />
			</div>

			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary" style="float:left">HomeBoard</h6>
					<a href="/myapp/adminHomeBoard" style="float:right;height:10px">더보기</a>
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
								<tr onClick="location.href=''">
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
			<!-- card 끝 -->


			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Q&A Board</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="" items="">
								<tr onClick="location.href=''">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><a href="#" class="btn btn-danger btn-circle"> <i
											class="fas fa-trash"></i>
									</a></td>
								</tr>
							</c:forEach> --%>
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
			<!-- card 끝 -->
			
			<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Review</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>스토어번호</th>
								<th>스토어명</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>별점</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="" items="">
								<tr onClick="location.href=''">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach> --%>
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
			<!-- card 끝 -->
			


		</div>
		<!-- col-lg-12 끝 -->
	</div>
</div>

<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>