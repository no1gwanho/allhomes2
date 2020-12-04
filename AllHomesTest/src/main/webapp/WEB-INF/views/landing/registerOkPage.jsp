<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!-- ȸ������ ���������� -->
<c:if test="${resultVO<=0}">
	<script>
		alert("ȸ������ �����߽��ϴ�.");
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
    <h1 class="display-5">������ �Ϸ�Ǿ����ϴ�.</h1>
    <p class="lead">������ �Ϸ�Ǿ����ϴ�! ����Ͻ� �̸��Ϸ� ���� ������ �߼۵Ǿ����ϴ�. ���� �� ���������� ������ �����մϴ�.</p>
    
    <a href="/myapp/login"><button class="ah-btn btn">�α����ϱ�</button></a>
    <a href="/myapp/"><button class="btn btn-secondary">Ȩ����</button></a> 
  </div>
	
</body>
</html>