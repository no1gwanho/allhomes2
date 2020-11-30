<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		//스토어 추가
		$("#storeAdd").click(function(){
			if($("#s_name").val()==""){
				alert("스토어명을 입력해주십시오.");
				return false;
			}else if($("#s_num").val()==""){
				alert("사업자등록번호를 입력해주십시오.");
				return false;
			}else if($("#s_id").val()==""){
				alert("판매자 ID를 입력해주십시오.");
				return false;
			}else if($("#staff_n").val()==""){
				alert("담당자 이름을 입력해주십시오.");
				return false;
			}else if($("#staff_e").val()==""){
				alert("담당자 이메일을 입력해주십시오.");
				return false;
			}else if($("#staff_t").val()==""){
				alert("담당자 연락처를 입력해주십시오.");
				return false;
			}
				
		});
		
		$("#previewImg").on("change", selectImgPreview);
	});
	
	function selectImgPreview(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

</script>
<div class="container-fluid">
	<div class="row">
		
       	<div class="col-lg-12">
       		<div class="card shadow mb-4">
       			<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">STORE ADD</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" action="/myapp/storeAddOk" id="storeAddForm" class="col-lg-10" enctype="multipart/form-data" style="display:inline-block">
		       				<br/><br/>
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어명</span>
			       				<input type="text" id="s_name" name="s_name" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">사업자등록번호</span>
			       				<input type="text" id="s_num" name="s_num" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">판매자 ID</span>
			       				<input type="text" id="s_id" name="s_id" class="form-control col-lg-6"/>
			       				<a href="" class="btn alert-secondary">검색</a>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 이름</span>
			       				<input type="text" id="staff_n" name="staff_n" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Email</span>
			       				<input type="text" id="staff_e" name="staff_e" class="form-control col-lg-6"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Tel</span>
			       				<input type="text" id="staff_t" name="staff_t" class="form-control col-lg-6"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">홈페이지</span>
			       				<input type="text" id="s_homepage" name="s_homepage" class="form-control col-lg-6"/>
							</p>
							
							<!-- 이미지 파일 업로드 -->
							<span class="col-lg-4" style="float:left;height:170px;line-height:170px">대표 이미지</span>
							<div class="col-lg-6" style="float:left" id="preview">
								<img src="/myapp/resources/img/admin/storeBasic.png" id="img" style="width:150px;height:150px"/><br/><br/>
					            <input type="file" name="file" id="previewImg">
					        </div>
						         
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
			                    <button id="storeAdd" class="btn btn-primary btn-icon-split">
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