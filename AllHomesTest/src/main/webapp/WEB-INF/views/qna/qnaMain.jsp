<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.col-3, .col-lg-3, .col-xs-6{
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
	
	.input-group{
		margin: 0 auto;
	}
	
	
	.fa-question-circle {
		color: #E98374;
	}
	
	.container{
		font-family: 'SCDream3';
		max-width:1100px;
		margin: 0 auto;
		ont-family: 'SCDream3';
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
	
	.profile_pic{
		width:20px;
		height:20px;
		border-radius: 45%;
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
		
		
	});


</script>

<div class="container">
	<div id="qnaTitle">
		<h1><i class="fas fa-question-circle"></i>질문과 답변</h1>
	</div>
	
	<div class="qna-searchbox">
		<form class="form-inline">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
				</div>
				<input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="basic-addon1" style="width: 800px;">
			</div>
		</form>
	</div>
	
	
	<div class="row">
		<div class="col-lg-11"></div>
		<div class="col-lg-1">
			<input type="button" class="btn" style="background-color:#E98374;color:white;width:100px" value="질문하기" id="qnaWriteBtn">
		</div>
	</div>
	
	<div id="qna-border">
	<!-- 게시판 글 시작 -->
	<hr>
	<c:forEach var="vo" items="${list }" varStatus="status">
		<div class="row qna-main-row" style="cursor:pointer;" onclick="window.location='/myapp/qnaView?q_no=${vo.q_no}'">
		
			<div class="col-9">
				<!-- 제목 -->
				<div class="qna-title">
				${vo.title }
				</div>
				
				<div class="qna-info"> <!-- 아이디 정보  -->
				<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${vo.m_pic}"/>
				 <a href="#">${vo.userid }</a>&nbsp;&nbsp;&nbsp;&nbsp; ${vo.writedate } &nbsp;&nbsp; 답글 :<span class="num-of-answer" style="font-weight:bold" title="${answerList[status.index].answer}"> ${answerList[status.index].answer}</span>개  &nbsp;&nbsp; 조회 : ${vo.hit }회
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


		<!-- pagination ===========================================================-->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
						class="sr-only">Previous</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>
		
</div><!--container  -->
	