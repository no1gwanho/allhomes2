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


					<!-- 댓글입력창 -->
					<div id="comment">
						<form method="post" id="commentWriteForm">
							<div class="input-group">
								<i class="fas fa-user-circle fa-2x"></i> <input type="hidden"
									name="userid" value="${vo.userid }" />
								<!-- userid보내기 -->
								<input type="hidden" name="b_no" value="${vo.b_no }" />
								<!-- b_no보내기 -->
								<span style="margin: 2px 10px 0 10px"><a href="#">${vo.userid }</a></span>
								<textarea name="hb_comment" id="hb_comment" class="form-control"
									placeholder="댓글을 등록해보세요(최대 100글자)" maxlength="100"></textarea>
								<div class="input-group-append">
									<input type="submit" style="background-color: #E98374"
										class="btn" value="등록" />
								</div>

							</div>
						</form>

					</div>
					<div>
						<span id="textLength"
							style="margin-left: 150px; color: gray; font-size: 12px;">0</span><span
							style="color: gray; font-size: 12px;">/100 글자</span>
					</div>
					<br /> <br />
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