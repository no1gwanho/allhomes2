<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		$("#productAdd").click(function(){
			if($("#pd_name").val()==""){
				alert("상품명을 입력해주십시오.");
				return false;
			}else if($("#price").val()==""){
				alert("가격을 입력해주십시오.");
				return false;
			}else if($("#stock").val()==""){
				alert("재고를 입력해주십시오.");
				return false;
			}else if($("#status").val()==""){
				alert("상태를 선택해주십시오.");
				return false;
			}else if($("#mainImgFile").val()==""){
				alert("대표 이미지를 선택해주십시오.");
				return false;
			}
			
		});
		
		var i=2;
		//옵션 + 클릭
		$("#optionAdd").click(function(){
			$("#optionDiv").append("<p><span class='col-lg-4' style='float:left'>옵션"+i+"</span><input type='text' name='o_value' class='col-lg-6 form-control'/></p>");
			i++;
		});
		
		//옵션 - 클릭
		$("#optionDel").click(function(){
			$("#optionDiv > p").last().remove();
			i--;
		});
		
		
		//미리보기
		$("#mainImgFile").on("change", selectImgPreview);
		
	});

	//미리보기 function
	function selectImgPreview(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#mainImg").attr("src", e.target.result);
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
						<h6 class="m-0 font-weight-bold text-primary">PRODUCT ADD</h6>
				</div>
				<div class="card-body" style="text-align:center">
		       			<form method="post" action="/myapp/productAddOk?s_no=${s_no}" id="productForm" class="col-lg-10" style="display:inline-block"  enctype="multipart/form-data">
		       				<br/>
		       				<p>
			       				<span class="col-lg-4" style="float:left">스토어번호</span>
			       				<input type="number" name="s_no" class="form-control col-lg-6" value="${s_no}" disabled/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">상품명</span>
			       				<input type="text" id="pd_name" name="pd_name" class="form-control col-lg-6"/>
		       				</p>
		       				
		       					<span class="col-lg-4" style="float:left;height:80px;line-height:80px">카테고리</span>
		       					<div class="col-lg -6 form-check">
		       						<div class="col-lg-8 shadow-sm" style="border:1px solid #dddddd;border-radius:10px;float:left;">
		       							<br/>
			       						<c:forEach var="list" items="${subList}">
			       								<div class="col-lg-4" style="float:left">
			       									<p>
									  				<input class="form-check-input" id="sub_c" type="checkbox" name="sub_c" value="${list.sub_c}">
									  				<label class="form-check-label" for="sub_c">${list.sub_c}(${list.main_c})</label>
									  				</p>
									  			</div>
										</c:forEach>
									</div>
								</div>
							<br/><br/><br/><br/><br/>
							
							<div id="optionDiv">
								<p>
									<span class="col-lg-4" style="float:left">옵션1</span>
									<span id="optionDel" class="btn alert-clean shadow-sm" style="float:right;margin-right:80px">-</span>
									<span id="optionAdd" class="btn alert-clean shadow-sm" style="float:right;margin-right:20px">+</span>
			       					<input type="text" name="o_value" class="col-lg-6 form-control"/>
			       				</p>
								
			       			</div>	
							
		       				<p>
		       					<span class="col-lg-4" style="float:left">제품 설명</span>
			       				<textarea  id="pd_exp" name="pd_exp" class="form-control col-lg-6"></textarea>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">가격</span>
			       				<input type="number" id="price" name="price" class="form-control col-lg-6" placeholder="0"/>
		       				</p>
		       				<p>
			       				<span class="col-lg-4" style="float:left">할인률(%)</span>
			       				<input type="number" id="discount" name="discount" class="form-control col-lg-6" placeholder="0"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">재고</span>
			       				<input type="number" id="stock" name="stock" class="form-control col-lg-6" placeholder="0"/>
							</p>
							<p>
			       				<span class="col-lg-4" style="float:left">상태</span>
			       				<select class="form-control col-lg-6" id="status" name="status">
			       					<option>판매중</option>
			       					<option>입고예정</option>
			       					<option>품절</option>
			       				</select>
							</p>
							
							<p>
								<span class="col-lg-4" style="float:left;height:170px;line-height:170px">대표이미지</span>
								<div class="col-lg-6 shadow-sm" style="border:1px solid #dddddd;border-radius:10px;float:left;">
									<br/>
									<img src="<%=request.getContextPath()%>/resources/img/admin/pd_basic01.png" style="width:150px;height:150px" id="mainImg"/><br/><br/>
									<input type="file" name="mainImg" id="mainImgFile">
									<br/><br/>
								</div>
							
				        	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				        	<p>
								<span class="col-lg-4" style="float:left;">상품 이미지</span>
				        		<input type="file" name="img" multiple="multiple">
				        	</p>
				        	
							<br/><hr/><br/>
							<!-- 버튼 -->
							<div class="text-center">
								<button id="productAdd" class="btn btn-primary btn-icon-split">
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