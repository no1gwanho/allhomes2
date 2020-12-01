<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${usernameCon == null || useridCon == null || emailCon == null}">
	<script>
		alert("아이디 비밀번호 찾기 페이지에서 회원정보 입력 바랍니다.");
		location.href="/myapp/find"
	</script>
</c:if>

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
	#changebutton {background-color:#ee8374;border:none;}
	#changebutton:hover{background-color:#ee8374;border: 1px solid gray;}
	
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
	
	/*초기화면 기본 설정*/
	#subnotice{display:none;}
	
	
</style>
<script>
$(function(){
	$("#changebutton").click(function(){
		//정규식 설정
		var pwdPattern = /^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}]{6,15}$/;
		
		//정규식 결과 저장
		var testResult = pwdPattern.test($("#newPwd").val());
		
		var url = "/myapp/changebutton";
		var data = "userpwd="+document.getElementById("newPwd").value+"&userpwdChk="+document.getElementById("newPwdChk").value;
		
				
		if($("#newPwd").val()==""){
			alert("새로운 비밀번호를 입력하세요.");
						
		}else if($("#newPwdChk").val()==""){
			alert("비밀번호를 확인해 주세요.");
		
		}else if(testResult!=true){
			//신규비밀번호 정규식
			alert("비밀번호 규격에 맞지않습니다.")
				
		}else{
			
			$.ajax({
				url:url,
				data:data,
				type:'GET',
				success:function(result){
					$("#newnote").css("display","none");
					$("#subnotice").css("display","block");
				
					$("#subnotice").html(result);
					
					alert("비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.")
					
					location.href='/myapp/login'
				},error:function(){
					console.log("정보 받기 에러 발생");
				}
			});
		}
	});
});
</script>
</head>
<body>
<div class="container">
	
	<div id="logo">
	<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png" alt=""/>
	</div>
	<form id="pwdbox"class="form-signin" method="post" action="/myapp/loginOk">
		<h2 id="mainnotice" class="form-signin-heading text-center">새로운 비밀번호 설정</h2><br/>
		
		<h7 class="subbox">새 비밀번호</h7>
			<input id="newPwd" name="userpwd" type="password"  class="form-control" placeholder="새 비밀번호 입력" required autofocus>
				<div id=newnote>알파벳 대소문자, 숫자, 특수문자 포함(6~15글자)</div>
					<div class="blank1"></div>
		<h7 class="subbox">비밀번호 확인</h7>
			<input id="newPwdChk" name="userpwdChk" type="password" class="form-control" placeholder="비밀번호 재입력" required>
			<div id="subnotice"></div>
					<div class="blank2"></div>
		<input id="changebutton" class="btn btn-lg btn-primary btn-block" type="button" value="비밀번호 설정"/><br/>
	</form>
	<br/>

</div>
</body>
</html>