<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${logStatus=='Y' && regcode == 1}"> <!-- DB에서 정보 잘받고 인증도 잘된경우 -->
	<script>
	location.href="/myapp/";
	</script>
</c:if>
<c:if test="${logStatus=='N' }">	<!-- DB에서 정보못받은 경우-->	
	<script>
		alert("아이디 혹은 비밀번호가 틀렸습니다. 다시 시도해주세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${logStatus!='N' && regcode == 0 }">	<!-- DB에서 정보 잘받고 인증이 안된경우 즉,최초 회원가입인경우  -->
	<script>
		alert("이메일 회원가입 인증을 해주세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${logStatus!='N' && regcode == 2 }">	<!-- 회원 탈퇴했던경우  -->
	<script>
		alert("등록되지 않은 회원정보입니다 회원가입을 해주세요.");
		history.go(-1);
	</script>
</c:if>
