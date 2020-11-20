<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<h1>회원 관리 페이지</h1>
<div class="container-fluid">
	<div class="col-lg-12">
	
		<!-- 검색 옵션 -->
		<div>
               <select class="selectpicker">
               		<optgroup label="검색 필터">
	                 
	                   <option value="userid">ID</option>
	                   <option value="username">이름</option>
	                   <option value="regdate">등록일</option>
                   </optgroup>
               </select>
        </div>
        <div class="my-2"></div>
        <!-- 테이블 -->
		<div class="card shadow mb-4">				
			<table style="cursor:pointer;" class="table table-hover">
				<thead>
				<tr>
					<th>번호</th>
					<th>프로필</th>
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>Tel</th>
					<th>생년월일</th>
					<th>비밀번호</th>
				</tr>
				</thead>
				<tbody>
				<tr onClick="location.href='/myapp/adminMemberDetail'">
					<th>2352622</th>
					<th></th>
					<th>seran111</th>
					<th>권세란</th>
					<th>rnjstpfk@nate.com</th>
					<th>010-1231-1231</th>
					<th>961221</th>
					<th>SJF252#FDFAW!LF</th>
				</tr>
				</tbody>	
			</table>
		</div>
	</div>	
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>