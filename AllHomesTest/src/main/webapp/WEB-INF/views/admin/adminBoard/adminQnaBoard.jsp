<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">
	<div class="row">
		<div class="my-2"></div>


		<div class="col-lg-12">

			<c:forEach var="vo" items="${list }">
				<div class="card shadow mb-4">
					<div class="card-body" style="text-align: center">
						<div class="row">
							<div class="col-lg-9">
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
									&nbsp;&nbsp; ${vo.writedate } &nbsp;&nbsp; 답글 : ${vo.answer}개
									&nbsp;&nbsp; 조회 : ${vo.hit }회 &nbsp;&nbsp;

								</p>
							</div>
							<div class="col-lg-3">
								<a href="#"> <img class="qna-thumnail"
									src="<%=request.getContextPath() %>${vo.thumbnail }">
								</a>
							</div>
						</div><!-- row끝 -->
					</div><!-- card-body끝 -->
				</div>
				<hr>
			</c:forEach>

		</div>


	</div>
</div>