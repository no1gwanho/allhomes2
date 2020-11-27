<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
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


		</div>	
	</div>
	
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>