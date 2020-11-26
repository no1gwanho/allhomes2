<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>404 HTML Template by Colorlib</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="">
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Kanit:200" rel="stylesheet">
	<!-- Font Awesome Icon -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/error/font-awesome.min.css" />
	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/error/style.css" />


</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div>
			<a href="/myapp/"><img src="<%=request.getContextPath() %>/resources/img/allhomes3.png"style="width:100px;"/></a>
			</div>
			<div class="notfound-404">
				<h1>500</h1>
			</div>
			<h2>내부서버 에러가 발생했습니다. </h2>
			<p>방문하시려는 홈페이지에 내부서버 에러가 발생했습니다. 잠시후에 다시 시도해주시거나 회사로 문의주시기 바랍니다. cs@올홈즈.com</p>
			<div>
				<a href="/myapp/"><button class="btn" style="background-color:#E98374;color:white;width:200px;">메인페이지로</button></a>
			</div>
		</div>
	</div>

</body>

</html>
