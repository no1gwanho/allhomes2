<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
			<div class="card shadow mb-4">
            	<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">PRODUCT ADD</h6>
				</div>
				<div class="card-body">
					
					<div class="center-block text-center">
						<!-- 이미지 파일 업로드 -->
						<div class="col-lg-12">
								<img src="<%=request.getContextPath()%>/resources/img/admin/pd_basic01.png" style="width:150px;height:150px"/><br/><br/>
								<text>대표 이미지</text>
							<br/><hr/><br/>
							<div class="file-field">
			                   <input class="col-md-12" type="file" id="fileInput">
				                <div class="my-2"></div>
				                <div class="file-path-wrapper">
				                    <input class="file-path validate" type="text" placeholder="Upload your file">
				              	</div>
							</div>
				         </div>
				        
					</div>
				</div>
            </div>
		
		</div><!-- col-lg-4 끝 -->
		
		<div class="col-lg-8">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">상세 정보</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" class="col-lg-10" style="display:inline-block">
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어명</span>
			       				<input type="text" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">사업자등록번호</span>
			       				<input type="text" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">ID</span>
			       				<input type="text" class="form-control col-lg-4"/>
			       				<a href="" class="col-lg-2 btn alert-secondary" style="float:left">검색</a>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">이름</span>
			       				<input type="text" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">Email</span>
			       				<input type="text" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">Tel</span>
			       				<input type="text" class="form-control col-lg-6"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">우편번호</span>
			       				<input type="text" class="form-control col-lg-6"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">주소</span>
			       				<input type="text" class="form-control col-lg-8"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">상세주소</span>
			       				<input type="text" class="form-control col-lg-8"/>
							</p>
								
							<br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
								<a href="#" class="btn btn-success btn-icon-split">
			                         <span class="icon text-white-50">
			                         	 <i class="fas fa-check"></i></span>
			                         <span class="text">추가</span>
			                    </a>
		                    </div>
		                    <!-- 버튼 끝 -->
						</form><br/><!-- 폼 끝 -->
				</div><!-- card-body 끝 -->
				
			</div>
		</div><!-- col-8 끝 -->
	</div>
</div>


<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>