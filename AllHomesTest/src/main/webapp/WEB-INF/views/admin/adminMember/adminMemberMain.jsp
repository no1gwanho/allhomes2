<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
		
			<!-- 검색 옵션 -->
			<!-- <div>
				<select class="selectpicker">
	               	<optgroup label="검색 필터"> 
		     	    <option value="">번호</option>
		            <option value="">ID</option>
		            <option value="">이름</option>
	                </optgroup>
	            </select>
	            <input type="text"/>
			</div> -->
			
			<div>
	              <select class="selectpicker">
	               		<optgroup label="검색 필터"> 
		                   <option value="userid">ID</option>
		                   <option value="username">이름</option>
		                   <option value="regdate">등록일</option>
	                   </optgroup>
	               </select>
	               <select class="selectpicker">
	               		<optgroup label="정렬">
		                   <option value="username">오름차순</option>
		                   <option value="regdate">내림차순</option>
	                   </optgroup>
	               </select>
	               
	               <a href="#" class="btn alert-light"><span class="text">정렬</span></a>
	               
	        </div>
	        <div class="my-2"></div>
	        <!-- 테이블 -->
	        <style>
	        	td{height:50px; line-height:50px;}
	        </style>
			<div class="card shadow mb-4">		
				<div class="card-body" style="text-align:center">		
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
							<td>2352622</td>
							<td>
								<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
							</td>
							<td>seran111</td>
							<td>권세란</td>
							<td>rnjstpfk@nate.com</td>
							<td>010-1231-1231</td>
							<td>961221</td>
							<td>SJF252#FDFAW!LF</td>
						</tr>
						<tr onClick="location.href='/myapp/adminMemberDetail'">
							<td>2352622</td>
							<td>
								<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
							</td>
							<td>seran111</td>
							<td>권세란</td>
							<td>rnjstpfk@nate.com</td>
							<td>010-1231-1231</td>
							<td>961221</td>
							<td>SJF252#FDFAW!LF</td>
						</tr>
						<tr onClick="location.href='/myapp/adminMemberDetail'">
							<td>2352622</td>
							<td>
								<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
							</td>
							<td>seran111</td>
							<td>권세란</td>
							<td>rnjstpfk@nate.com</td>
							<td>010-1231-1231</td>
							<td>961221</td>
							<td>SJF252#FDFAW!LF</td>
						</tr>
						<tr onClick="location.href='/myapp/adminMemberDetail'">
							<td>2352622</td>
							<td>
								<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
							</td>
							<td>seran111</td>
							<td>권세란</td>
							<td>rnjstpfk@nate.com</td>
							<td>010-1231-1231</td>
							<td>961221</td>
							<td>SJF252#FDFAW!LF</td>
						</tr>
						<tr onClick="location.href='/myapp/adminMemberDetail'">
							<td>2352622</td>
							<td>
								<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
							</td>
							<td>seran111</td>
							<td>권세란</td>
							<td>rnjstpfk@nate.com</td>
							<td>010-1231-1231</td>
							<td>961221</td>
							<td>SJF252#FDFAW!LF</td>
						</tr>
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
				</div>
			</div><!-- card 끝 -->
		</div><!-- col끝 -->
	</div>	
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>