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
			filebrowserUploadUrl:'/myapp/editor/qnaImageUpload.do',
			height:500,
			extraPlugins : 'confighelper',
		});
		
		$('#cancelBtn').click(function(){
			window.history.back();
		});
		
		console.log(CKEDITOR.instances.content.getData().length);
		$("#qnaForm").submit(()=>{
			var ckContent = CKEDITOR.instances.content.getData(); //ckeditor글내용
			var ckContentLength = CKEDITOR.instances.content.getData().length; //ckeditor에 쓴 글자수
			
			if($('#title').val()==''){ //제목이 입력되지 않았을때
				alert("제목을 입력해주세요"); 
				$('#title').focus();
				return false;
			}
			if($('#title').val().length<6){
				alert("제목은 5글자 이상 입력해주세요");
				return false;
			}
			
			if(ckContent==""){ //본문 내용이 입력되지 않았을때
				alert("내용을 입력해주세요");
				CKEDITOR.instances.content.focus();
				return false;
			}
			if(ckContentLength < 18){
				alert("열글자 이상 입력해주세요");
				CKEDITOR.instances.content.focus();
				return false;
			}
		});
		
		return true;
	});//jquery
</script>




<style>
	.col-3{
			text-align:center;
			margin-bottom:10px;
	}

	.label{
		background-color:#E98374;
	}
	#qnaboardWriteTitle{
		margin: 50px 0 20px 20px;
	}
	.label-info{
		background-color:#E98374;
		color:white;
	}
	.container{
		font-family: 'SCDream3';
	}

</style>


<div class="container">

	<h3 id="qnaboardWriteTitle">질문하기</h3>
	<form id="qnaForm" method="post" action="/myapp/qnaWriteOk" >
	
		<div class="form-group">
			<input id="title" type="text" class="form-control" name="title" placeholder="제목을 입력하세요(최소 5글자 이상 입력해주세요)" maxlength="100"/>
			<br/>
			<textarea id="content" name="content" class="form-control rounded-0" placeholder="글을 입력하세요(최소 10글자 이상 입력해주세요)">
			</textarea>
			<br/>
			<br/> 
				<input type="submit" id="submitBtn" class="btn btn-primary" value="질문하기" style="background-color:#E98374;border:1px solid #E98374;text-align:center;"/> 
				<input type="button" id="cancelBtn" class="btn btn-secondary" value="취소" style="text-align:center;"/>
		</div>
	</form>

</div>