<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 200px;
	height: 150px;
}

.qna-thumbnail>img{
	width:150px;
}

.input-group{
	margin: 0 auto;
}


.fa-question-circle {
	color: #E98374;
}

.container{
			max-width:1100px;
			margin: 0 auto;
			font-family: 'SCDream3';
	}
	
.qna-title{
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
	height:45px;
	white-space: nowrap;
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

</style>

<script>
	$(function(){
		
		$('#qnaWriteBtn').click(function(){
			location.href="/myapp/qnaWrite";
		});
		
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
						<input type="text" class="form-control" placeholder="Search"
							aria-label="Search" aria-describedby="basic-addon1"
							style="width: 800px;">
					</div>
	</form>
	</div>
	
	
	<div class="row">
		<div class="col-lg-11"></div>
		<div class="col-lg-1"><input type="button" class="btn" style="background-color:#E98374;color:white;width:100px" value="질문하기" id="qnaWriteBtn"></div>
	</div>
	
	<div id="qna-border">
	<!-- 게시판 글 시작 -->
	<hr>
	<c:forEach var="vo" items="${list }">
		<div class="row qna-main-row" style="cursor:pointer;" onclick="window.location='/myapp/qnaView?q_no=${vo.q_no}'">
		
			<div class="col-9">
				
				
				<!-- 제목 -->
				<div class="qna-title">
				${vo.title }
				</div>
				
				<div class="qna-info"> <!-- 아이디 정보  -->
				<i class="fas fa-user-circle"></i> <a href="#">${vo.userid }</a> ${vo.writedate } 답글 : ${vo.answer}개 조회 : ${vo.hit }회
				</div>
				
				<!-- 본문내용 -->
				<div class="qna-content">
				<a style="color:gray;font-size:15px;" href="/myapp/qnaView?q_no=${vo.q_no }">${vo.content }</a>
				</div>
				
			</div>
	
			
			
			
			<!--  
			<div class="col-3 qna-thumbnail">
				<img title="${vo.thumbnail }" src="<%=request.getContextPath() %>${vo.thumbnail }">
			</div>
			-->

			
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
	