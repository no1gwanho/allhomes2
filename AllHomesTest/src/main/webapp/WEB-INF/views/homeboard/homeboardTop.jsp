<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	
.col-3 {
			text-align:center;
			margin-bottom:10px;
		}
	
	.card-body {
		padding-top:10px;
		height:150px;
		flex: none;
		overflow: hidden;
		}
	
	.thumbnail{
		padding:0px;
		margin:0px;
		width:320px;
		height: 207px;
		overflow: hidden;
		border-radius: 5%;
		}
		
	.thumbnail img {
		width:100%;
		text-align: center;
		overflow: hidden;
		}

	.card-title {
			padding:0px;
			font-size: 17px;
			font-weight: bold;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
	
	.card-title>a:link, .card-title>a:visited, .card-title>a:hover,
		.card-title>a:active {
		text-decoration: none;
	}
	
	.card-text {
		font-size: 14px;
	}
	
	.card-detail {
		font-size: 11px;
	}
	
	.container{
			max-width:1400px;
			margin: 0 auto;
			font-family: 'SCDream3';
	}

	
	#homeboardTitle {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 20px;
	font-family:'SCDream5'
	}
	
	#orderSelect{
		margin-left:15px;
	}
	
	.orderName{
		color:#242424;
	}
	
	.filter-option-inner{
		font-size:18px;
		font-family: 'SCDream5';
	}
	
	.profile_pic{
		width:25px;
		border-radius: 45%;
	
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
	<div class="row" id="orderSelect">
				
				<select class="selectpicker show-tick" id="order" name="order">
					<option class="orderName" value="recentBest" 
						<c:if test="${order == 'recentBest'} ">selected</c:if>>최근인기순</option> <!-- 현재는 최근 4개 글만 나오도록 설정함 나중에 개수 조정하기 -->
					<option class="orderName" value="best" 
						<c:if test="${order == 'best' }">selected</c:if>>역대인기순</option>
					<option class="orderName" value="recent" 
						<c:if test="${order == 'recent' }">selected</c:if>>최신순</option>
					<option class="orderName" value="scrap" 
						<c:if test="${order == 'scrap'}">selected</c:if>>스크랩순</option>
				</select>
	</div>
	<br/><br/>


<!-- Page Features -->
	<div class="row text-center">
		<c:forEach var="vo" items="${bestList }">

		<div class="col-3">
			<div class="thumbnail">
				<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
			</div>
			<div class="card-body">
				<div class="card-title">
					<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
				</div>
				<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}"/>
				<a href="#" class="card-text">${vo.userid }</a>
				<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }(확인후지울예정)
				</p>
				</div> 
			</div>
		</c:forEach>
	</div>

</div>