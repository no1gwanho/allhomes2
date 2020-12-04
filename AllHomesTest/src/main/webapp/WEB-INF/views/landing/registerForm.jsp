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
	#dupResult{color:#ee8374;display:none;}
	#logo{margin-top:230px;}
	#proPhoto{width:45%;}
	
	#dupFilter,#photoBtn{background-color:#ee8374;color:white;}
	#photoBtn{width:65%;}
	
</style>
<script>
	$(function(){
		$("#regFrm").submit(function(){
							
			//아이디 검사
			if($("#userid").val()==""){
				alert("아이디는 필수입력사항입니다.");
				return false;
			}
			if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 해주세요.");
				return false;
			}
			
	
			//비밀번호 검사
			if($("#userpwd").val()=="" || $("#userpwdChk").val()==""){
				alert("비밀번호는 필수입력사항입니다.");
				return false;
			}
			if($("#userpwd").val()!= $("#userpwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			var pwdPattern = /^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}]{6,15}$/;
			var pwdTestResult = pwdPattern.test($("#userpwd").val());
			
			if(pwdTestResult!=true){
				alert("비밀번호는 영문,숫자,특수문자 조합 6~15자로 입력해주세요.");
				return false;
			}
									
			//이름 검사
			if($("#username").val()==""){
				alert("이름은 필수입력 사항입니다.");
				return false;
			}
			var	namePattern = /^[가-힣]{2,6}$/;
			var nameTestResult = namePattern.test($("#username").val());
			
			if(nameTestResult!=true){
				alert("이름은 한글 2~6자 사이로 입력해주세요.");
				return false;
			}
					
			//닉네임 검사
			if($("#nickname").val()==""){
								
			}else{
				var nicknamePattern = /^[A-Za-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,10}$/;
				var nicknameTestResult = nicknamePattern.test($("#nickname").val());				
				if(nicknameTestResult!=true){
					alert("닉네임은 특수문자 제외 3~10자로 입력해주세요.");
					return false;
				}
			}
						
			//연락처 검사
			if($("#tel").val()==""){
				alert("연락처는 필수 입력사항입니다..");
				return false;
			}
			var telPattern = /^[0-9]{11}$/;
			var telTestResult = telPattern.test($("#tel").val());
			
			if(telTestResult!=true){
				alert("연락처는 '-'생략하고 입력해주세요.")
				return false;
			}
						
			//이메일 검사
			if($("#emailText").val()==""){
				alert("이메일은 필수 입력사항입니다..");
				return false;
			}
			var emailPattern = /^[A-Za-z0-9]{4,8}$/;
			var emailTestResult = email.Pattern.test($("#email2").val());
			
			if(emailTestResult!=true){
				alert("이메일 주소는 4~13글자 내로 적어주세요")
				return false;
			}
									
			return true;
		});
		
		
		
		
		
	$(function(){		//프로필 업로드 버튼을 눌렀을때 vo에 입력해주기위한 함수
		$("#photoBtn").click(function(){
			var url = "/myapp/photoBtn";
			
			$.ajax({
				url:url,
				data:data,
				success:function(result){
					alert("프로필사진 vo 저장 성공");	//////////////////////나중에 경고 메시지 삭제////////////////
					
					
				},error:function(){		//////////////////////나중에 경고 메시지 삭제/////////////////////////
					alert("프로필사진 vo 저장 에러발생");
				}
							
			});
		});
	});	
	
	
	
	//각 칸을 클릭햇을때 중복검사 안했으면 안했다고 띄우고 
	//했어도 아이디를 바꾸면 
	
	
	//중복검사 의무화 	
	$(function(){
		$("#userid").blur(function(){
							
			if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 해주세요.");				
				
			}
			
		
			var url="/myapp/mustCheck";
			$.ajax({
				url:url,
				data:"userid="+document.getElementById("userid").value
				,success:function(result){
					if(result==true){
											
					}else{alert("아이디가 변경되어 중복검사를 다시해주세요.");}				
								
				},error:function(){
					console.log("정보받기 에러 발생");
				}
			});
					
		});
		
	});
		
	
	
	
	
	
	
		
		
	
	//중복검사 버튼 클릭 시
	$(function(){
		$("#dupFilter").click(function(){
			var url = "/myapp/dupFilter";
			var data = "userid="+document.getElementById("userid").value;			
			console.log("data=",data);
			//아이디 정규식 설정(영문 숫자조합 최소5~13글자)
			var idPattern =  /^[A-Za-z0-9]{5,13}$/;
			
			//정규식 결과 저장
			var pattResult = idPattern.test($("#userid").val());
					
			if($("#userid").val()==""){
				alert("아이디를 입력해주세요.");
			}else if(pattResult!=true){
				alert("아이디는 영문 숫자 조합 5~13자로 입력해주세요.")
			}else{
				$.ajax({
					url:url,
					data:data,
					success:function(retData){
						if(retData==""){
							$("#dupResult").css("display","block");
							$("#dupResult").css("color","#ee8374");
							
							$("#dupResult").html($("#userid").val()+"는 사용가능한 아이디 입니다.");
																	
						}else{
							$("#dupResult").css("display","block");
							$("#dupResult").css("color","blue");
							$("#dupResult").html($("#userid").val()+"는 사용불가한 아이디 입니다.");
						}
						$("#idStatus").val("Y");
						
					},error:function(error){
						console.log("정보받기 에러 발생", error.reponseText);	
					}
				});
			}
		});
	});	
	
	
	
	//이메일 dropdown버튼 클릭 시 다시 생성??
	$(function(){
		$(".dropdown-item").click(function(){
			
			$("#email2").val($(this).val()); //div 박스에는 html text로 가능 inputbox는 val로 입력 => 이벤트가 발생하는 곳의 값을 넣어라
			$("#splitbtn3").css("display","none");
						
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
			
				
			<div class="col-auto">
				<button id=dupFilter class="input-group-text">중복검사</button>
			</div>
			
		</div>
		<div id=dupResult></div>
		<input type="text" name="userid" id="userid" placeholder="영문,숫자조합 6~13글자" class="form-control"/>							<!-- 아이디 input 영역 -->
 		<input type="hidden" name="idStatus" id="idStatus" value="N"/>
 		 		
 		<label for="userpwd">*비밀번호</label>
 		<input type="password" name="userpwd" id="userpwd" class="form-control" placeholder="영문,숫자,특수문자조합 6~15글자" />			<!-- 비밀번호 input 영역 -->
 		
 		<label for="userpwd">*비밀번호 확인</label>
 		<input type="password" id="userpwdChk" class="form-control" placeholder="비밀번호 확인" />										<!-- 비밀번호 확인 input 영역 -->
 		
 		<label for="username">*이름</label> 
 		<input type="text" name="username" id="username" placeholder="본명으로 입력해주세요" class="form-control"/>						<!-- 이름 input 영역 -->
				
		
		<label for="nickname">닉네임</label>
		<input type="text" name="nickname" id="nickname" placeholder="특수문자 제외 3~10자" class="form-control"/>						<!-- 닉네임 input 영역 -->
	
	
		<label for="photoBtn">프로필 사진</label>
		<input id=photoBtn type="file" name="photoBtn" class="form-control"></input>												<!-- 프로필사진 업로드 -->
			
		
		<label for="username">*연락처</label> 																						<!-- 연락처 input 영역 -->
 		<input type="text" name="tel" id="tel" placeholder="'-생략 입력'" class="form-control"/>
	
		
		<label for="email">*이메일</label>
		<div class="form-row align-items-center">
			<div id=mailbox1 class="col-auto"><!-- 이메일 입력박스 1 -->
				<input type="text" class="form-control mb-2" id="emailText" name="email1" placeholder="이메일 입력"/>					<!-- 이메일1 input 영역 -->
		
			</div>
			<div id=mailbox2 class="col-auto"><!-- 이메일 입력박스 2 -->
				<div class="input-group mb-2">
					<div class="input-group-prepend">
						<div class="input-group-text">@</div>
			        </div>
			        <input id="email2" type="text" name="email2" class="form-control"  placeholder="직접입력"/>			<!-- 이메일2 input 영역 -->
			    	
			    	
			    	<div id=splitbtn class="btn-group">  	<!-- dropdown 버튼 세팅 -->
				 		<button id=splibtn2 class="btn dropdown-toggle" data-toggle="dropdown"></button>
							<div id="splitbtn3" class="dropdown-menu">
								<input type="button" id="naver.com" class="dropdown-item" value="naver.com"/>
								<input type="button" id="nate.com" class="dropdown-item" value="nate.com"/>
								<input type="button" id="gmail.com" class="dropdown-item" value="gmail.com"/>
							</div>
					</div>
			    </div>
			</div>
		</div>
		
		<input id="button" class="btn btn-lg btn-primary btn-block" type="submit" value="회원가입" />
 		
 		</form>
 		<div id="signup">
 		<a href="/myapp/login">이미 가입하셨나요?</a><a href="/myapp/"> 홈으로</a>
 		</div>
 		
	</div>
</div>
</body>
</html>