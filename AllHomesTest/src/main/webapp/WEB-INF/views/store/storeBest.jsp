<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.col-3 {
		text-align:center;
		margin-bottom:10px;
	}
	.col-3 img {
		border-radius: 5%;
		width: 255px;
		height: 215px;
	}
	
	.container{
		font-family: 'SCDream3';
	}
	
	#homeboardTitle {
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: 20px;
		font-family:'SCDream5'
	}
</style>
<script>
	$(function(){

		$('#order').change(function(){
			var selectedOrder = $('#order option:selected').val();
			location.href="/myapp/storeBest?order="+selectedOrder;
		});
	
	});


</script>
<div class="container">
<!-- Collapse buttons -->
	<br/>
	<div class="row">
		<div class="col-lg-9" style="text-align:left;">
		<h3 id="homeboardTitle">스토어베스트</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-3" style="text-align:right;">
			<select class="selectpicker" name="order" id="order">
				<option value="recentBest" <c:if test="${order == 'recentBest' }">selected</c:if>>최근인기순</option>
				<option value="best" <c:if test="${order== 'best' }">selected</c:if>>역대인기순</option>
			</select>
		</div>
	</div>
	<br/>
	<!-- 상품리스트 -->
	<h6>상품 리스트</h6>
	<hr/>
	<div class="container store-list-container" style="margin-top:45px;">
		<div class="row">
			<c:forEach var="v" items="${bestList }">
				<div class="col-3 storeThumbnail">
					<a href="/myapp/storeDetail?pd_no=${v.pd_no }">
						
						<img src="<%=request.getContextPath() %>/resources/upload/productMainImg/${v.s_no}/${v.main_img }"/>
							<br/>
							<span style="font-size:0.5em;">${v.s_name } </span><span style="font-size:0.8em">${v.pd_name }</span>
							<br/>
						<c:if test="${v.discount != 0 }">
						<span class="badge badge-danger">${v.discount }%</span>
						</c:if>
						<span style="font-size:0.8em">
							${v.price }원<br/>(위시리스트: ${v.wishlist })
						<c:if test="${v.status!=null }">
							<h6><span class="badge badge-secondary">${v.status }</span></h6>
						</c:if>		
						</span>		
					</a>					
				</div>
			</c:forEach>
			
		</div>
	</div>

</div>
