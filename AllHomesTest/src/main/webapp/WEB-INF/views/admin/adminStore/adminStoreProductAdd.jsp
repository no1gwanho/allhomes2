<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">PRODUCT ADD</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" class="col-lg-10" style="display:inline-block">
		       				<br/>
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어번호</span>
			       				<input type="text" name="s_no" class="form-control col-lg-6" value="${s_no}"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">상품명</span>
			       				<input type="text" name="pd_name" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
		       					<span class="col-lg-4" style="float:left">카테고리</span>
		       					<div class="col-lg -6 form-check form-check">
		       						<c:forEach var="list" items="${subList}">
								  		<input class="form-check-input" id="${list.sub_c}" type="checkbox" value="${list.sub_c}">
								  		<label class="form-check-label" for="${list.sub_c}">${list.sub_c}</label>
									</c:forEach>
								</div>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">가격</span>
			       				<input type="number" name="price" class="form-control col-lg-6" placeholder="0"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">할인률(%)</span>
			       				<input type="number" name="discount" class="form-control col-lg-6" placeholder="0"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">재고</span>
			       				<input type="number" name="stock" class="form-control col-lg-6" placeholder="0"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">상태</span>
			       				<select class="form-control col-lg-6" name="status"/>
			       					<option>판매중</option>
			       					<option>입고예정</option>
			       					<option>품절</option>
			       				</select>
							</p>
							
							<p>
								<span class="col-lg-4" style="float:left;height:170px;line-height:170px">썸네일</span>
								<div class="col-lg-6" style="float:left">
									<img src="<%=request.getContextPath()%>/resources/img/admin/pd_basic01.png" style="width:150px;height:150px"/><br/><br/>
									<input class="col-md-12" type="file" id="fileInput">
								</div>
				        	</p>
				        	
				        	<p>
				        		<br/><br/><br/>
								<span class="col-lg-4" style="float:left;height:170px;line-height:170px">상품 이미지</span>
								<div class="col-lg-6" style="float:left">
									<input class="col-md-12" type="file" id="fileInput">
									<input class="col-md-12" type="file" id="fileInput">
									<input class="col-md-12" type="file" id="fileInput">
									<input class="col-md-12" type="file" id="fileInput">
									<input class="col-md-12" type="file" id="fileInput">
								</div>
				        	</p>
				        	
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-icon-split">
			                         <span class="icon text-white-50">
			                         	 <i class="fas fa-check"></i></span>
			                         <span class="text">추가</span>
			                    </button>
		                    </div><br/>
		                    <!-- 버튼 끝 -->
						</form><br/><!-- 폼 끝 -->
				</div><!-- card-body 끝 -->
				
			</div>
		</div><!-- col-8 끝 -->
	</div>
</div>


<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>