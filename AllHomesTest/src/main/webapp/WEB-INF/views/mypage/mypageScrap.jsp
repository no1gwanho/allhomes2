<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style>
	.container{
		max-width:1400px;
		margin: 0 auto;
		font-family: 'SCDream3';
		text-align: center;
	}
	
	.col-3{
		text-align:center;
		margin-bottom:10px;
	}
	.scrap-title{
		font-family:'SCDream5';
		margin: 50px auto 50px auto;
	}
	.profile_pic{
		width:35px;
		border-radius: 45%;
	}

	.thumbnail{
		padding:0px;
		margin:0 auto;
		width:270px;
		height: 207px;
		overflow: hidden;
		border-radius: 5%;
	}
	
	.thumbnail img {
		width:100%;
		text-align: center;
		overflow: hidden;
	}
	
	.scrap-owner-info{
		margin: 30px auto 35px auto;
		color:black;
		font-size:20px;
	}
	.card-body{
		margin:0 auto;
	}
	.card-title{
		text-align:center;
	}
	
</style>

<div class="container">
	<h3 class="scrap-title">스크랩북</h3>
	
	<div class="scrap-owner-info">
	<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${m_pic}"/>
	${nickname } 
	</div>
	<br/><br/>
	<div class="row">
		<c:if test ="${empty scrapList }">
		
		<span style="margin:50px auto 50px auto">관심있는 글이 없습니다</span>
		</c:if>
						<c:forEach var="vo" items="${scrapList }">
						<div class="col-3" style="padding:5px;">
							<div class="thumbnail">
								<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>/resources/upload/homeboardImg/${vo.thumbnail }"/></a>
							</div>
							<div class="card-body">
								<div class="card-title">
									<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
								</div>
							</div>
						</div>
						</c:forEach>
	</div>

</div>