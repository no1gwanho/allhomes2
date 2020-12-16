<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
  
  	.container{
			max-width:1400px;
			margin: 0 auto;
			
			font-family: 'SCDream3';
	}
  
  	.col-3{
		text-align:center;
		margin-bottom:10px;
	}
	
	
	.txtbtn{float:right;color:#ee8374;}
	
	.reptitle{
		color:black;
	}
	.repcontent{
		color:black;
	}
	.repprofile{
		color:black;
	}
	
	
	.card-body {
		text-align: center;
		height: 150px;
		padding: 10px;
		flex: none;
		overflow: hidden;
	}
	
	.card-img-top {
		border-radius: 5%;
		width: 320px;
		height: 207px;
		overflow: hidden;
	}
	
	.card-img-top>a>img {
		width: 325px;
		text-align: center;
	}
	
	.card {
		border: none;
	}

	.thumbnail{
		
		padding:0px;
		margin:0px;
		width:290px;
		height: 207px;
		overflow: hidden;
		border-radius: 5%;
		}
		
	.thumbnail img {
		width:100%;
		height:100%;
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
	
	
	.card-title-post{
		font-size: 20px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		color:black;
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
	
	.profile_pic{
		width:25px;
		border-radius: 45%;
	}
	
	.keyword{
		color:#ee8374;
	}
	

	
	
	.inner{
		padding:0 50px 0 20px;
		
	}
	
	.bootstrap-select{
		border: 1px solid gray;
		border-radius:5px;
	}

	
	#repbox{border:1px solid #E98374;}
	
	
</style>

<script>
	$(function(){
		
		
	var selectOption = $('#order').val();
	var key = $('#key').val()
		
		$('#order').change(function(){
			var selectedOrder = $('#order option:selected').val();
			location.href="/myapp/searchHb?key="+key+"&order="+selectedOrder;
		});
		
		
		
	});

</script>

<!-- 스토어 검색 -->
<div class="container"><!-- ==============container오류 방지 div============== -->
  	<br/>
  	<br/>
  	<h5>'${key}'에 대한 집들이 검색 결과 <span class="keyword">${hCount }</span></h5>
  	<hr>
  	
  	<div class="row">
  			<input type="hidden" id="key" value="${key }">
			<div class="col-9"></div>
			<div class="col-3" style="text-align:center;">
			<select class="selectpicker" name="order" id="order">
				<option value="recent" <c:if test="${order == 'recent' }">selected</c:if>>최신순</option>
				<option value="recentBest" <c:if test="${order == 'recentBest' }">selected</c:if>>최근인기순</option>
				<option value="best" <c:if test="${order == 'best' }">selected</c:if>>인기순</option>
			</select>
			</div>
	</div>
  	
		<div id="hbDiv">
			<div class="row">
				<c:forEach var="vo" items="${hList}">
					<div class="col-lg-3">
						<div class="thumbnail">
							<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
						</div>
						<div class="card-body">
							<div class="card-title">
								<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
							</div>
						<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}"/>
							<a href="#" class="card-text">${vo.userid }</a>
							<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit } | ${vo.writedate }</p>
					</div> 
					</div>
				</c:forEach>
			</div>
		</div>
	<hr />

	<div style="margin-top:100px;"></div>
   
</div>