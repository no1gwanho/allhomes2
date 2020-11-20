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
	width: 150px;
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
		<div class="row">
			
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="/myapp/qnaView">집이랑 사무실에서 쓸 가습기 추천해주세요</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="/myapp/qnaView">날이 너무 건조해서 ...</a>
				</p>
				<br /> <br /> 
				<p>
					<i class="fas fa-user-circle"></i> <a href="#">뚝딱이네집</a>
					&nbsp;&nbsp; 6분전
					&nbsp;&nbsp; 답글 : 3개
					&nbsp;&nbsp; 조회 : 14개 
					&nbsp;&nbsp; 
			
				</p>

			</div>
			<div class="col-lg-3">
				<a href="#"> <img class="qna-thumnail"
					src="<%=request.getContextPath() %>/resources/img/main/ah05.jpg" alt="">
				</a>
			</div>
		</div>
		
		<!-- 두번쨰 -->
		<!-- 게시판 글 시작 -->
	<hr>
		<div class="row">
			
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="#">집이랑 사무실에서 쓸 가습기 추천해주세요</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#">날이 너무 건조해서 ...</a>
				</p>
				<br /> <br /> 
				<p>
					<i class="fas fa-user-circle"></i> <a href="#">뚝딱이네집</a>
					&nbsp;&nbsp; 6분전
					&nbsp;&nbsp; 댓글 : 0개
					&nbsp;&nbsp; 조회 : 0개 
					&nbsp;&nbsp; 
					
				</p>

			</div>
			<div class="col-lg-3">
				<a href="#"> <img class="qna-thumnail"
					src="<%=request.getContextPath() %>/resources/img/main/ah05.jpg" alt="">
				</a>
			</div>
		</div>
		
		<!-- 게시판 글 시작 -->
	<hr>
		<div class="row">
			
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="#">집이랑 사무실에서 쓸 가습기 추천해주세요</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#">날이 너무 건조해서 ...</a>
				</p>
				<br /> <br /> 
				<p>
					<i class="fas fa-user-circle"></i> <a href="#">뚝딱이네집</a>
					&nbsp;&nbsp; 6분전
					&nbsp;&nbsp; 댓글 : 0개
					&nbsp;&nbsp; 조회 : 0개 
					&nbsp;&nbsp; 
				</p>

			</div>
			<div class="col-lg-3">
				<a href="#"> <img class="qna-thumnail"
					src="<%=request.getContextPath() %>/resources/img/main/ah05.jpg" alt="">
				</a>
			</div>
		</div>
		
		<!-- 게시판 글 시작 -->
	<hr>
		<div class="row">
			
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="#">집이랑 사무실에서 쓸 가습기 추천해주세요</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#">날이 너무 건조해서 ...</a>
				</p>
				<br /> <br /> 
				<p>
					<i class="fas fa-user-circle"></i> <a href="#">뚝딱이네집</a>
					&nbsp;&nbsp; 6분전
					&nbsp;&nbsp; 댓글 : 0개
					&nbsp;&nbsp; 조회 : 0개 
					&nbsp;&nbsp; 
				</p>

			</div>
			<div class="col-lg-3">
				<a href="#"> <img class="qna-thumnail"
					src="<%=request.getContextPath() %>/resources/img/main/ah05.jpg" alt="">
				</a>
			</div>
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
	