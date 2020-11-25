<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
	td{height:50px; line-height:50px}
</style>

<div class="container-fluid">
	    <!-- 검색 옵션 -->
		<div>
              <select class="mdb-select md-form mb-4 initialized" id="select">
                   <option value="" disabled selected>option</option>
                   <option value="1">스토어명 순</option>
                   <option value="2">입점일 순</option>
                   <option value="3">제품 순</option>
               </select>
        </div>
            
            
		<!-- 버튼 -->
		<a href="/myapp/storeAdd" class="btn btn-primary btn-icon-split">
                <span class="icon text-white-50">
                   <i class="fas fa-check"></i>
                </span>
           <span class="text">추가</span>
        </a>
		
		<div class="mb-2"></div>
		<div class="card shadow mb-4">
			<div class="card-body" style="text-align:center">	
				<table style="cursor:pointer;" class="table table-hover">
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
					<tr onClick="location.href='/myapp/adminStoreDetail?s_no=${vo.s_no}'">
						
						<td>${vo.s_no}</td>
						<td>${vo.s_name}</td>
						<td>${vo.s_num}</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/img/admin/storeBasic.png" style="width:50px;height:50px;"/>
						</td>
						<td>${vo.s_id}</td>
						<td>${vo.staff_t}</td>
						<td>${vo.openingdate}</td>
					</tr>
					</c:forEach>
					
					</tbody>	
				</table>
				
				<!-- pagination -->
				<div style="display:inline-block">
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
					
			</div><!-- card body 끝 -->
		</div><!-- card 끝 -->
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>