<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<h1>스토어 추가</h1>
<div class="container-fluid">
	
		<div class="row">
		
			<div class="col-lg-12">
			
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-secondary">Store ADD</h6>
					</div>
					<div class="card-body">
					
						<!-- 이미지 파일 업로드 -->
						<div class="col-lg-6">
							<div>
								<img src="/myapp/resources/img/storeadd.png" style="width:200px; height:200px;"/>
							</div>
							<div class="file-field">
			                	<div class="btn btn-primary btn-sm float-left ">
			                    	<span>Choose file</span>
			                    	<input type="file" id="fileInput">
			                	</div>
			                	<div class="file-path-wrapper">
			                    	<input class="file-path validate" type="text" placeholder="Upload your file">
			                	</div>
			            	</div>
						</div>
					
					<div class="col-lg-6">
						<form class="md-form"  style="color: #757575;" method="post" action="">
	                    	<label for="materialSaveFormName">스토어명</label>
							<input type="text" id="materialSaveFormName" class="form-control"><br/>
	                    	
		                    <label for="materialSaveFormEmail">사업자등록번호</label>
		                    <input type="email" id="materialSaveFormEmail" class="form-control"><br/>
	
		                    <label for="materialSaveFormLastName">ID</label>
		                    <input type="email" id="materialSaveFormLastName" class="form-control"><br/>
		
							<label for="materialSaveFormLastName">이름</label>
		                    <input type="email" id="materialSaveFormLastName" class="form-control"><br/>
		
							<label for="materialSaveFormLastName">E-mail</label>
		                    <input type="email" id="materialSaveFormLastName" class="form-control"><br/>
							
							<label for="materialSaveFormLastName">Tel</label>
		                    <input type="email" id="materialSaveFormLastName" class="form-control"><br/>
							
							<label for="materialSaveFormLastName">사업장 주소</label>
		                    <input type="email" id="materialSaveFormLastName" class="form-control">
		                    <div class="my-2"></div>
							<input type="email" id="materialSaveFormLastName" class="form-control">
							<div class="my-2"></div>
							<input type="email" id="materialSaveFormLastName" class="form-control"><br/>
							
							
							<!-- 버튼 -->
							<a href="#" class="btn btn-success btn-icon-split">
                                <span class="icon text-white-50">
                                <i class="fas fa-check"></i>
                                </span>
                                <span class="text">추가</span>
                            </a>
                            
                            <a href="/myapp/adminStore" class="btn btn-secondary btn-icon-split">
                                <span class="text">취소</span>
                            </a>
                            <!-- 버튼 끝 -->
                                    
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>