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
	#mainImg {
		width:250px;
		height:140px;
		border-radius:5%;
	}
	.pd_info{
		padding:15px;
		text-align:left;
		line-height:35px;
		font-size:1.2em;
	}
	.rating{
		margin-top:35px;
		margin-bottom:15px;
		line-height:55px;
		font-size:1.5em;
	}
</style>
</head>
<body>
<div class="container">
	<form method="post" action="/myapp/reviewWriteOk?pc_no=${rvo.pc_no }&pd_no=${rvo.pd_no}&s_no=${rvo.s_no}"  enctype="multipart/form-data">
		<input type="hidden" name="pd_no" value="${rvo.pd_no }">
		<h1>리뷰쓰기</h1>
		<div class="row">
			<div class="col-12"><hr/></div>
			<div class="col-3 pd_info">
				<img id="mainImg" src="<%=request.getContextPath()%>/resources/upload/productMainImg/${rvo.s_no}/${rvo.main_img}"/>
			</div>
			<div class="col-8 pd_info">
				상품명 : ${rvo.pd_name }<br/>
				<c:if test="${rvo.o_value == null }">옵션 : 없음<br/></c:if>
				<c:if test="${rvo.o_value != null }">옵션 : ${rvo.o_value }<br/></c:if>
				수량 : ${rvo.num }<br/>
				구매일 : ${rvo.pc_date }
			</div>
			<div class="col-12"><hr/></div>
		</div>
		<div class="row">
			<div class="col-3 rating">
				별점평가
			</div>
			<div class="col-8 rating">
				<input type="radio" name="rating" value="5"> <span style="margin-right:11px;">5점</span>
				<input type="radio" name="rating" value="4"> <span style="margin-right:11px;">4점</span>
				<input type="radio" name="rating" value="3"> <span style="margin-right:11px;">3점</span>
				<input type="radio" name="rating" value="2"> <span style="margin-right:11px;">2점</span>
				<input type="radio" name="rating" value="1"> <span style="margin-right:11px;">1점</span><br/>
			</div>
			<div class="col-12"><hr/></div>
			<div class="col-3" id="content">
				내용
			</div>
			<div class="col-9" style="margin-bottom:15px;">
				<textarea name="content" style="width:760px;height:350px;"></textarea>
			</div>
			<br/><br/>
			<div class="col-3 img">
				이미지 첨부
			</div>
			<div class="col-9 img">
				<input type="file" name="img">
			</div>
			<div class="col-12">
				<hr/>
			</div>
		</div>
		<div class="row" style="margin-top:20px;">
			<div class="col-6" style="text-align:right;">
				<input type="submit" class="btn btn" style="background-color:#ee8374;color:#fff;" value="등록">
			</div>
			<div class="col-6" style="text-align:left">
				<a href="/myapp/mypageShopping"><input type="button" class="btn btn-secondary" value="취소"></a>
			</div>
		</div>
	</form>
</div>
</body>
</html>