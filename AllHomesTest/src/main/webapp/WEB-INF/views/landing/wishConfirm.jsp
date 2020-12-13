<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${r>0}">
	<script>	
		alert("위시리스트에 등록되었습니다.")
		location.href="/myapp/storeDetail?pd_no=${pd_no}";
	</script>
</c:if>
<c:if test="${r==0}">
	<script>
		alert("이미 위시리스트에 등록된 제품입니다.");
		history.back();
	</script>
</c:if>