<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- 회원가입 성공했을때 -->
<c:if test="${resultVO>0}">
	<script>
		alert("회원가입에 성공하여 로그인 페이지로 이동합니다.");
		location.href="/myapp/login"
	</script>
</c:if>



<!-- 회원가입 실패했을때 -->
<c:if test="${resultVO<=0}">
	<script>
		alert("회원가입 실패했습니다.");
		history.go(-1);
	</script>
</c:if>

