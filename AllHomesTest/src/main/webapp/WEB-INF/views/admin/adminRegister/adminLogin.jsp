<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminRegisterHeader.jspf"%>


<body class="bg-gradient-secondary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img src="/myapp/resources/img/admin/05.png" style="width:470px; height:450px;"/></div> <!-- 이미지 -->
                            <div class="col-lg-6 my-auto">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    
                                    <!-- 로그인 폼 -->
                                    <form method="post" id="login" action="/myapp/adminLogin" class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userid" name="userid" aria-describedby="emailHelp"
                                                placeholder="Enter Admin ID...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="userpwd" name="userpwd" placeholder="Password">
                                        </div>
                                        
                                        <button type="submit" class="btn btn-user btn-block" style="background-color:#EE8374; color:white">Login</button>
                                       
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/myapp/adminForgotPassword">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/myapp/adminJoin">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

<%@ include file="/WEB-INF/adminInc/adminRegisterFooter.jspf"%>