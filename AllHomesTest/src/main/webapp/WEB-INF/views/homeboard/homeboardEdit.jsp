<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<!-- 해시태그를 위한 css/js파일 -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-tagsinput.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-tagsinput.css">

<!-- 글쓰기폼을 위한 CKEDITOR -->
<script>
	$(function() {
		//CKEDITOR 
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'/myapp/editor/imageUpload.do',
			height:500,
			extraPlugins : 'confighelper',
		});
		
		//글쓰기폼에서 '취소버튼' 누르면 뒤로가기
		$('#cancelBtn').click(function(){
			window.history.back();
		});
			
	
		
		$("#homeboardForm").submit(()=>{
			var ckContent = CKEDITOR.instances.content.getData(); //ckeditor글내용
			var ckContentLength = CKEDITOR.instances.content.getData().length; //ckeditor에 쓴 글자수
			
			if($('#theme').val()==""){
				alert("테마를 선택해주세요"); 
				$('#theme').focus();
				return false;

			}
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
		
		//글쓰기폼에서 '취소버튼' 누르면 뒤로가기
		$('#cancelBtn').click(function(){
			window.history.back();
		});
	
	});//jquery

</script>

<style>

	.container{
		width:1200px;
		font-family: 'SCDream3';
	}
	.col-3{
		text-align:center;
		margin-bottom:10px;
	}
	.label{
		background-color:#E98374;
	}
	#homeboardWriteTitle {
		margin: 20px 0 50px 20px;
	}
	.homeboardWriteSub {
		margin-left: 20px;
	}
	.homeboardWriteSub{
		font-size:15px;
	}
	.label-info{
		background-color:#E98374;color:white;
	}
</style>



<div class="container">

	<h3 id="homeboardWriteTitle">집들이 글수정</h3>

	<form id="homeboardForm" method="post" action="/myapp/homeboardEditOk" >
	
	<!-- 테마선택 메뉴 -->
	<div class="row">
		<div class="col-2">
			<h5 class="homeboardWriteSub">테마선택</h5>
		</div>
		
		<div class="col-2">
			<select id="theme" name="theme" class="browser-default custom-select">
					<c:forEach var="vo" items="${themeList }"> 
					<option value="${vo.theme}" <c:if test="${vo.hb_theme_no == oriThemeNo }">selected</c:if>>${vo.theme}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<!-- 테마선택 메뉴 끝 ======================== -->
	
	<hr/>
	
	<!-- 해시태그입력 창 시작====-->
	<div class="row">
		<div class="col-2">
			<h5 class="homeboardWriteSub">태그입력</h5>
		</div>
		
		<div class="col-9"><!-- 태그는 엔터나 쉼표를 입력하면 확인됨 -->
			<!-- 기존글에서 아이디와 글번호 저장  -->
			<input type="hidden" name="b_no" id="b_no" value="${vo.b_no }">
			<input type="hidden" name="userid" value="${vo.userid }" />
			<input  type="text" data-role="tagsinput" value="${vo.hashtag }" id="tags" name="hashtag" placeholder="태그를 입력하세요 :)" style="width:300px"/><br/>
			<span style="color:gray;font-size:11px;">해시태그는 최대 8개까지, 최대 10글자까지 입력 가능합니다.</span>
		</div>
	</div> <!-- row -->

	
	<!-- 본문입력  -->
		<div class="form-group">
			<input id="title" type="text" class="form-control" name="title" value="${vo.title }" placeholder="제목을 입력하세요(최소 5글자 이상 입력해주세요)" />
			<br/>
			<textarea id="content" name="content" class="form-control rounded-0" placeholder="글을 입력하세요(최소 10글자 이상 입력해주세요)">
				${vo.content }
			</textarea>
			<br/>
			<br/> 
				<input type="submit" id="submitBtn" class="btn btn-primary" value="글수정" style="background-color:#E98374;border:1px solid #E98374;text-align:center;"/> 
				<input type="button" id="cancelBtn" class="btn btn-secondary" value="취소" style="text-align:center;"/>
		</div>
	</form>

</div>