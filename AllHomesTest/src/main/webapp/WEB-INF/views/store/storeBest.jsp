<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	
	.container{
		max-width:1400px;
		margin: 0 auto;
		font-family: 'SCDream3';
	}
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
	
	.thumbnail img {
		width:100%;
		text-align: center;
		overflow: hidden;
		}
		
	.card-body {
		padding-top:10px;
		height:150px;
		flex: none;
		overflow: hidden;
		}
	.product-name{
		font-family:'SCDream5'
	}
	.store-name{
		color:gray;
		font-size:12px;
	}
	.store-discount{
		font-family:'SCDream5';
		font-size:20px;
		color: #E98374
	}
	
	.store-price{
		color: black;
		font-family:'SCDream5';
		font-size:20px;
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
	<div style="margin:0;padding:0">
	<select class="selectpicker" name="order" id="order">
				<option value="recentBest" <c:if test="${order == 'recentBest' }">selected</c:if>>최근인기순</option>
				<option value="best" <c:if test="${order== 'best' }">selected</c:if>>역대인기순</option>
			</select>
	</div>
	<br/>
	<!-- 상품리스트 -->
	
	<hr/>
	<div class="container store-list-container" style="margin-top:45px;">
		<div class="row">
			<c:forEach var="vo" items="${bestList }">
				<div class="col-3 store-list" style="cursor:pointer;" onclick="window.location='/myapp/storeDetail?pd_no=${vo.pd_no}'">
						<div class="thumbnail">
							<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"/>
						</div>	
						<div class="card-body">	
							<div class="store-name">${vo.s_name }</div>
							<div class="product-name">  ${vo.pd_name } </div>
							<c:if test="${vo.discount != 0 }">
							<span class="store-discount">${vo.discount }%</span>
							</c:if>
							<span class="store-price">${vo.price }원</span>
							
							<c:if test="${vo.status!=null && vo.status == '판매중'}">
								<span class="badge badge-info">${vo.status }</span>
							</c:if>
							<c:if test="${vo.status!=null && vo.status == '품절임박'}">
								<span class="badge badge-warning">${vo.status }</span>
							</c:if>
							<c:if test="${vo.status!=null && vo.status == '입고대기'}">
								<span class="badge badge-secondary">${vo.status }</span>
							</c:if>
						</div>	
					</div>
			</c:forEach>
			
		</div>
	</div>

</div>
