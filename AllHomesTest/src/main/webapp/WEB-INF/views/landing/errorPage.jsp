<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>올홈즈</title>
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
				<h1>Sorry..</h1>
			</div>
			<h2>페이지를 찾을 수 없습니다. </h2>
			<p>방문하시려는 페이지의 주소가 잘못 입력되었거나, 페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. 입력하신 주소가 정확한지 다시 한번 확인해주시기 바랍니다.</p>
			<div>
				<a href="/myapp/"><button class="btn" style="background-color:#E98374;color:white;width:200px;">메인페이지로</button></a>
			</div>
		</div>
	</div>

</body>

</html>
