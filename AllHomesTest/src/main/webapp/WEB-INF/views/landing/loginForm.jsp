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
	
</style>
</head>
<body>
<div class="container">
	<div id="logo">
	<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png" alt=""/>
	</div>
	<form class="form-signin" method="post" action="/myapp/loginOk">
		<h2 class="form-signin-heading">로그인하세요</h2>
		<input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" required autofocus>
		<input type="password" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호" required>
		<input id="button" class="btn btn-lg btn-primary btn-block" type="submit" value="로그인"/><br/>
	</form>
	<div id="idpw">
		<a href="/myapp/">홈으로</a>
		<a href="/myapp/find">아이디/비밀번호찾기</a> &nbsp;&nbsp;
		<a href="/myapp/register">  회원가입</a>
	</div>
	<br/>
	<div id="snslogtitle">sns계정으로 로그인</div>
	<br/>
	<div class="login_logo">
		<a href="#"><img src="<%=request.getContextPath()%>/resources/img/login/Logo_google.jfif"></a>
		<a href="#"><img src="<%=request.getContextPath()%>/resources/img/login/Logo_naver.jfif" ></a>
		<a href="#"><img src="<%=request.getContextPath()%>/resources/img/login/Logo_cacao.jfif" ></a>
	</div>
	<hr/>
	
</div>
</body>
</html>