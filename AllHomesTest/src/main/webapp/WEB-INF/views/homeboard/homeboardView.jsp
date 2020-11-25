<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.card-inner{
    margin-left: 4rem;
	}
	
	.input-group{
		width:90%;
	}
	
	.homeboardImages{
		max-width:900px;
	}
	
	.homeboardImages>img{
		width:90%
	}
		
</style>


<div class="container">




<nav aria-label="breadcrumb" style="background-color:none;">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/homeboard/homeboardMain">집들이</a></li>
    <li class="breadcrumb-item active" aria-current="page">집들이 글보기</li>
  </ol>
</nav>

<div class="row">
<div class="col-9" style="border-right:0.3px solid lightgray">

<h3>비오는 날의 침실</h3>
<h6>2020-10-12 13:14 질문자:아이디 조회수:3회 스크랩:10회 </h6>

<br/>
	<div style="width:80%;" >
		<div class="homeboardImages">
		<img class="homeboardImages" src="<%=request.getContextPath() %>/resources/img/banner/banner2.png"/><br/>
		</div>
		<p>
		이동통신 3사와 정부가 주파수 재할당 대가 공개 설명회에서 한 치의 견해차도 좁히지 못한 가운데, 적정한 산정방식이 적용되지 않을 경우 이통사 투자가 위축되고 역효과로 소비자 통신비 부담만 증가하게 될 것이라는 지적이 제기됐다.
		
		정부는 이통 3사가 5세대 이동통신(5G)에 적극 투자하는 조건으로 주파수 재할당 대가를 낮춰주겠다는 조건을 내걸었다.
		
		반면 이통사는 롱텀에볼루션(LTE) 주파수 재할당에 5G 투자를 연계하는 것은 ‘위법’ 소지가 있으며, 정부가 현실적인 5G 투자 계획과 동떨어진 과도한 수준을 요구하고 있다며 거세게 반발했다.
		</p>
		<div id="hashtag">
		<a href="#" class="badge badge-light">#해시태그</a>
		<a href="#" class="badge badge-light">#해시태그</a>
		<a href="#" class="badge badge-light">#해시태그</a>
		<a href="#" class="badge badge-light">#해시태그</a>
		</div>
	</div>
	
	<hr/>
	<div style="margin:20px;">
	<span style="font-size:16px;color:gray;">댓글 3개</span>&nbsp;&nbsp;<span style="font-size:16px;color:gray;">스크랩 1</span>
	<hr/>
	</div>
	<div id="newComment">
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x"></i>
		<span style="margin:2px 10px 0 10px"><a href="#">유저아이디</a></span>
		  <input type="text" class="form-control" placeholder="댓글을 등록해보세요">
		  <div class="input-group-append">
		    <button class="btn" style="background-color:#E98374" type="submit">등록</button>
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
		<span style="margin-left:150px">1시간전</span>&nbsp;&nbsp;<a href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>&nbsp;&nbsp;<a href="#" style="color:gray;font-size:7px;">신고</a>
		</div>
		
		<!-- 대댓글 예시 -->
		<div class="reply alert alert-secondary" style="margin-left:100px;">
			<i class="fas fa-user-circle fa-2x" style="width:30px;"></i> 
			<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
			<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
			<br/>
			<span style="margin-left:30px">1시간전</span>&nbsp;&nbsp;<a href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>&nbsp;&nbsp;<a href="#" style="color:gray;font-size:7px;">신고</a>
		</div>
		
	</div>
		<div>
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x" style="width:30px;"></i>
		<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
		<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
		<br/>
		<span style="margin-left:150px">1시간전</span>&nbsp;&nbsp;<a href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>&nbsp;&nbsp;<a href="#" style="color:gray;font-size:7px;">신고</a>
		</div>
		
		
		
	</div>
		<div>
		<div class="input-group mb-3">
		<i class="fas fa-user-circle fa-2x" style="width:30px;"></i>
		<span style="margin:2px 10px 0 10px;width:100px;"><a href="#">유저아이디</a></span>
		<span style="width:80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span>
		<br/>
		<span style="margin-left:150px">1시간전</span>&nbsp;&nbsp;<a href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>&nbsp;&nbsp;<a href="#" style="color:gray;font-size:7px;">신고</a>
		</div>
		
	</div>
	
	
	</div> <!-- col-9 -->
	
    	
			


	
	
	
	

	<div class="col-3">
	<i class="fas fa-user-circle fa-3x"></i>&nbsp; <a href="#">유저아이디</a> &nbsp;&nbsp;
	<br/><br/>
	<button class="btn btn-lg" style="background-color:#E98374">팔로우</button>&nbsp;<button class="btn btn-secondary btn-lg"><i class="fas fa-file"></i>스크랩하기</button><br/>
	카카오 | 페이스북 | 이메일로 보내기 버튼
	<br/><br/>
	
	
	</div> <!-- col-3 -->
		
	
	
	
	
	
</div> <!-- row -->

	
	
	
</div>