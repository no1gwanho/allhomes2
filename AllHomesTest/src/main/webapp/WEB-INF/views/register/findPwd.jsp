<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form method="get" action="/findPwdOk">
아이디: <input type="text" name="userid"/>
이메일: <input type="text" name="email"/>
<input type="submit" value="비밀번호 재설정"/>
</form>


</body>
</html>