<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${result>0 }">
	<script>
		location.href="<%=request.getContextPath()%>/, 5000";
	</script>
	
</c:if>
<c:if test="${result<=0 }">
	<script>
		alert("회원가입 실패했습니다.");
		history.go(-1);
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입성공</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signin.css" type="">
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="alert alert-dark" role="alert">
	회원가입 성공했습니다.<br/>
	메인페이지로 이동합니다. 
</div>
</body>
</html>
