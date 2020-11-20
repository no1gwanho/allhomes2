<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminRegisterHeader.jspf"%>
<script>
	$(function(){
		$("#regForm").submit(function(){
			if(("#userid").val()==""){
				alert("아이디를 입력해주십시오.");
				return false;
			}
			if(("#empname").val()==""){
				alert("이름을 입력해주십시오.");
				return false;
			}
			if(("#email").val()==""){
				alert("이메일을 입력해주십시오.");
				return false;
			}
			if(("#tel").val()==""){
				alert("연락처를 입력해주십시오.");
				return false;
			}
			if(("#emppwd").val()!=("#emppwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
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
                    	<img src="/myapp/resources/img/admin/03.jpg" style="width:105%"/>
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
                                        <input class="form-control form-control-user btn" placeholder="중복확인"/>
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
                                        <input type="text" class="form-control form-control-user" id="tel"
                                            name="tel" placeholder="tel (-은 제외하고 입력해주세요.)">
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
                                            id="emppwdChk" placeholder="Repeat Password">
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