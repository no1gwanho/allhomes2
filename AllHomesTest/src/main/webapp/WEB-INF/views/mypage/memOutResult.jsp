<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${outcheck=='N'}">
<script>
		alert('회원탈퇴 동의란에 체크해주세요.');
		history.back();
</script>
</c:if>


<c:if test="${outcheck=='Y'}">
	<script>
		location.href="/myapp/";
	
	</script>
</c:if>