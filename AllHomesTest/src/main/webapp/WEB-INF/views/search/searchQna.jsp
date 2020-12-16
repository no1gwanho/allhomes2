<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
  
  .container{
		font-family: 'SCDream3';
		max-width:1200px;
		margin: 0 auto;
		ont-family: 'SCDream3';
	}
  
  	.col-3{
		text-align:center;
		margin-bottom:10px;
	}
	
	#qnaTitle {
		margin: 100px 100px 20px 100px;
	}
	
	#qnaTitle>h1 {
		text-align: center;
	}
	
	.qna-thumbnail{
		width: 150px;
		height: 120px;
		overflow:hidden;
	}
	
	.qna-thumbnail>img{
		width:150px;
		height:120px;
		border-radius: 5%;
	}
	
	.profile_pic{
		width:20px;
		height:20px;
		border-radius: 45%;
	}
	
	.input-group{
		margin: 0 auto;
	}
	
	
	.fa-question-circle {
		color: #E98374;
	}
		
	.qna-title{
		color:black;
		font-family: 'SCDream5';
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: 20px; 
		
	}
	.qna-title>a:link{
		font-size:20px;
		color:black;
	}

	.qna-content{
		font-size:15px;
		margin-top:10px;
		height:45px;
		white-space: normal;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.qna-main-row{
		max-height:130px;
		height:130px;
	}
	
	.qna-info{
		margin-left:10px;
		font-size:12px;
	}
	
	#qna-border{
		border: 0.2px solid #f5f5f5;
		margin-top:20px;
		padding : 20px;
	}

	#repbox{border:1px solid #E98374;}
	
	#qna-result{
		text-align: center;
	}
	
	.keyword{
		text-weight:bold;
		color:#ee8374;
	}
	
</style>

<script>
	$(function(){
		
	$('#qnaWriteBtn').click(function(){
		location.href="/myapp/qnaWrite";
	});
		

	var numOfAnswer = $('.num-of-answer').attr('title');
	if(numOfAnswer != null){
			$('.num-of-answer').css({'color' : '#E98374', 'font-weight' : 'bold', 'font-size' : '14px'});
	}
		
		
		
	var selectOption = $('#order').val();
	var key = $('#key').val()
		
	
	$('#qnaSearch').keydown(function(e){
		if(e.keyCode==13){
			var key = $('#qnaSearch').val();
			location.href="<%=request.getContextPath()%>/searchQna?key="+key;
		}
		
	});
		
		
		
	});

</script>

<!-- 스토어 검색 -->
<div class="container"><!-- ==============container오류 방지 div============== -->
  	
	<div id="qnaTitle">
		<h1><i class="fas fa-question-circle"></i>질문과 답변</h1>
	</div>
	
	<div class="qna-searchbox">
		
			<div class="input-group" style="width:600px;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
				</div>
				<input id="qnaSearch" type="text" value="${key }" class="form-control" placeholder="Search" aria-label="Search">
			</div>
			<br/>
			<h5 id="qna-result">'${key}'에 대한 질문과답변 검색결과 <span class="keyword">${qCount}</span></h5>
		
	</div>
	
	
	<div class="row">
		<div class="col-lg-10"></div>
		<div class="col-lg-2">
			<input type="button" class="btn" style="background-color:#E98374;color:white;width:100px;" value="질문하기" id="qnaWriteBtn">
		</div>
		
	</div>
	
	<div id="qna-border">
	<!-- 게시판 글 시작 -->
	<hr>
	<c:forEach var="vo" items="${qList }" varStatus="status">
		<div class="row qna-main-row" style="cursor:pointer;" onclick="window.location='/myapp/qnaView?q_no=${vo.q_no}'">
		
			<div class="col-9">
				<!-- 제목 -->
				<div class="qna-title">
				${vo.title }
				</div>
				
				<div class="qna-info"> <!-- 아이디 정보  -->
				<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}"/>
				 <a href="#">${vo.userid }</a>&nbsp;&nbsp;&nbsp;&nbsp; ${vo.writedate } &nbsp;&nbsp; 답글 :<span class="num-of-answer" style="font-weight:bold" title="${vo.answer}"> ${vo.answer}</span>개  &nbsp;&nbsp; 조회 : ${vo.hit }회
				</div>
				
				<!-- 본문내용 -->
				<div class="qna-content">
				${vo.content }
				</div>
				
			</div>
	
			<div class="col-3 qna-thumbnail">
			<c:if test="${vo.thumbnail ne null }">
				<img src="<%=request.getContextPath() %>/resources/upload/qnaboardImg/${vo.thumbnail }">
			</c:if>
			</div>

			
		</div>
		<hr>
		</c:forEach>
	</div>
   
</div><!-- ==============container오류 방지 div============== -->