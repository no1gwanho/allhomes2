<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		//글 삭제 
		$("#HBDelBtn").click(function(){
			var result = confirm("글을 삭제하시겠습니까?");
			if(result){
				 location.href= "<%=request.getContextPath()%>/adminHomeboardDelete?b_no=${vo.b_no}";
			}
		});
		
		
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class=" card shadow mb-4">
				<div class="card-header">
					<h6 class="m-0  font-weight-bold text-primary" style="float: left;height:35px;line-height:35px;">집들이게시판 글 보기</h6>
					<button class="btn btn-user alert-danger shadow-sm" id="HBDelBtn" style="float:right;height:35px">삭제</button>
				</div>
				<div class="card-body">
					<h6 style="color: gray">
						테마 > ${vo.theme}
					</h6>
					<h3>${vo.title}</h3>
					<div class="row">
						<div class="col-md-auto" style="font-size: 13px;">
							<i class="fas fa-user-circle fa-2x"></i>&nbsp; <a href="#">${vo.userid }</a>
							· ${vo.writedate} ·
						</div>
						<div class="col"></div>
					</div>

					<hr />
					<br />
					<div class="contentDiv">${vo.content}</div>

					<h6 style="font-size: 13px; color: gray;">조회수 ${vo.hit} · 스크랩
						${vo.scrap}회 ·</h6>
					<div id="hashtag">
						<c:forEach var="i" items="${hashtagList}">
							<a href="#" class="badge badge-light"><span>#</span>${i}</a>
						</c:forEach>
					</div>


					

					<div class="col col-lg-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>