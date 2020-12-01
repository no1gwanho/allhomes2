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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
<style>
	#ul,li{list-style-type:none;}
	#logo img{width:200px; display: block; margin: 0px auto;}
	#signup{text-align:center;}
	#button {background-color:#ee8374;border:none;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}
	
	#regFrm{max-width:400px;}
	#emailbox{width:10%;}
	
	#mailbox1{width:40%;}
	#mailbox2{width:60%}
	#splitbtn{background-color:lightgray;}
	
	#widthblank2{margin-left:161px;}
	#widthblank{margin-left:225px;}
	#dupResult{margin-left:37px;color:#ee8374;display:none;}
	#logo{margin-top:100px;}
	#proPhoto{width:45%;}
	
	#dupFilter,#photoBtn{background-color:#ee8374;color:white;}
	
	
</style>
<script>
	$(function(){
		//회원가입폼의 데이터 유효성검사
		$("#regFrm").submit(function(){
			//아이디 검사
			if($("#userid").val()==""){
				alert("아이디는 필수입력사항입니다.");
				return false;
			}
			if($("#userpwd").val()=="" || $("#userpwdChk").val()==""){
				alert("비밀번호는 필수입력사항입니다.");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.")
				return false;
			}
			if($("#username").val()==""){
				alert("이름은 필수입력 사항입니다.");
				return false;
			}
			if($("#emailText").val()==""){
				alert("이메일은 필수 입력사항입니다..")
				
			}
			if(($("#userpwd").val()).equals("#userpwdChk")){
				alert("비밀번호가 일치하지 않습니다.");
				
			}
			
			
			return true;
		});
		
		
	$(function(){
		$("#dupFilter").click(function(){
			var url = "/myapp/dupFilter";
			var data = "userid="+document.getElementById("dupFilter").value			
			
			if($("#dupFilter").val()==""){
				alert("아이디를 입력해주세요.");
				
			}else{
				$.ajax({
					url:url,
					data:data,
					success:function(result){
						$("#widthblank").css("display","none");
						$("#dupResult").css("display","block");
						
					},error:function(){
						console.log("정보받기 에러 발생");
						
					}
				});
			}
		});
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
				
 		
		<div class="form-row align-items-center">
			<label for="userid">*아이디</label> 
				<div id="widthblank"></div>
			<label id=dupResult>사용가능한 아이디 입니다.</label>
				
			<div class="col-auto">
				<div id=dupFilter type="button" class="input-group-text">중복검사</div>
			</div>
		</div>
 		<input type="text" name="userid" id="userid" placeholder="아이디입력" class="form-control"/>				<!-- 아이디 input 영역 -->
 		
 		 		
 		<label for="userpwd">*비밀번호</label>
 		<input type="password" name="userpwd" id="userpwd" class="form-control" placeholder="비밀번호" />			<!-- 비밀번호 input 영역 -->
 		
 		<label for="userpwd">*비밀번호 확인</label>
 		<input type="password"  id="userpwdChk" class="form-control" placeholder="비밀번호 확인" />					<!-- 비밀번호 확인 input 영역 -->
 		
 		<label for="username">*이름</label> 
 		<input type="text" name="username" id="username" placeholder="본명으로 입력해주세요" class="form-control"/>	<!-- 이름 input 영역 -->
				
		<div class="form-row align-items-center">
		<label for="nickname">닉네임</label>
			<div id="widthblank2"></div>
		
		<div id=proPhoto class="col-auto">
			<div id=photoBtn type="button" class="input-group-text">프로필사진 올리기</div>
			</div>
 		<input type="text" name="nickname" id="nickname" placeholder="3~10자이내" class="form-control"/>			<!-- 닉네임 input 영역 -->
		</div>
	
		<label for="username">*연락처</label> 																	<!-- 연락처 input 영역 -->
 		<input type="text" name="tel" id="tel" placeholder="'-생략 입력'" class="form-control"/>
	
		
		<label for="email">*이메일</label>
		<div class="form-row align-items-center">
			<div id=mailbox1 class="col-auto"><!-- 이메일 입력박스 1 -->
				<input type="text" class="form-control mb-2" id="emailText" name="email1" placeholder="이메일 입력">	<!-- 이메일1 input 영역 -->
		
			</div>
			<div id=mailbox2 class="col-auto"><!-- 이메일 입력박스 2 -->
				<div class="input-group mb-2">
					<div class="input-group-prepend">
						<div class="input-group-text">@</div>
			        </div>
			        <input type="text" name="email2" class="form-control" id="inlineFormInputGroup" placeholder="직접입력">	<!-- 이메일2 input 영역 -->
			    	<div id=splitbtn class="btn-group">  	<!-- dropdown 버튼 세팅 -->
				 		<button class="btn dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">naver.com</a>
								<a class="dropdown-item" href="#">nate.com</a>
								<a class="dropdown-item" href="#">gmail.com</a>
							</div>
					</div>
			    </div>
			</div>
		</div>
		
		
		
		<input id="button" class="btn btn-lg btn-primary btn-block" type="submit" value="회원가입" />
 		
 		</form>
 		<div id="signup">
 		<a href="/myapp/login">이미 가입하셨나요?</a><a href="/myapp/">홈으로</a>
 		</div>
 		
	</div>
</div>
</body>
</html>