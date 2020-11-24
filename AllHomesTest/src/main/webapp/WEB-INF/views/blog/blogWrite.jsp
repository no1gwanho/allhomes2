<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script src="https://kit.fontawesome.com/69f9d4fad2.js" crossorigin="anonymous"></script>	
<!-- 해시태그를 위한 css/js파일 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-tagsinput.css">
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-tagsinput.js"></script>
<!-- 글쓰기폼을 위한 CKEDITOR -->
<script>
	$(function() {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'/myapp/editor/imageUpload.do',
			height:500,
			extraPlugins : 'confighelper',
		});
	});
</script>


<style>

	#cke_129_label{value:"이미지 업로드"}

	.label{background-color:#E98374;}
	#blogWriteTitle {
		margin: 20px 0 50px 20px;
	}
	
	.blogWriteSub {
		margin-left: 20px;
	}
	.blogWriteSub{
		font-size:15px;
	}
	.btn-info{background-color:#E98374;}
	.btn-info:hover, .btn-info:active, .btn-info:focus{background-color:#F9AA9F}
</style>



<div class="container">

	<h3 id="blogWriteTitle">집들이 글쓰기</h3>

	<!-- 테마선택 메뉴 -->
	<div class="row">
		<div class="col-2">
			<h5 class="blogWriteSub">테마선택</h5>
		</div>
		
		<div class="col-2">
			<select class="browser-default custom-select">
			  <option selected>테마 선택</option>
			  <option value="1">테마1</option>
			  <option value="2">테마2</option>
			  <option value="3">테마3</option>
			  <option value="3">테마4</option>
			</select>
		</div>
	</div>
	<!-- 테마선택 메뉴 끝 ======================== -->
	<hr/>

	
	<!-- 해시태그입력 창 시작====-->
	<!-- 해시태그 창 -->
	<div class="row">
		<div class="col-2">
			<h5 class="blogWriteSub">태그입력</h5>
			
		</div>
		<div class="col-9"><!-- 태그는 엔터나 쉼표를 입력하면 확인됨 -->
			<input id="hashtagForm" type="text" value="해시태그, 테스트" data-role="tagsinput" placeholder="태그를 입력하세요 :)" style="width:300px"/><br/>
			<span style="color:gray;font-size:11px;">해시태그는 최대 8개까지, 최대 10글자까지 입력 가능합니다.</span>
		</div>
	</div> <!-- row -->
	<hr/>



	<!-- 글쓰기 폼 여기부터  -->

	<br />
	<br />

	<form action="">
		<div class="form-group">
			<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" />
			<br/>
			<textarea class="form-control rounded-0" name="content" id="content" placeholder="최소 열글자 이상 입력해주세요">
			</textarea>
			<br/>
			<br/> 
				<input type="submit" class="btn btn-primary" value="글작성" style="background-color:#E98374;border:1px solid #E98374;text-align:center;"/> 
				<input type="button" id="cancelBtn" class="btn btn-secondary" value="취소" style="text-align:center;"/>
		</div>
	</form>

</div>