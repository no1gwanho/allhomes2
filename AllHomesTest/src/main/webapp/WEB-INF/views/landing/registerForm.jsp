<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signin.css" type="">
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
<style>
	#ul,li{list-style-type:none;}
	#logo img{width:200px; display: block; margin: 0px auto;}
	#signup{text-align:center;}
	#button {background-color:#ee8374;border:none;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}

</style>
<script>
	$(function(){
		//회원가입폼의 데이터 유효성검사
		$("#regFrm").submit(function(){
			//아이디 검사
			if($("#userid").val()==""){
				alert("아이디를 입력해주세요");
				return false;
			}
			/*if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 해주세요..");
				return false;
			}*/
			if($("#userpwd").val()=="" || $("#userpwdChk").val()==""){
				alert("비밀번호를 입력하세요..");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.")
				return false;
			}
			if($("#username").val()==""){
				alert("이름을 입력하세요..");
				return false;
			}
			
			
			return true;
		});
		
		
	});

</script>


</head>
<body>
<div class="container">
	
	<div id="content">
	<div id="logo">
	<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png" alt=""/>
	</div>
	<form class="form-signin" method="post" id="regFrm" action="/myapp/registerOk">
	<h2 class="form-signin-heading">회원가입</h2>
		
 	
 		<label for="userid">아이디</label>
 		<input type="text" name="userid" id="userid" placeholder="아이디입력" class="form-control"/>
 		
 		<label for="userpwd"> 비밀번호</label>
 		<input type="password" name="userpwd" id="userpwd" class="form-control" placeholder="비밀번호" />
 		
 		<label for="userpwd">비밀번호 확인</label>
 		<input type="password" name="userpwdChk" id="userpwdChk" class="form-control" placeholder="비밀번호 확인" />
 		
 		<label for="username">이름</label> 
 		<input type="text" name="username" id="username" placeholder="본명으로 입력해주세요" class="form-control"/>
		
		<label for="nickname">닉네임</label> 
 		<input type="text" name="nickname" id="nickname" placeholder="3~10자이내" class="form-control"/>
		
		<label for="email">이메일</label>
 		<input type="text" name="email" value="이메일" class="form-control"/>
			
		<br/>
			<div class="btn-group">  	<!-- dropdown 버튼 세팅 -->
	 			 <input type="text" name="email2" placeholder="직접입력" class="form-control"/>
	 			 <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
	   			
	   			</button>
			  	
			  	<div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <a class="dropdown-item" href="#">Another action</a>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				   
		 		</div>
			</div>
		<br/>
		
		
		
		
		<br/>
		
		<input id="button" class="btn btn-lg btn-primary btn-block" type="submit" value="회원가입" />
 		
 		</form>
 		<div id="signup">
 		<a href="/myapp/login">이미 가입하셨나요?</a><a href="/myapp/">홈으로</a>
 		</div>
 		
	</div>
</div>
</body>
</html>