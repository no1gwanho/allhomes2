<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminRegisterHeader.jspf"%>
<style>
	.profile img{
		width:60px;
		border-radius:70%;
		border:0.2px solid gray;
	}
</style>
<script>
	$(function(){
		
		var idChk = 0; //ID 중복검사

		//var emailChk = 0; //email 중복검사
		
		//아이디 중복체크
		$("#idChk").click(function(){
			
			if($("#userid").val()==""){
				alert("ID를 입력하세요.");
				return false;
			}
			
			var data = $("#userid").val();
			var url = "<%=request.getContextPath()%>/idCheck?userid="+data;
			
			$.ajax({
				url: url,
				data: data,
				success: function(result){
					if(result==0){//사용가능
						idChk = 1;
						alert("사용 가능한 ID입니다.");
												
					}else{
						alert("이미 사용중인 ID입니다.");
					}
				},error: function(){
					console.log("ID중복체크 에러");
				}
			});
			return false;
		});
		
		
		//회원가입 submit
		$("#regForm").submit(function(){			
			
			// 입력사항 체크
			if($("#userid").val()==""){
				alert("ID를 입력하세요.");
				return false;
			}else if($("#emppwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if($("#emppwdChk").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if($("#email").val()==""){
				alert("이메일을 입력하세요.");
				return false;
			}else if($("#tel").val()==""){
				alert("연락처를 입력하세요.");
				return false;
			}else if($("#emppwd").val()!=$("#emppwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}else if($("#username").val()==""){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(idChk==0){
				alert("아이디 중복검사를 시행하세요.");
				return false;
			}
			
			var url = "/myapp/adminRegisterOk"
			var data = $("#regForm").serialize();
			
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(result){
					if(result > 0){
						alert("회원 가입이 완료됐습니다.");
						location.href="/myapp/adminLogin";
					} else{
						alert("회원가입에 실패하였습니다.");
					}
				},error: function(){
					console.log("회원 가입 오류");
				}
			});
			return false;
		});
	});
	


</script>

<body class="bg-gradient-secondary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block">
                    	<img src="<%=request.getContextPath()%>/resources/img/admin/03.jpg" style="width:105%"/>
                    </div>
                    <div class="col-lg-7  my-auto">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Admin Account!</h1>
                            </div>
                            
                            <!-- 회원가입 폼 -->
                            <form class="user" id="regForm" method="post" action="/myapp/adminRegisterOk">
                                <div class="form-group row">
                                    <div class="col-sm-8 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="userid" name="userid"
                                            placeholder="ID">      
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="button" class="btn alert-secondary btn-user btn-block" id="idChk" value="중복검사"/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text"   class="form-control form-control-user" id="empname" name="empname"
                                        placeholder="Name">
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="email" name="email" 
                                    placeholder="Email Address">
                                </div>
                                
                                <!-- tel -->
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="tel" name="tel"
                                         placeholder="tel">
                                    </div>
                                </div>
                                
                                
                                <!-- password -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="emppwd" name="emppwd" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                           name="emppwdChk" id="emppwdChk" placeholder="Repeat Password">
                                    </div>
                                </div>
                                
                                <div class="col-lg-12 mt-3 mb-3" style="background-color:#eeeeee">
                                	프로필 선택
                                </div>
                                
                                <div class="form-group row mr-3 ml-3">
                                	
                                	<div class="profile ml-3 mr-4" style="text-align:center;">
                                		<input type="radio" name="profile" value="profile1.png"/>
                                		<img src="<%=request.getContextPath()%>/resources/img/admin/profile1.png"/>
                                	</div>
                                	
                                	<div class="profile mr-4" style="text-align:center;">
                                		<input type="radio" name="profile" value="profile2.png"/>
                                		<img src="<%=request.getContextPath()%>/resources/img/admin/profile2.png"/>
                                	</div>
                                	
                                	<div class="profile mr-4" style="text-align:center;">
                                		<input type="radio" name="profile" value="profile3.png"/>
                                		<img src="<%=request.getContextPath()%>/resources/img/admin/profile3.png"/>
                                	</div>
                                	
                                	<div class="profile mr-4" style="text-align:center;">
                                		<input type="radio" name="profile" value="profile4.png"/>
                                		<img src="<%=request.getContextPath()%>/resources/img/admin/profile4.png"/>
                                	</div>
                                	
                                	<div class="profile" style="text-align:center;">
                                		<input type="radio" name="profile" value="profile5.png"/>
                                		<img src="<%=request.getContextPath()%>/resources/img/admin/profile5.png"/>
                                	</div>
                                </div>
                                
                                
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Register Account"/>
                                
                                
                            </form><!-- form 끝 -->
                            <hr>
                            
                            <div class="text-center">
                                <a class="small" href="/myapp/adminForgotPassword">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="/myapp/adminLogin">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

<%@ include file="/WEB-INF/adminInc/adminRegisterFooter.jspf"%>