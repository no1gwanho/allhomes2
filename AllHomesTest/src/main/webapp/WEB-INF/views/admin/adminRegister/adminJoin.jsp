<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminRegisterHeader.jspf"%>

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
                            <form class="user" method="post" action="">
                                <div class="form-group row">
                                    <div class="col-sm-8 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="userid" name="userid"
                                            placeholder="ID">      
                                    </div>
                                    <div class="col-sm-4">
                                        <input class="form-control form-control-user" style="background-color:#aaaaa"
                                            id="exampleRepeatPassword" placeholder="중복확인"/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id=""
                                        placeholder="Name">
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address">
                                </div>
                                
                                <!-- tel -->
                                <div class="form-group row">
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="" placeholder="tel1">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="password" class="form-control form-control-user"
                                            id="" placeholder="tel2">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="password" class="form-control form-control-user"
                                            id="" placeholder="tel3">
                                    </div>
                                </div><!-- tel 끝-->
                                
                                <!-- password -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <a href="login.html" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </a>
                                
                                
                            </form>
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