<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<h1>스토어-스토어 관리 메인</h1>
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
            
            
		<!-- 버튼들 -->
		<a href="/myapp/storeAdd" class="btn btn-secondary btn-icon-split">
                <span class="icon text-white-50">
                   <i class="fas fa-arrow-right"></i>
                </span>
           <span class="text">추가</span>
        </a>
		
		<a href="#" class="btn btn-secondary btn-icon-split">
                <span class="icon text-white-50">
                   <i class="fas fa-arrow-right"></i>
                </span>
           <span class="text">수정</span>
        </a>
        
        <a href="#" class="btn btn-danger btn-icon-split">
                <span class="icon text-white-50">
                   <i class="fas fa-trash"></i>
                </span>
           <span class="text">삭제</span>
        </a>
		
		<!-- 버튼 끝 -->
		
		<div class="mb-2"></div>
		<div class="card shadow mb-4"><!-- 테이블~~~~ -->
				
			<table style="cursor:pointer;" class="table table-hover">
				<thead>
				<tr>
					<th>번호</th>
					<th>스토어명</th>
					<th>사업자등록번호</th>
					<th>프로필</th>
					<th>ID</th>
					<th>입점일</th>
					<th>제품</th>
				</tr>
				</thead>
				<tbody>
				<tr onClick="location.href='/myapp/adminStoreDetail'">
					<th>번호</th>
					<th>스토어명</th>
					<th>사업자등록번호</th>
					<th>프로필</th>
					<th>ID</th>
					<th>입점일</th>
					<th>제품</th>
				</tr>
				</tbody>	
			</table>
			
	
		</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>