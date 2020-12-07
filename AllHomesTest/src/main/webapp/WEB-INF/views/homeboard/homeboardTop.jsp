<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	
	.card-title{
	
	}
	.card-body{
		height:200px;
		padding:10px;
		flex:none;
		overflow:hidden;
	}
	
	.card-img-top{
		border-radius: 5%;
		width: 320px;
		height: 205px;
		overflow: hidden;
		border:0.2px solid #f2f2f2;
	}
	
	.card-img-top>a>img{
		width:325px;
		text-align:center;
		
	}
	
	.card-top {
	
	width: 320px;
	height: 207px;
	
	}
	
	
	.card{
		border:none;
	}
	.card-title {
		
		font-size:20px;font-weight:bold;
		white-space: nowrap;
		overflow:hidden;
		text-overflow: ellipsis;
	}
	
	.card-title>a:link, .card-title>a:visited, .card-title>a:hover, .card-title>a:active{
		text-decoration:none;
	}
	
	.card-text{
		font-size:16px;
	}
	.card-detail{
		font-size:12px;
	}
	
	#homeboardTitle{margin-top:50px;margin-bottom:50px;margin-left:20px;}
	
	.card-body{
		height:150px;
	}
	
</style>
<script>
	$(function(){
			
			var refreshOption = $('#order').val();

			$('#order').change(function(){
					var selectedOrder = $("#order option:selected").val();
					location.href="/myapp/homeboardTop?order="+selectedOrder;

			});
			
			
		
	});


</script>



<div class="container">

	<div class="row">
		<div class="col-lg-9">
			<h3 id="homeboardTitle">베스트 집들이</h3>
		</div>
		<div class="col-lg-3"></div>
	</div>
	<div class="row">
				
				<select class="selectpicker show-tick" id="order" name="order">
					<option value="recentBest" 
						<c:if test="${order == 'recentBest'} ">selected</c:if>>최근인기순</option> <!-- 현재는 최근 4개 글만 나오도록 설정함 나중에 개수 조정하기 -->
					<option value="best" 
						<c:if test="${order == 'best' }">selected</c:if>>역대인기순</option>
					<option value="recent" 
						<c:if test="${order == 'recent' }">selected</c:if>>최신순</option>
					<option value="scrap" 
						<c:if test="${order == 'scrap'}">selected</c:if>>스크랩순</option>
				</select>
	</div>
	<br/><br/>


<!-- Page Features -->
	<div class="row text-center">
	
	<c:forEach var="vo" items="${bestList }">
	
		<div class="col-lg-3 col-md-6 mb-4">
			<div class="card h-80">
				<div class="card-img-top">
					<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img
						src="<%=request.getContextPath()%>${vo.thumbnail }"
						alt="${vo.b_no }" /></a>
				</div>
				<div class="card-body">
					<div class="card-title">
						<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
					</div>
					<a href="#" class="card-text">${vo.userid }</a>
					<p class="card-detail">조회: ${vo.hit }  |  스크랩: ${vo.scrap } | ${vo.writedate }(test)</p>
				</div>
			</div>
		</div>
	</c:forEach>
	
	</div>


</div>