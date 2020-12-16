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
		width:270px;
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
	
	#qnaDiv{
		border: 0.2px solid #f5f5f5;
		padding : 10px;
		margin-right:30px;
	}
	#hbDiv{
		padding:10px;
	}
	
	.inner{
		padding:0 50px 0 20px;
		
	}
	#repbox{border:1px solid #E98374;}
</style>

<script>
	$(function(){
		var pNum = ${pCount};
		var hNum = ${hCount};
		
		if(pNum==0){
			$("#storeDiv").replaceWith("<div style='width:1400px;text-align:center;height:70px;line-height:70px;color:#EE8374'><h6>검색 결과가 존재하지 않습니다</h6></div>");
		} 
		if(hNum==0){
			$("#HBDiv").replaceWith("<div style='width:1400px;text-align:center;height:70px;line-height:70px;color:#EE8374'><h6>검색 결과가 존재하지 않습니다</h6></div>");
		}
	});

</script>


<div class="container"><!-- ==============container오류 방지 div============== -->
  	<br/>
  	<h5>'${key}'에 대한 통합검색 결과 <span class="keyword">${totalCount }</span></h5>
  	<hr>
  	
  	<div class="inner">
  		<h6>스토어 <span class="keyword">${pCount}</span></h6>
  		
  		<c:if test="${pCount > 0 }">
  		<a href="#" class=txtbtn>더보기</a>
  		</c:if>
  	<br/>
	<div id="storeDiv">
		<div class="row">
				<c:forEach var="pVo" items="${pList}" end="3">
					<div class="col-3 store-list" style="cursor:pointer;" onclick="window.location='/myapp/storeDetail?pd_no=${pVo.pd_no}'">
						<div class="thumbnail">
							<img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${pVo.s_no}/${pVo.main_img}"/>
						</div>	
						<div class="card-body">	
							<div class="store-name">${pVo.s_name }</div>
							<div class="product-name">  ${pVo.pd_name }</div>
							<c:if test="${pVo.discount != 0 }">
							<span class="store-discount">${pVo.discount }%</span>
							</c:if>
							<span class="store-price">${pVo.price }원</span>
							
							<c:if test="${pVo.status!=null && pVo.status == '판매중'}">
								<span class="badge badge-info">${pVo.status }</span>
							</c:if>
							<c:if test="${pVo.status!=null && pVo.status == '품절임박'}">
								<span class="badge badge-warning">${pVo.status }</span>
							</c:if>
							<c:if test="${pVo.status!=null && pVo.status == '입고대기'}">
								<span class="badge badge-secondary">${pVo.status }</span>
							</c:if>
						</div>	
					</div>
				</c:forEach>
		</div>
	</div>
	</div>
	<hr />



	<!-- ==============================================================집들이================================================================== -->
  		
  			
  	<div class="inner">
	  	<h6>집들이 <span class="keyword">${hCount}</span>
	  	<br/>
	  	</h6><a href="#" class=txtbtn>더보기</a>
	  	
		<br/>
		<div id="hbDiv">
			<div class="row">
				<c:forEach var="vo" items="${hList}" end="3">
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
		</div>
	<hr />

	
  	
  	
   <!-- ==============================================================게시판 글 시작================================================================== -->
   
    <div class="inner">
  	<h6>질문과 답변 <span class="keyword">${qCount }</span></h6><a href="#" class=txtbtn>더보기</a>
  	
    <br/>
    
    <div id="qnaDiv">

		
		<c:forEach var="Qvo" items="${qList }" end="3">
		<div class="row qna-main-row" style="cursor:pointer;" onclick="window.location='/myapp/qnaView?q_no=${Qvo.q_no}'">
			<div class="col-9">
				<!-- 제목 -->
				<div class="qna-title">
				${Qvo.title }
				</div>
				<div class="qna-info"> <!-- 아이디 정보  -->
				<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${Qvo.m_pic}"/>
				 <a href="#">${Qvo.userid }</a>
				 <br/>${Qvo.writedate } &nbsp;&nbsp; 답글 :<span class="num-of-answer" style="font-weight:bold" title="${Qvo.answer}"> ${Qvo.answer}</span>개  &nbsp;&nbsp; 조회 : ${Qvo.hit }회
				</div>
				
				<!-- 본문내용 -->
				<div class="qna-content">
				${vo.content }
				</div>
			
			</div>
		</div>
		<hr>
		</c:forEach>
		
	</div>
	</div>
	<div style="margin-top:100px;"></div>
   
   
</div><!-- ==============container오류 방지 div============== -->