<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">


	<br /><br />

	<div class="row justify-content-md-center hb-view-border">
		<div class="col-lg-2"></div>

		<div class="col-lg-12 col-md-auto">
			<h6 style="color: gray">
				<a href="/myapp/qnaMain">질문과답변</a>
			</h6>
			<h3 id="title">${vo.title}</h3>
			<div class="row">
				<div class="col-md-auto hb-view-content" style="font-size: 13px;">
					<img class="profile_pic" src="<%=request.getContextPath() %>/resources/upload/register/${vo.m_pic }">&nbsp; <a href="#">${vo.userid }</a>
					· ${vo.writedate} &nbsp;
					<c:if test="${loginId == vo.userid}">
						<a href="/myapp/qnaEdit?q_no=${vo.q_no }">수정</a>&nbsp;
					<a href="javascript:qnaDelCheck(${vo.q_no })">삭제</a>
					</c:if>
				</div>
			</div>
			
			
			
			<hr />
			<br />
			<div class="contentDiv">${vo.content}</div>
			<br/>
			<h6 style="font-size: 13px; color: gray;">조회수 ${vo.hit} · 답변 ${vo.answer}개</h6>
			<br/>


			<hr />

			<!-- 댓글개수 표시창 -->
			<div style="margin: 20px;">
				<span style="font-size: 15px; color: gray;">댓글&nbsp;&nbsp;</span><span
					id="commentNum"
					style="font-size: 15px; color: #E98374; font-weight: bold">3</span>
			</div>
			
			
			
			
			
			<br/>
			<br/>
			<!-- 댓글 리스트 -->
			<div id="commentList">
				<!-- 댓글리스트 나오는 곳 -->
			</div>

			<div class="col col-lg-2"></div>

		</div>
		<!-- row -->

	</div>
</div>