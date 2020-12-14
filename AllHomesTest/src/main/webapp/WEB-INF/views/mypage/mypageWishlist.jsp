<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	.col-3 {
	text-align:center;
	margin-bottom:10px;
	}
	.storeImg img {
		width:260px;
		height:147px;
		border-radius: 5%;
		text-align: center;
	}
	.col-lg-12{
		margin:0 auto;
	}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12" style="text-align:left;">
			<br/><br/>
			<img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist.png" style="width:40px;float:left;"/>
			<h4 style="width:30%;float:left;height:40px;line-height:40px;">&nbsp;&nbsp;위시리스트</h4>
			<br/><br/><hr><br/>
		</div><br/>
		<c:forEach var="v" items="${list }">
		<div class="col-3 storeImg">		
			<a href="/myapp/storeDetail?pd_no=${v.pd_no }">
				<img src="<%=request.getContextPath() %>/resources/upload/productMainImg/${v.s_no}/${v.main_img }"/><br/>
				<span style="font-size:0.8em">${v.pd_name }</span>
   			</a>
		</div>	
		</c:forEach>
	</div>
</div>