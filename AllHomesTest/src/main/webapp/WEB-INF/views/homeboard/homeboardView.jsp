<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>


.col-3{
		text-align:center;
		margin-bottom:10px;
	}
		
.card-inner {
	margin-left: 4rem;
}

.input-group {
	width: 100%;
	font-size: 13px;
	margin:0px;
}

.reply {
	font-size: 13px;
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

.contentDiv{
	font-family: "gilbert";
}

#commentNoLogin {
	text-align: center;
	text-color: #666666;
	text-size: 12px;
}

.container{
	max-width:1100px;
	font-family: 'SCDream3';
}

.hb-view-border{
	border: 0.2px solid #f5f5f5;
	padding : 20px;
}

.profile_pic{
		width:25px;
		border-radius: 45%;
	
	}
 #commentList{
 	padding:0px;
 	margin:0px;
 }
 
 .editBtn, .delBtn{
 	background-color:white;
 	color:gray;
 	border:none;
 }
 
 .editBtn:active,
 .delBtn:active,
 .editBtn:focus,
 .delBtn:focus{
 	border:none;
 	outline:none;
 
 }
 
 .modal, .custum, .modal-dialog{
 	width:20%;
    position:fixed;
    bottom:0;
    right:0;
    margin:0;
 }
 
 .btn-allhomes{
 	background-color: #E98374; 
 	color: white;
 }
 
 .btn-allhomes:focus, .btn-allhomes:active, .btn-allhomes:hover{
 	color:gray;
 }



</style>

<script>

	function homeboardDelCheck(b_no) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			location.href = "/myapp/homeboardDelete?b_no="+b_no;
		}
	}

	$(function() {
		
		$('#move-to-scrap').click(function(){
			location.href="/myapp/mypageHome";
		});
		
		
		//----------------------------------여기서부터 댓글-------------------------------------------//
		//댓글리스트 구하기
		function commentListSelect() {
			var url = "/myapp/commentList";
			var data = "b_no=${vo.b_no}";
		
			
			$.ajax({
				url : url,
				data : data,
				success : function(result) {
					
					var $result = $(result);
					var commentNum = $result.length;
					$("#commentNum").html(commentNum);
					var tag = "";
							$result.each(function(i, v) {
								console.log(v.m_pic);
								tag += '<div class="input-group" style="margin-bottom:20px;">';
								tag += '<img class="profile_pic" src="/myapp/resources/upload/register/'+ v.m_pic + '"/>';
								tag += '<span style="margin: 2px 10px 0 10px; width: 100px;"><a href="#">'+v.userid +'</a></span>';
								tag += '<span style="width: 80%;color:black">'+v.hb_comment+'</span> <br />';
								tag += '<span style="margin-left: 150px">'+ v.writedate+ '</span>&nbsp;&nbsp;';
								
								if (v.userid == '${userid}') {
									tag += '<button class="editBtn">수정</span>&nbsp;&nbsp;';
									tag += '<button class="delBtn">삭제</span>&nbsp;&nbsp;';
								}
			
								tag += '</div><hr/>'; 
							});
							$("#commentList").html(tag);

						},
						error : function() {
							console.log("댓글 전체리스트 불러오기 에러 발생..");
						}
						
					});
				}
		
		
		
		
		
		

		//새 댓글쓰기
		$("#commentWriteForm").submit(function() {
			if ($("#hb_comment").val() == "") {
				alert("댓글을 입력해주세요");
				return false;
			}
			var url = "/myapp/commentWrite";
			var params = $("#commentWriteForm").serialize();
			$.ajax({
				url : url,
				data : params,
				success : function(result) {
					commentListSelect();
					$("#hb_comment").val("");
				},
				error : function() {
					console.log("댓글 등록시 에러 발생..");
				}

			});
			return false;

		});

		//댓글 수정 링크 클릭하면 수정폼 보여주기 
		$(document).on('click', '.edit', function() {
			$(this).parent().css("display", "none");
			$(this).parent().next().css("display", "block");
		});

		//댓글 삭제하기 

		
		
		//남은 글 개수 구하기 
		$('textarea').keypress(function(e) {
			var tval = $('textarea').val(), tlength = tval.length, set = 100, remain = parseInt(set-tlength);
				$('#textLength').text(remain);
					if (remain <= 0 && e.which !== 0 && e.charCode !== 0) {
				$('textarea').val(
				(tval).substring(0, tlength - 1))
				}
		});
		
		//글내용 보여줄때 댓글 내용도 보여주기
		commentListSelect();
		
		
		

	}); //jquery
	
	
	

