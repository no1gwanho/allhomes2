<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.container{
		font-family:'SCDream3';
		margin:15px auto;
		padding:0;
		width:1400px;
	}
	.rating{
		margin-top:35px;
		margin-bottom:15px;
		line-height:55px;
		font-size:1.5em;
	}
</style>

<div class="container">
	<form method="post" action="/myapp/reviewEditOk?pd_no=${vo.pd_no }&r_no=${vo.r_no}"  enctype="multipart/form-data">
		<input type="hidden" name="pd_no" value="${vo.pd_no }">
		<h1>리뷰 수정하기</h1>
		<div class="row">
			<div class="col-12"><hr/></div>
			<div class="col-3"><span style="font-size:1.5em;">상품명</span></div>
			<div class="col-9"><span style="font-size:1.5em;font-weight:bold;">${pd_name }</span></div>
			<div class="col-12"><hr/></div>
		</div>
		<div class="row">
			<div class="col-3 rating">
				별점평가
			</div>
			<div class="col-9 rating">
				<input type="radio" name="rating" value="5" <c:if test="${vo.rating==5 }">selected</c:if>><span style="margin-right:11px;">5점</span>
				<input type="radio" name="rating" value="4" <c:if test="${vo.rating==4 }">selected</c:if>><span style="margin-right:11px;">4점</span>
				<input type="radio" name="rating" value="3" <c:if test="${vo.rating==3 }">selected</c:if>><span style="margin-right:11px;">3점</span>
				<input type="radio" name="rating" value="2" <c:if test="${vo.rating==2 }">selected</c:if>><span style="margin-right:11px;">2점</span>
				<input type="radio" name="rating" value="1" <c:if test="${vo.rating==1 }">selected</c:if>><span style="margin-right:11px;">1점</span><br/>
			</div>
			<div class="col-12"><hr/></div>
			<div class="col-3" id="content">
				내용
			</div>
			<div class="col-9" style="margin-bottom:15px;">
				<textarea name="content" style="width:760px;height:350px;">${vo.content }</textarea>
			</div>
			<br/><br/>
			<div class="col-3 img">
				이미지 첨부
			</div>
			<div class="col-9 img">
				<input type="file" name="img" value="${vo.img }">
			</div>
			<div class="col-12">
				<hr/>
			</div>
		</div>
		<div class="row" style="margin-top:20px;">
			<div class="col-6" style="text-align:right;">
				<input type="submit" class="btn btn" style="background-color:#ee8374;color:#fff;" value="수정">
			</div>
			<div class="col-6" style="text-align:left">
				<input type="reset" class="btn btn-secondary" value="다시쓰기">
			</div>
		</div>
	</form>
</div>

