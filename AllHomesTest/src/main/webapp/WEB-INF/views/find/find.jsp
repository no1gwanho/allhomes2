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
	
   @font-face{
	   font-family:"SCDream3";
	   src:url("/myapp/resources/css/font/SCDream3.otf") format("truetype");
	   font-style:normal;
	   font-weight:normal;
	}
   @font-face{
	   font-family:"SCDream5";
	   src:url("/myapp/resources/css/font/SCDream5.otf") format("truetype");
	   font-style:normal;
	   font-weight:normal;
	}
	
	
	
	#idpw{text-align:center;}
	#logo img{width:200px; display: block; margin: 0px auto;}
	#button {background-color:#ee8374;border:none;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}
	
	.blank1{margin:20px 0 20px 0;}
	.blank2{margin:5px 0 5px 0;}
	
	
	#findid{background-color:#ee8374;border:none;}	
	#findpwd{background-color:lightgray;border:none;}
	
	
	#btnfindid{background-color:#ee8374;border:none;}
	#btnrepwd{background-color:#ee8374;border:none;}
	
	
	#smallcontainer{max-width:350px;}
	#userid,#userpwd,#idnote,#emailnote,#btnrepwd{display:none;}/*기본접속화면 숨김 세팅 이메일박스, 등록아이디 안내창, 이메일전송 안내창, 비밀번호 재설정버튼*/
	
	
	.btn-lg,.form-control,.btn-block,.movetext{font-family:'SCDream3';}
	.form-signin-heading{font-family:'SCDream5';font-size:30px;}
	
	#moveMenu{text-align:center;color:#ee8374}
	.movetext{color:#ee8374;margin-left:10px;}
	a:hover{text-decoration:none;}
	
	#blankWidth{margin-right:0 10px 0 10px;float:left;}
	
</style>
<script>
	$(function(){		//아이디찾기 버튼
		$("#findid").click(function(){
			$("#userid").css("display","none");/*제거하는 영역*/
			$("#btnrepwd").css("display","none");
			$("#findpwd").css("background-color","lightgray");
			
			
			$("#btnfindid").css("display","block");		/*살리는 영역*/
			$("#username").css("display","block");
			$("#email").css("display","block");
			$("#findid").css("background-color","#ee8374");
		});
	});

	
	
	$(function(){		//비밀번호찾기 버튼
		$("#findpwd").click(function(){
			$("#idnote").css("display","none");	/*제거하는 영역*/
			$("#btnfindid").css("display","none");
			$("#findid").css("background-color","lightgray");
			
			
			$("#useremail").css("display","block");/*살리는 영역*/
			$("#btnrepwd").css("display","block");
			$("#userid").css("display","block");
			$("#findpwd").css("background-color","#ee8374");
		});
	});

	$(function(){
		$("#btnrepwd").click(function(){
			var url = "/myapp/btnrepwd";
			var data = "username="+document.getElementById("username").value+"&userid="+document.getElementById("userid").value+"&email="+document.getElementById("email").value
			
			if($("#username").val()==""){
				alert("이름을 입력하세요.");
				
			}else if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
			}
			else if($("#email").val()==""){
				alert("이메일을 입력하세요.");
			}else{
				$.ajax({
					url:url,
					data:data,
					type:'GET',
					success:function(result){
						$("#emailnote").css("display","block");
						$("#emailnote").html(result);
						$("#mailsender").attr("href",result);
					},error:function(){
						console.log("ajax 정보 받기 에러발생")
					}
				});
			}
		});
	});
		
	
	$(function(){	//아이디 찾기 버튼 눌렀을때
		$("#btnfindid").click(function(){
			var url = "/myapp/btnfindid";
			var data = "username="+document.getElementById("username").value+"&email="+document.getElementById("email").value;
			
			if($("#username").val()==""){
				alert("이름을 입력하세요.");
				
			}else if($("#email").val()==""){
				alert("이메일을 입력하세요.");
				
			}else{
				$.ajax({
					url:url,
					data:data,
					type:'GET',
					success:function(result){
						$("#idnote").css("display","block");
						$("#idnote").html(result);
											
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
	<img src="<%=request.getContextPath() %>/resources/img/new-homes-logo.png" alt=""/>
	</div>
	<form id="smallcontainer" class="form-signin" method="post" action="/myapp/findOk">
		<div class="form-signin-heading text-center">아이디/비밀번호 찾기</div>
			<div class="blank1"></div>
		<input type="button" id="findid" name="findid" class="btn btn-primary btn-lg" value="아이디 찾기"/>	
		<input type="button" id="findpwd" name="findpwd" class="btn btn-primary btn-lg" value="비밀번호 찾기"/>	
			<br/><br/>
		<input type="text" id="username" name="username" class="form-control" placeholder="이름" required>
			<div class="blank2"></div>
		<input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" required autofocus>
			<div class="blank2"></div>
		<input type="text" id="email" name="email" class="form-control" placeholder="이메일" required>
		<div id=idnote></div>
			<div class="blank2"></div>
		<input type="button" id="btnfindid" class="btn btn-lg btn-primary btn-block" value="아이디 찾기"/><br/>
		<input type="button" id="btnrepwd" class="btn btn-lg btn-primary btn-block" value="비밀번호 재설정"/><br/>
			<div id=emailnote></div>
			<div id="resultData"></div>
		<div id="moveMenu">
			<a class="movetext" href="/myapp/">홈으로</a>
				
			<a class="movetext" href="/myapp/login">로그인</a>
		</div>
	</form>
	
	
		
</div>
</body>
</html>