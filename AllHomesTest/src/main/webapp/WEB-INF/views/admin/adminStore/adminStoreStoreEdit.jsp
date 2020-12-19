<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		//스토어 수정
		$("#storeEdit").click(function(){
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
			
			var url = "/myapp/storeEditOk";
			var data = $("#storeEditOkForm").serialize();
			
			$.ajax({
				type:'POST',
				url: url,
				data: data,
				success:function(result){
					if(result>0){
						alert("수정이 완료됐습니다.");
					}
				},error: function(){
					console.log("스토어 수정 에러");
				}
			});
				
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		
       	<div class="col-lg-12">
       		<div class="card shadow mb-4">
       			<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">STORE EDIT</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" id="storeEditOkForm" class="col-lg-10"  enctype="multipart/form-data" style="display:inline-block">
		       				<br/><br/>
		       				<input type="hidden" name="s_no" value="${vo.s_no}"/>
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어명</span>
			       				<input type="text" name="s_name" class="form-control col-lg-6" value="${vo.s_name}"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">사업자등록번호</span>
			       				<input type="text" name="s_num" class="form-control col-lg-6" value="${vo.s_num}"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">판매자 ID</span>
			       				<input type="text" name="s_id" class="form-control col-lg-6" value="${vo.s_id }"/>
			       				
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 이름</span>
			       				<input type="text" name="staff_n" class="form-control col-lg-6" value="${vo.staff_n}"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Email</span>
			       				<input type="text" name="staff_e" class="form-control col-lg-6" value="${vo.staff_e}"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">담당자 Tel</span>
			       				<input type="text" name="staff_t" class="form-control col-lg-6" value="${vo.staff_t}"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">홈페이지</span>
			       				<input type="text" name="s_homepage" class="form-control col-lg-6" value="${vo.s_homepage}"/>
							</p>
							
							<!-- 이미지 파일 업로드 -->
							<span class="col-lg-4" style="float:left;height:170px;line-height:170px">대표 이미지</span>
							<div class="col-lg-6" style="float:left">
								 <img src="<%=request.getContextPath()%>/resources/upload/storeImg/${vo.s_pic}"
								  style="width:150px;height:150px; border-radius:70%;"/><br/>
					            <input type="file" name="file">
					        </div>
						         
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
			                    <button id="storeEdit" class="btn btn-primary">
			                    	수정
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