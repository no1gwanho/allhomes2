<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/69f9d4fad2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/allhomes_header2.css" type="">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<style>
	.container{
		font-family:'SCDream3';
		margin:15px auto;
		padding:0;
		width:1400px;
	}
</style>
</head>
<body>
<div class="container">
	<form method="post" action="/myapp/reviewWriteOk" >
		<h1>리뷰쓰기</h1>
		<div class="row">
			<div class="col-4" style="border-top:1px solid #1f1f1f;border-bottom:1px solid #1f1f1f;padding:15px;">
				<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${rvo.s_no}/${rvo.main_img}" style="width:240px;height: 127px;border-radius:5%;padding:15px;"/>
			</div>
			<div class="col-8" style="border-top:1px solid #1f1f1f;border-bottom:1px solid #1f1f1f;padding:15px;">
				<span style="font-size:1.8em;">${rvo.pd_name }&nbsp;&nbsp;<c:if test="${rvo.o_value != null }">${rvo.o_value }&nbsp;&nbsp;</c:if>${rvo.num }</span>
			</div>
		</div>
	</form>
</div>
		
		
		
		
		
		
		
		<div class="form-group">
			상품명 : <input type="text" class="form-control" name="pc_date" value="${rvo.pd_name }"/><br/>
			구매일 : <input type="text" class="form-control" name="pc_date" value="${rvo.pc_date }"/><br/>
			<c:if test="${rvo.o_value != null }">
			옵션 : <input type="text" class="form-control" name="o_value" value="${rvo.o_value }"/><br/>
			</c:if>
		</div>
		<div class="form-group">
			별점 : <input type="radio" name="rating" value="5"> <span style="margin-right:11px;">5점</span>
				<input type="radio" name="rating" value="4"> <span style="margin-right:11px;">4점</span>
				<input type="radio" name="rating" value="3"> <span style="margin-right:11px;">3점</span>
				<input type="radio" name="rating" value="2"> <span style="margin-right:11px;">2점</span>
				<input type="radio" name="rating" value="1"> <span style="margin-right:11px;">1점</span><br/>
			<textarea id="content" name="content" class="form-control rounded-0" placeholder="글을 입력하세요(최소 10글자 이상 입력해주세요)">
			</textarea>
				<br/>
				<br/> 
			<input type="submit" id="submitBtn" class="btn btn-primary" value="등록" style="background-color:#E98374;border:1px solid #E98374;text-align:center;"/> 
			<input type="button" id="cancelBtn" class="btn btn-secondary" value="취소" style="text-align:center;"/>
		</div>
	</form>
</div>
<%-- <h1>리뷰 쓰기</h1>
<div class="container">
	<form method="post" action="/myapp/reviewWriteOk?pd_no=${pc.pd_no }" enctype="multipart/form-data">
		<div class="row">
			<div class="col-3">상품명</div>
			<div class="col-9">${r.pd_name }</div>							
			<div class="col-3">구매일</div>
			<div class="col-9">${r.pc_date }</div>			
			<c:if test="${r.o_value !=null }">
				<div class="col-3">옵션</div>
				<div class="col-9">${r.o_value }</div>			
			</c:if>				
			<div class="col-3">별점</div>
			<div class="col-9">
				<input type="radio" name="rating" value="5"> <span style="margin-right:11px;">5점</span>
				<input type="radio" name="rating" value="4"> <span style="margin-right:11px;">4점</span>
				<input type="radio" name="rating" value="3"> <span style="margin-right:11px;">3점</span>
				<input type="radio" name="rating" value="2"> <span style="margin-right:11px;">2점</span>
				<input type="radio" name="rating" value="1"> <span style="margin-right:11px;">1점</span>
	   		</div>											
		</div>
		<br/>
		<div style="margin-bottom:20px;">
			<h6>사진첨부(최대 1장)</h6>
			<input type="file" name="img">
		</div>
		<br/>
		<textarea name="content" placeholder="내용을 입력하세요." style="width:450px;height:150px;"></textarea>
		<div>
			<input type="submit" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;" value="등록"/>
		    <input type="reset" class="btn btn-secondary" value="다시쓰기"/>	 	
		</div>
	</form>
</div>--%>
</body>
</html>