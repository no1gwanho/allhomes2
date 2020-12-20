<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		
		
		//글 삭제 
		$("#qnaDelBtn").click(function(){
			var result = confirm("글을 삭제하시겠습니까?");
			if(result){
				 location.href="<%=request.getContextPath()%>/adminQnaDelete?no=${vo.q_no}";
			}
		});
		
		
	});
</script>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class=" card shadow mb-4">
			<div class="card-header">
				<h6 class="m-0  font-weight-bold text-primary" style="float: left;height:35px;line-height:35px;">질문과 답변 글 보기</h6>
				<button class="btn btn-user alert-danger shadow-sm" id="qnaDelBtn" style="float:right;height:35px">삭제</button>
			</div>
			<div class="card-body">
				<div class="row justify-content-md-center hb-view-border">
					<div class="col-lg-12 col-md-auto">
						
						<h3 id="title">${vo.title}</h3>
						<div class="row">
							<div class="col-md-auto hb-view-content" style="font-size: 13px;">
								<img class="profile_pic" style="width:30px;height:30px;border-radius:70%"
									src="<%=request.getContextPath() %>/resources/upload/register/${vo.m_pic }">&nbsp;
								<a href="#">${vo.userid }</a> · ${vo.writedate} &nbsp;
								<c:if test="${loginId == vo.userid}">
									<a href="/myapp/qnaEdit?q_no=${vo.q_no }">수정</a>&nbsp;
					<a href="javascript:qnaDelCheck(${vo.q_no })">삭제</a>
								</c:if>
							</div>
						</div>



						<hr />
						<br />
						<div class="contentDiv">${vo.content}</div>
						<br /><br/>
						<h6 style="font-size: 13px; color: gray;">조회수 ${vo.hit} · 답변
							${vo.answer}개</h6>
						

						<br/>
						<hr />

						
						<div class="col col-lg-2"></div>

					</div>
					<!-- row -->
				</div>
			</div>
		</div>
	</div>
</div>