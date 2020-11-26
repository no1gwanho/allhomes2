<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<!-- 해시태그를 위한 css/js파일 -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-tagsinput.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-tagsinput.css">


<!-- 글쓰기폼을 위한 CKEDITOR -->
<script>
	$(function() {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'/myapp/editor/imageUpload.do',
			height:500,
			extraPlugins : 'confighelper',
		});
	
	
		$('#submitBtn').click(function(){
			console.log('전송버튼 누르기');
			var ckContent = CKEDITOR.instances.content.getData(); //ckeditor글내용
			var ckContentLength = CKEDITOR.instances.content.getData().length(); //ckeditor에 쓴 글자수
			if($('#title').val()==''){
				alert("제목을 입력해주세요");
				return false;
			}
			if(ckContent==""){
				alert("내용을 입력해주세요");
				return false;
			}
			if(ckContentLength<10){
				alert("최소열글자 이상 입력해주세요");
				return false;
			}
		});
			
	
	
	});//jquery
</script>


<style>

	.label{background-color:#E98374;}
	#homeboardWriteTitle {
		margin: 20px 0 50px 20px;
	}
	
	.homeboardWriteSub {
		margin-left: 20px;
	}
	.homeboardWriteSub{
		font-size:15px;
	}
	.btn-info{background-color:#E98374;}
	.btn-info:hover, .btn-info:active, .btn-info:focus{background-color:#F9AA9F}
</style>



<div class="container">

	<h3 id="homeboardWriteTitle">집들이 글쓰기</h3>
	
	
	<form id="homeboardForm" method="post" action="/myapp/homeboardWriteOk" >
	
	<!-- 테마선택 메뉴 -->
	<div class="row">
		<div class="col-2">
			<h5 class="homeboardWriteSub">테마선택</h5>
		</div>
		
		<div class="col-2">
			<select id="theme" name="theme" class="browser-default custom-select">
					<option value=""></option>
				<c:forEach var="vo" items="${themeList }"> 
					<option value="${vo.theme }">${vo.theme }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<!-- 테마선택 메뉴 끝 ======================== -->
	<hr/>

	
	<!-- 해시태그입력 창 시작====-->
	<!-- 해시태그 창 -->
	<div class="row">
		<div class="col-2">
			<h5 class="homeboardWriteSub">태그입력</h5>
			
		</div>
		<div class="col-9"><!-- 태그는 엔터나 쉼표를 입력하면 확인됨 -->
			<input name="hashtag" id="hashtagForm" type="text" data-role="tagsinput" placeholder="태그를 입력하세요 :)" style="width:300px"/><br/>
			<span style="color:gray;font-size:11px;">해시태그는 최대 8개까지, 최대 10글자까지 입력 가능합니다.</span>
		</div>
	</div> <!-- row -->
	<hr/>

	<!-- 글쓰기 폼 여기부터  -->

	<br />
	<br />

	
		<div class="form-group">
			<input id="title" type="text" class="form-control" name="title" placeholder="제목을 입력하세요" />
			<br/>
			<textarea id="content" name="content" class="form-control rounded-0" placeholder="최소 열글자 이상 입력해주세요">
			</textarea>
			<br/>
			<br/> 
				<input type="submit" id="submitBtn" class="btn btn-primary" value="글작성" style="background-color:#E98374;border:1px solid #E98374;text-align:center;"/> 
				<input type="button" id="cancelBtn" class="btn btn-secondary" value="취소" style="text-align:center;"/>
		</div>
	</form>

</div>