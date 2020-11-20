<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signin.css" type="">
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
<style>
	#idpw{text-align:center;}
	#logo img{width:200px; display: block; margin: 0px auto;}
	#button {background-color:#ee8374;border:none;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}
	
	#snslogtitle{text-align:center;}
	.login_logo{text-align:center;}
	.login_logo img{width:50px;height:50px;}
	
	.blank1{margin:10px 0 10px 0;}
	.blank2{margin:0 0 30px 0;}
	
	#pwdbox{max-width:400px;}
	.subbox{font-weight:bold;}
	#alertbox{margin:0 80px 0 80px;}
	#mainnotice{font-weight:bold;}
	#subnotice{color:#ee8374;}
	
</style>
</head>
<body>
<div class="container">
	<div id="alertbox"class="alert alert-dark" role="alert">
  		<p>
  		안녕하세요?<br/><br/>
  		pakpakgwanho님, 안녕하세요.<br/>
  		아래 링크를 누르시면 새로운 비밀번호로 변경이 가능합니다.<br/>
  		<a href="#"><u>Go to the link</u></a><br/><br/>
  		혹시 비밀번호 변경 신청을 하지 않으셨다면<br/>
  		info@allhomes.co.kr로 메일 부탁드립니다!
  		</p>
  	</div>
	
	<form id="pwdbox"class="form-signin" method="post" action="/myapp/loginOk">
		<h2 id="mainnotice" class="form-signin-heading text-center">새로운 비밀번호 설정</h2><br/>
		
		<h7 class="subbox">새 비밀번호</h7>
			<input type="text" id="userid" name="userid" class="form-control" placeholder="새 비밀번호 입력" required autofocus>
			<div>알파벳 대소문자, 특수문자 포함(최소 6글자)</div>
				<div class="blank1"></div>
		<h7 class="subbox">비밀번호 확인</h7>
		<input id="pwdchk" type="password" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호 재입력" required>
		<div id="subnotice">비밀번호가 일치하지 않습니다.</div>
				<div class="blank2"></div>
		<input id="button" class="btn btn-lg btn-primary btn-block" type="submit" value="비밀번호 설정"/><br/>
	</form>
	<br/>

</div>
</body>
</html>