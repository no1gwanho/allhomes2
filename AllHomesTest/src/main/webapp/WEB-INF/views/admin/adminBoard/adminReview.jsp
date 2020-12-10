<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
	<div class="row">
		<!-- 검색 옵션 -->
			<div class="col-lg-12">
				<!-- <div style="float:left">
					<select class="selectpicker" id="searchSelect">
						<optgroup label="검색 필터">
							<option value="userid">회원 ID로 검색</option>
							<option value="title">제목으로 검색</option>
							<option value="content">글 내용으로 검색</option>
						</optgroup>
					</select>
				</div> -->

				<!-- search 검색 -->
				
				<!-- <div class="input-group col-lg-3" id="searchKey" style="float:left">
					<input type="text" id="searchKeyword" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-dark" type="button" id="searchBtn">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
					
				</div> -->
				
				<!-- <div class="col-lg-2" style="float:left">
					<select class="form-control" id="order" name="order">
						<option class="orderName" value="title">제목 순</option>
						<option class="orderName" value="writedate">작성일 순</option>
						<option class="orderName" value="hit">조회 순</option>
						<option class="orderName" value="scrap">스크랩 순</option>
					</select>
				</div> -->
				<!-- search 검색 끝 -->
				<!-- <div style="float:right">
					<button class="btn btn-user alert-clean shadow-sm mb-4" id="searchDetailBtn">상세조회</button>
				</div> -->
			</div>
			<!-- 검색 옵션 끝 -->
			
			<div class="col-lg-12">
				<div class="row">
					<c:forEach var="list" items="${viewAll}">
					
						<div class="card shadow col-lg-5 mr-4 ml-4 mb-4" style="padding:0">
							<div class="card-header">
								<h6 class="m-0 font-weight-bold text-primary" 
								style="float:left;height:35px;line-height:35px;">
									<img src="<%=request.getContextPath()%>/resources/upload/register/${list.m_pic}"
									 class="mr-2 ml-2" style="width:40px;height:40px;border-radius:70%;">
								${list.userid}</h6>
								<span class="ml-4" style="height:35px;line-height:40px;">${list.writedate }</span>
								<button class="btn btn-user alert-danger" style="float:right;height:35px">삭제</button>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-6">
										<img src="" style="width:300px;height:300px;">
									</div>
									<div class="col-lg-6">
										<p>
											<span>스토어 :</span>
											<span class="font-weight-bold">${list.s_name }</span>
										</p>
										<p>
											<span>상품 :</span>
											<span class="font-weight-bold"> ${list.pd_name}</span>
										</p>
										<p class="mb-4">
											별점 :
											<span style="color:#EE8374">
											<c:choose>
												<c:when test="${list.rating=='1'}">
													★
												</c:when>
												<c:when test="${list.rating=='2'}">
													★★
												</c:when>
												<c:when test="${list.rating=='3'}">
													★★★
												</c:when>
												<c:when test="${list.rating=='4'}">
													★★★★
												</c:when>
												<c:when test="${list.rating=='5'}">
													★★★★★
												</c:when>
											</c:choose>
											</span>
										</p>
										<p class="mt-4">
										내용 : ${list.content}
										</p>
									</div>
								</div>
							
							</div><!-- card-body끝 -->
						
						</div>
					
					
					</c:forEach>
					
					<div class="col-lg-12" style="text-align:center">
						<div style="display:inline-block">
						<ul class="pagination">
							<c:if test="${paging.startPage != 1 }">
								<li class="page-item">
									<a class="page-link"
										href="<%=request.getContextPath()%>/adminReview?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
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
											href="<%=request.getContextPath()%>/adminReview?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item">
									<a class="page-link"
										href="<%=request.getContextPath()%>/adminReview?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>