</script>


<div class="container">


	<br /><br />

	<div class="row justify-content-md-center hb-view-border">
		<div class="col-lg-2"></div>

		<div class="col-lg-12 col-md-auto">
			<h6 style="color: gray">
				테마 > <a href="/myapp/homeboardTheme?hb_theme_no=${vo.hb_theme_no }">${vo.theme}</a>
			</h6>
			<h3>${vo.title}</h3>
			<div class="row">

				<div class="col-md-auto hb-view-content" style="font-size: 13px;">
					<img class="profile_pic" src="<%=request.getContextPath() %>/resources/upload/register/${vo.m_pic }">&nbsp; <a href="#">${vo.userid }</a>
					· ${vo.writedate} &nbsp;

					<c:if test="${loginId == vo.userid}">
						<a href="/myapp/homeboardEdit?b_no=${vo.b_no }">수정</a>&nbsp;
					<a href="javascript:homeboardDelCheck(${vo.b_no })">삭제</a>
					</c:if>

				</div>
				<div class="col"></div>
				<div class="col-lg-2 col-md-auto">
					<button type="button" class="btn btn-allhomes" data-toggle="modal" data-target="#scapButton">
						<i class="fas fa-heart">&nbsp;</i>스크랩하기
					</button>
				</div>
			</div>
			
			
			<!-- ==================================스크랩하기 모달창 부분=============================================== -->
			<!-- Modal -->
				<div class="modal fade custom" id="scapButton" tabindex="-1" role="dialog" aria-labelledby="scarpBtnModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="scarpBtnModalLabel">올홈즈 스크랩</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        선택하신 글이 스크랩에 담겼습니다 :) 
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-allhomes" id="move-to-scrap">스크랩북 보기</button>
				      </div>
				    </div>
				  </div>
				</div>
			<!-- ====================================모달창 끝!==============================================================-- -->
			

			<hr />
			<br />
			<div class="contentDiv">${vo.content}</div>
			<br/>
			<h6 style="font-size: 13px; color: gray;">조회수 ${vo.hit} · 스크랩 ${vo.scrap}회</h6>
			<br/>
			<div id="hashtag">
				<c:forEach var="i" items="${hashtagList}">
					<a href="#" class="badge badge-light"><span>#</span>${i}</a>
				</c:forEach>
			</div>


			<hr />

			<!-- 댓글개수 표시창 -->
			<div style="margin: 20px;">
				<span style="font-size: 15px; color: gray;">댓글&nbsp;&nbsp;</span><span
					id="commentNum"
					style="font-size: 15px; color: #E98374; font-weight: bold">3</span>
			</div>
			
			
			
			<!-- =================댓글입력창 ======================== -->
			<c:if test="${logStatus == 'Y'}">
				<div id="comment">
					<form method="post" id="commentWriteForm">
					
					<div class="row" style="padding-left:20px;">
						<div class="co-1"  >
							<img class="profile_pic" src="<%=request.getContextPath() %>/resources/upload/register/${vo.m_pic }"><span style="margin: 2px 10px 0 10px"><a href="#">${userid}</a></span>
						</div>
						<div class="col-9">
							<input type="hidden" name="b_no" value="${vo.b_no }"> <!-- 원글번호 저장 --> 
							<textarea name="hb_comment" id="hb_comment" class="form-control" placeholder="댓글을 등록해보세요(최대 100글자)" maxlength="100" style="width: 100%; max-width: 100%;"></textarea>
					
						</div>
					
						<div class="col-1" style="margin:0;text-align:left;">
								<input type="submit" style="background-color: #E98374;color:white;" class="btn" value="등록" />
						</div>
					</div>
							<!-- 글자개수 -->
							<div>
								<span id="textLength" style="margin-left: 150px; color: gray; font-size: 12px;">100
								</span><span style="color: gray; font-size: 12px;">/100 글자</span>
							</div>
					</form>
				</div>
			</c:if>
			
			<c:if test="${logStatus == null || logStatus !='Y'}">
				<div id="commentNoLogin">
					<p>
						댓글은 로그인 이후에 작성 가능합니다. <a href="/myapp/login" style="color: blue;">로그인</a>
					</p>

				</div>
			</c:if>
			
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