<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminRegisterHeader.jspf"%>

<body class="bg-gradient-secondary">

    <div class="container">

   
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            	<img src="/myapp/resources/img/admin/c5.jpg" style="width:105%;"/>
                            </div>
                            <div class="col-lg-6 my-auto">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                    </div><br/>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <a href="login.html" class="btn btn-primary btn-user btn-block">
                                            Reset Password
                                        </a>
                                    </form>
                                    <br/><hr><br/>
                                    <div class="text-center">
                                        <a class="small" href="">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>


<%@ include file="/WEB-INF/adminInc/adminRegisterFooter.jspf"%>