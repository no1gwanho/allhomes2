<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	#idpw{text-align:center;}
	#logo img{width:200px; display: block; margin: 0px auto;}
	#button {background-color:#ee8374;border:none;}
	#button:hover{background-color:#ee8374;border: 1px solid gray;}
</style>


</head>
<body>
<div class="container">
	<div id="logo">
	
	<a href="/myapp/">
	<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png" alt=""/>
	</a>
	
	</div>
    <h1 class="display-4">가입이 완료되었습니다.</h1>
    <p class="lead">가입이 완료되었습니다! 등록하신 이메일로 인증 메일이 발송되었습니다. 인증 후 정상적으로 접속이 가능합니다.</p>
    
    <button class="ah-btn"></button>
  </div>
	
</body>
</html>