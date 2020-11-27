<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.card-inner {
	margin-left: 4rem;
}

.input-group {
	width: 90%;
	font-size:13px;
}

.reply{
	font-size:13px;
}

.homeboardImages {
	max-width: 900px;
}

.homeboardImages>img {
	width: 90%
}

.contentDiv>p>img {
	max-width: 90%;
	max-height: 90%;
}


</style>


<div class="container">


	<br /> <br />

	<div class="row justify-content-md-center">
		<div class="col col-lg-2"></div>

		<div class="col-lg-11 col-md-auto" style="border:0.2px solid #f5f5f5">
			<h6 style="color: gray">
				테마 > <a href="#">${vo.theme}</a>
			</h6>
			<h3>${vo.title}</h3>
			<div class="row">
				<div class="col-md-auto" style="font-size:13px;"><i class="fas fa-user-circle fa-2x"></i>&nbsp; <a href="#">${vo.userid }</a> · ${vo.writedate} · <a href="#">수정</a>&nbsp;<a href="#">삭제</a></div>
				<div class="col"> </div>
				<div class="col-lg-2 col-md-auto"><button class="btn" style="background-color: #E98374;font-size:13px;color:white;"><i class="fas fa-file">&nbsp;</i>스크랩하기</button></div>
			</div>
			
			<hr />
			<br />
			<div class="contentDiv">${vo.content}</div>

			<h6 style="font-size: 13px; color: gray;">
				조회수 ${vo.hit} · 스크랩 ${vo.scrap}회 · 댓글 3 
			</h6>
			<div id="hashtag">
				<c:forEach var="i" items="${hashtagList}">
					<a href="#" class="badge badge-light"><span>#</span>${i}</a>
				</c:forEach>
			</div>


			<hr />
			<div style="margin: 20px;">
				<span style="font-size: 15px; color: gray;">댓글 3개</span>
				<hr />
			</div>
			<div id="newComment">
				<div class="input-group mb-3">
					<i class="fas fa-user-circle fa-2x"></i> <span
						style="margin: 2px 10px 0 10px"><a href="#">유저아이디</a></span> <input
						type="text" class="form-control" placeholder="댓글을 등록해보세요">
					<div class="input-group-append">
						<button class="btn" style="background-color: #E98374"
							type="submit">등록</button>
					</div>
				</div>
			</div>

			<br />
			<div>
				<div class="input-group mb-3">
					<i class="fas fa-user-circle fa-2x" style="width: 30px;"></i> <span
						style="margin: 2px 10px 0 10px; width: 100px;"><a href="#">유저아이디</a></span>
					<span style="width: 80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와
						찰떡콩떡입니다 ! ♡</span> <br /> <span style="margin-left: 150px">1시간전</span>&nbsp;&nbsp;<a
						href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a
						href="#">삭제</a>&nbsp;&nbsp;<a href="#"
						style="color: gray; font-size: 7px;">신고</a>
				</div>

				<!-- 대댓글 예시 -->
				<div class="reply alert" style="margin-left: 100px;background-color:#f5f5f5">
					<span style="font-size:15px;">└</span>&nbsp;&nbsp;<i class="fas fa-user-circle fa-2x" style="width: 30px;"></i> 
					<span style="margin-right: 30px"><a href="#">유저아이디</a></span>
					<span style="width: 80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와
						찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게
						예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한
						분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를
						이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와 찰떡콩떡입니다 ! ♡루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ
						엔틱한 분위기와 찰떡콩떡입니다 ! ♡</span> <br /> <span style="margin-left: 30px">1시간전</span>&nbsp;&nbsp;<a
						href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a
						href="#">삭제</a>&nbsp;&nbsp;<a href="#"
						style="color: gray; font-size: 7px;">신고</a>
				</div>

			</div>
			<div>
				<div class="input-group mb-3">
					<i class="fas fa-user-circle fa-2x" style="width: 30px;"></i> <span
						style="margin: 2px 10px 0 10px; width: 100px;"><a href="#">유저아이디</a></span>
					<span style="width: 80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와
						찰떡콩떡입니다 ! ♡</span> <br /> <span style="margin-left: 150px">1시간전</span>&nbsp;&nbsp;<a
						href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a
						href="#">삭제</a>&nbsp;&nbsp;<a href="#"
						style="color: gray; font-size: 7px;">신고</a>
				</div>



			</div>
			<div>
				<div class="input-group mb-3">
					<i class="fas fa-user-circle fa-2x" style="width: 30px;"></i> <span
						style="margin: 2px 10px 0 10px; width: 100px;"><a href="#">유저아이디</a></span>
					<span style="width: 80%">루이로즈를 이렇게 예쁘게 찍어주시다니요 ㅠㅠ 엔틱한 분위기와
						찰떡콩떡입니다 ! ♡</span> <br /> <span style="margin-left: 150px">1시간전</span>&nbsp;&nbsp;<a
						href="#">댓글달기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a
						href="#">삭제</a>&nbsp;&nbsp;<a href="#"
						style="color: gray; font-size: 7px;">신고</a>
				</div>

			</div>
		</div>

		<div class="col col-lg-2"></div>
	
	</div> <!-- row -->




</div>