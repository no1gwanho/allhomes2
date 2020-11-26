<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		$("#orderMember").click(function(){
			var order = $("#orderVal option:selected").val()+" "+$("#order option:selected").val();
			alert(order);
			
			location.href="/myapp/adminMemberMainOrder?val="+order;
		});
	});
</script>
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
	              <select id="orderVal" class="selectpicker">
	               		<optgroup label="검색 필터"> 
		                   <option name="order" value="userid">ID</option>
		                   <option name="order" value="username">이름</option>
		                   <option name="order" value="regdate">가입일</option>
	                   </optgroup>
	               </select>
	               <select id="order" class="selectpicker">
	               		<optgroup label="정렬">
		                   <option name="" value="asc">오름차순</option>
		                   <option name="" value="desc">내림차순</option>
	                   </optgroup>
	               </select>
	               
	               <button id="orderMember" class="btn alert-light"><span class="text">정렬</span></button>
	               
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
							<th>가입일</th>
							<th>비밀번호</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${list}">
							<tr onClick="location.href='/myapp/adminMemberDetail?m_no=${vo.m_no}'">
								<td>${vo.m_no}</td>
								<td>
									<img src="/myapp/resources/img/admin/user_basic.png" style="width:50px;height:50px"/>
								</td>
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