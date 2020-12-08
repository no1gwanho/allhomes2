<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class=" card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0  font-weight-bold text-primary"
						style="float: left">상세보기</h6>

				</div>
				<div class="card-body">
					<h6 style="color: gray">
						테마 > <a href="#">${vo.theme}</a>
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
						${vo.scrap}회 · 댓글 3</h6>
					<div id="hashtag">
						<c:forEach var="i" items="${hashtagList}">
							<a href="#" class="badge badge-light"><span>#</span>${i}</a>
						</c:forEach>
					</div>


					<hr />

					<!-- 댓글개수 표시창 -->
					<div style="margin: 20px;">
						<span style="font-size: 15px; color: gray;">댓글 3개</span>
					</div>

					<br/>
					<!-- 댓글 리스트 -->
					<div id="commentList">
						<!-- 댓글리스트 나오는 곳 -->
					</div>

					<div class="col col-lg-2"></div>
				</div>
			</div>
		</div>
	</div>
</div>