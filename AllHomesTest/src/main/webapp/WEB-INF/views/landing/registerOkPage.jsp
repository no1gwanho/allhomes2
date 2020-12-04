<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!-- 회원가입 실패했을때 -->
<c:if test="${resultVO<=0}">
	<script>
		alert("회원가입 실패했습니다.");
		history.go(-1);
	</script>
</c:if>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signin.css" type="">
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
<style>
	.ah-btn {background-color:#ee8374;border:none;color:white;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}
	#logo{text-align:center;}
	
</style>


</head>
<body>
<div class="container">
	<div id="logo">
	<a href="/myapp/">
	<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png" alt="" style="width:150px;"/>
	</a>
	</div>
    <h1 class="display-5">가입이 완료되었습니다.</h1>
    <p class="lead">가입이 완료되었습니다! 등록하신 이메일로 인증 메일이 발송되었습니다. 인증 후 정상적으로 접속이 가능합니다.</p>
    
    <a href="/myapp/login"><button class="ah-btn btn">로그인하기</button></a>
    <a href="/myapp/"><button class="btn btn-secondary">홈으로</button></a> 
  </div>
	
</body>
</html>