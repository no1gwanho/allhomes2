<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		
       	<div class="col-lg-12">
       		<div class="card shadow mb-4">
       			<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">STORE ADD</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" class="col-lg-10" action="/myapp/storeAdd" enctype="multipart/form-data" style="display:inline-block">
		       				<br/><br/>
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어명</span>
			       				<input type="text" name="s_name" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">사업자등록번호</span>
			       				<input type="text" name="s_num" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">판매자 ID</span>
			       				<input type="text" name="s_id" class="form-control col-lg-6"/>
			       				<a href="" class="btn alert-secondary">검색</a>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 이름</span>
			       				<input type="text" name="staff_n" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Email</span>
			       				<input type="text" name="staff_e" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Tel</span>
			       				<input type="text" name="staff_t" class="form-control col-lg-6"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">홈페이지</span>
			       				<input type="text" name="s_homepage" class="form-control col-lg-6"/>
							</p>
							
							<!-- 이미지 파일 업로드 -->
							<span class="col-lg-4" style="float:left;height:170px;line-height:170px">대표 이미지</span>
							<div class="col-lg-6" style="float:left">
								<img src="/myapp/resources/img/admin/storeBasic.png" style="width:150px;height:150px"/><br/>
					            <input type="file" name="file">
					        </div>
						         
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
			                    <button type="submit" class="btn btn-primary btn-icon-split">
			                    	<span class="icon text-white-50"><i class="fas fa-check"></i>추가</span>
			                    </button>
		                    </div><br/>
		                    <!-- 버튼 끝 -->
						</form><br/><!-- 폼 끝 -->
				</div><!-- card-body 끝 -->
       		</div><!-- card 끝 -->
       	
       	</div><!-- col-lg-8 끝 -->
     </div>
</div>


<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>