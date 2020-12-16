<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result>0 }">
	alert("리뷰가 정상적으로 등록되었습니다.")
	location.href="/myapp/mypageShopping";
</c:if>
<c:if test="${result==0 }">
	alert("리뷰가 등록되지 않았습니다.");
	history.back();
</c:if>