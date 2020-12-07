<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#qnaTitle{
		margin-top:50px;
	}

</style>




<div class="container">
<div id="qnaTitle">
<h1>${vo.title }</h1>
</div>

<h6>${vo.writedate } 질문자 : ${vo.userid }&nbsp;&nbsp;조회수 : ${vo.hit }회&nbsp;&nbsp;답글 : ${vo.answer }개</h6>

<br/>
	<div style="width:80%;margin-bottom:50px;" >
		${vo.content }
	</div>
	<hr/>
	<h4>답변 3개</h4>
	<div id="newComment">
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x"></i>
		<span style="margin:2px 10px 0 10px"><a href="#">유저아이디</a></span>
		  <input type="text" class="form-control" placeholder="답변을 등록해보세요">
		  <div class="input-group-append">
		    <button class="btn" style="background-color:#E98374" type="submit">답변등록</button>
		  </div>
		</div>
	</div>
	
	<br/>
	<div>
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x" style="width:30px;"></i>
		<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
		<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
		<br/>
		<span style="margin-left:150px">1일전 답글달기 (수정) (삭제) </span><span>신고</span>
		</div>
		
		<!-- 대댓글 예시 -->
		<div class="reply alert alert-secondary" style="margin-left:100px;">
			<i class="fas fa-user-circle fa-2x" style="width:30px;"></i> 
			<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
			<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
			<br/>
			<span style="margin-left:30px">1일전 (수정) (삭제) </span><span>신고</span>
		</div>
		
	</div>
		<div>
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x" style="width:30px;"></i>
		<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
		<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
		<br/>
		<span style="margin-left:150px">1일전 답글달기 (수정) (삭제) </span><span>신고</span>
		</div>
	
</div>
</div>