<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				
				<div class="col-lg-1" style="float:left">
					<select class="form-control" id="order" name="order">
						<option class="orderName" value="title">제목 순</option>
						<option class="orderName" value="writedate">작성일 순</option>
						<option class="orderName" value="hit">조회 순</option>
						<option class="orderName" value="scrap">스크랩 순</option>
					</select>
				</div>
				<!-- search 검색 끝 -->
				<div style="float:right">
					<button class="btn btn-user alert-clean shadow-sm mb-4" id="searchDetailBtn">상세조회</button>
				</div>
			</div>
			<!-- 검색 옵션 끝 -->

		<div class="col-lg-12">
			<c:forEach var="list" items="${viewAll}">
				<div class="card shadow mb-4">
					<div class="card-body" style="text-align: center">
						<div class="row">
							<div class="col-lg-8">
								<!-- 제목 -->
								<h4 style="padding-top: 25px;">
									<strong><a href="/myapp/qnaView?q_no=${list.q_no }">${list.title }</a></strong>
								</h4>
								<!-- 본문내용 -->
								<p>
									<a href="/myapp/qnaView">${list.content }</a>
								</p>
								<br /> <br />
								<p>
									<i class="fas fa-user-circle"
										style="width: 30px; height: 30px;"></i> <a href="#">${list.userid }</a>
									&nbsp;&nbsp; ${list.writedate } &nbsp;&nbsp; 답글 :
									${list.answer}개 &nbsp;&nbsp; 조회 : ${list.hit }회 &nbsp;&nbsp;

								</p>
							</div>
							<div class="col-lg-3">
								<a href="#"> <img class="qna-thumnail"
									style="width: 300px; height: 200px;"
									src="<%=request.getContextPath() %>${list.thumbnail }">
								</a>
							</div>
						</div>
						<!-- row끝 -->
					</div>
					<!-- card-body끝 -->
				</div>
			</c:forEach>

			<!-- pagination -->
			

				<ul class="pagination">
					<c:if test="${paging.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/adminMemberList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="page-item disabled"><a class="page-link">${p }</a>
								</li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li class="page-item"><a class="page-link"
									href="<%=request.getContextPath()%>/adminMemberList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/adminMemberList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</li>
					</c:if>
				</ul>
			<!-- pagination 끝 -->
		</div>
	</div>

	</div>
</div>