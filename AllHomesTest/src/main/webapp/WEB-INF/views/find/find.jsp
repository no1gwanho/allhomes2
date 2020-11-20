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
	
	.blank1{margin:20px 0 20px 0;}
	.blank2{margin:5px 0 5px 0;}
	#findid{background-color:#ee8374;border:none;}
	#findpwd{background-color:#ee8374;border:none;}
	
	#btnfindid{background-color:#ee8374;border:none;}
	#btnrepwd{background-color:#ee8374;border:none;}
	
	#idnote{}/*아이디 찾기 이벤트에서 띄우자*/
	#smallcontainer{max-width:350px;}
	
</style>
<script>
	$(function(){		//아이디찾기 버튼
		$("#findid").click(function(){
			$("#useremail").css("display","none");/*제거하는 영역*/
			$("#btnrepwd").css("display","none");
			
			$("#btnfindid").css("display","block");		/*살리는 영역*/
			$("#idnote").css("display","block");
		});
	});

	
	
	$(function(){		//비밀번호찾기 버튼
		$("#findpwd").click(function(){
			$("#idnote").css("display","none");	/*제거하는 영역*/
			$("#btnfindid").css("display","none");
			
			
			$("#useremail").css("display","block");/*살리는 영역*/
			$("#btnrepwd").css("display","block");
		});
	});

	

</script>
</head>
<body>
<div class="container">
	
	<form id="smallcontainer" class="form-signin" method="post" action="/myapp/loginOk">
		<h3 class="form-signin-heading text-center">아이디/비밀번호 찾기</h3>
			<div class="blank1"></div>
		<input type="button" id="findid" name="findid" class="btn btn-primary btn-lg" value="아이디 찾기"/>	
		<input type="button" id="findpwd" name="findpwd" class="btn btn-primary btn-lg" value="비밀번호 찾기"/>	
		<br/><br/>
		
		<input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" required autofocus>
			<div class="blank2"></div>
		<input type="password" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호" required >
		<input type="text" id="useremail" name="useremail" class="form-control" placeholder="이메일" required>
		<div id=idnote>등록하신 아이디는 pa****입니다.</div>
			<div class="blank2"></div>
		<input id="btnfindid" class="btn btn-lg btn-primary btn-block" type="submit" value="아이디 찾기"/><br/>
		<input id="btnrepwd" class="btn btn-lg btn-primary btn-block" type="submit" value="비밀번호 재설정"/><br/>
		<div>등록하신 이메일로 비밀번호 재설정 링크를 보내드렸습니다.</div>
	</form>
	<br/>
		
</div>
</body>
</html>