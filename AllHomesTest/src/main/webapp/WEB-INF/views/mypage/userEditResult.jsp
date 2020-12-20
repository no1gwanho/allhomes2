<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${editResult == 'Y'}">
	<script>
		alert("회원정보가 수정되었습니다.");
		location.href="/myapp/userEdit";
	</script>
</c:if>
<c:if test="${editResult != 'Y'}">
	<script>
		alert("회원정보가 수정안됐습니다.");
		location.href="/myapp";
	</script>
</c:if>

