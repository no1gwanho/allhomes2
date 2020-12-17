<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 위시리스트 추가 결과 -->
<c:if test="${resultWishAdd>0}">
	<script>	
		alert("위시리스트에 등록되었습니다.")
		location.href="/myapp/storeDetail?pd_no=${pd_no}";
	</script>
</c:if>
<c:if test="${resultWishAdd==0}">
	<script>
		alert("이미 위시리스트에 등록된 제품입니다");
		history.back();
	</script>
</c:if>

<!-- 리뷰 등록 결과 -->
<c:if test="${reviewWrite>0 }">
	<script>
		alert("리뷰가 정상적으로 등록되었습니다.")
		location.href="/myapp/mypageShopping";
	</script>
</c:if>
<c:if test="${reviewWrite==0 }">
	<script>
		alert("리뷰가 등록되지 않았습니다.");
		history.back();
	</script>
</c:if>

<!-- 리뷰 수정 결과 -->
<c:if test="${reviewEdit>0}">
	<script>	
		alert("리뷰가 정상적으로 수정되었습니다.")
		location.href="/myapp/storeDetail?pd_no=${pd_no}";
	</script>
</c:if>
<c:if test="${reviewEdit==0}">
	<script>	
		alert("리뷰가 수정되지 않았습니다.")
		history.back();
	</script>
</c:if>

<!-- 리뷰 삭제 결과 -->
<c:if test="${reviewDel>0}">
	<script>	
		alert("리뷰가 정상적으로 삭제되었습니다.");
		location.href="/myapp/storeDetail?pd_no=${pd_no}";
	</script>
</c:if>
<c:if test="${reviewDel==0}">
	<script>	
		alert("리뷰가 삭제되지 않았습니다.")
		history.back();
	</script>
</c:if>

<!-- 구매 취소 결과 -->
<c:if test="${orderCancel>0 }">
	<script>
		alert("구매취소 신청이 정상적으로 이루어졌습니다.");
		location.href="/myapp/mypageShopping";
	</script>
</c:if>