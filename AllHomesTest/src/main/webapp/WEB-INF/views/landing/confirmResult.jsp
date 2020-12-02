<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${vo.confirm=='Y' }">
	<script>
	location.href="/myapp/mypageShopping";
	</script>
</c:if>
<c:if test="${vo.confirm!='Y' }">
	<script>
		alert("구매확정 실패! 이전 페이지로 돌아갑니다.");
		history.back();
	</script>
</c:if>