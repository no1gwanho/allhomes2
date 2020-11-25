<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
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

	<h3 id="blogWriteTitle"><i class="fas fa-question-circle" style="color:#E98374"> </i>질문하기</h3>

	<!-- 글쓰기 폼 여기부터  -->


	<form action="">
		<div class="form-group">
			<input type="text" class="form-control" name="title"
				placeholder="제목을 입력하세요" /><br />
			<textarea class="form-control rounded-0" name="content" id="content" placeholder="다섯글자 이상 입력해주세요">
	 		</textarea>
			<br />
			<br /> 
			<div class="row">
				
				<div class="col-5"></div>
				<div class="col-3">
				<input type="submit" class="btn btn-primary" value="질문하기" style="background-color:#E98374;border:1px solid #E98374;"/> <input
				type="button" id="cancelBtn" class="btn btn-secondary" value="취소" />
				</div>
				<div class="col-4">
				</div>
			</div>
			
			
		</div>
	</form>

</div>