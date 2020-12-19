<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 리뷰 삭제 결과 -->
<c:if test='${result > 0}'>
<script>
	alert("삭제에 성공했습니다.");
	location.href='<%=request.getContextPath()%>/adminReview';
</script>
</c:if>