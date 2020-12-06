<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#qnaTitle {
	margin: 100px 100px 20px 100px;
}

#qnaTitle>h1 {
	text-align: center;
}

.qna-thumnail{
	width: 200px;
	height: 150px;
}

.input-group{
	margin: 0 auto;
}


.fa-question-circle {
	color: #E98374;
}
</style>

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
		<div class="col-lg-1"><button type="button" class="btn" style="background-color:#E98374;color:white;width:100px"><a href="/myapp/qnaWrite">질문하기</a></button></div>
	</div>
	
	
	<!-- 게시판 글 시작 -->
	<hr>
	<c:forEach var="vo" items="${list }">
		<div class="row">
		
			<div class="col-lg-9" >
				<!-- 제목 -->
				<h4>
					<strong><a href="/myapp/qnaView?q_no=${vo.q_no }">${vo.title }</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="/myapp/qnaView">${vo.content }</a>
				</p>
				<br /> <br /> 
				<p>
					<i class="fas fa-user-circle"></i> <a href="#">${vo.userid }</a>
					&nbsp;&nbsp; ${vo.writedate }
					&nbsp;&nbsp; 답글 : ${vo.answer}개
					&nbsp;&nbsp; 조회 : ${vo.hit }회
					&nbsp;&nbsp; 

				</p>
			</div>
			<div class="col-lg-3">
				<a href="#"> <img class="qna-thumnail" src="<%=request.getContextPath() %>${vo.thumbnail }">
				</a>
			</div>
			
		</div>
		<hr>
		</c:forEach>

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
	