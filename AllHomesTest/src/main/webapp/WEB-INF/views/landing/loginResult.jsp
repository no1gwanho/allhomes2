<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${logStatus=='Y' }">
	<script>
	location.href="/myapp/";
	</script>
</c:if>
<c:if test="${logStatus!='N' }">
	<script>
		alert("로그인 실패! 다시 시도해주세요.");
		history.go(-1);
	</script>
</c:if>>