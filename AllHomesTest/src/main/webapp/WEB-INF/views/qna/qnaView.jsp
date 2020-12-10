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
	 
	 .container{
			max-width:1100px;
			margin: 0 auto;
			font-family: 'SCDream3';
			word-wrap : break-word;
	}
	
	.contentDiv{
		min-height:200px;
	}

</style>

<script>

	function qnaDelCheck(q_no) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			location.href = "/myapp/qnaDelete?q_no="+q_no;
		}
	}

	$(function() {
		
		//댓글 수정버튼 클릭시  - 수정폼 보여주기 
		$(document).on('click', '.editBtn', function(){
			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().next().css("display", "block");
		});	
		
		$(document).on('click', '.comment-edit-cancle', function(){
			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().prev().css("display", "block");
		});
		
		
		//----------------------------------여기서부터 댓글-------------------------------------------//
		//질문게시판 댓글리스트 구하기
		function commentListSelect() {
			var url = "/myapp/qnaCommentList";
			var data = "q_no=${vo.q_no}";
			console.log("질문하기 댓글 기능 넘어옴?")
			
			$.ajax({
				url : url,
				data : data,
				success : function(result) {
					var $result = $(result);
					var commentNum = $result.length;
					$("#commentNum").html(commentNum);
					var tag = "";
							$result.each(function(i, v) {
								tag += '<div class="row" style="font-size:14px;">';
								tag += '<div class="col-2">';
								if(v.userid == '${writer}' ){
									tag += '<span class="badge" style="background-color:#E98374;color:white;">글쓴이</span><br/>';
								}
								tag += '<img class="profile_pic" src="/myapp/resources/upload/register/'+ v.m_pic + '"/>';
								tag += '<span style="margin: 2px 10px 0 10px; width: 100px;font-weight:bold;"><a href="#">'+v.userid +'</a></span>';
								tag += '</div>';
								
								//<div col-10>
								tag += '<div class="col-10">'; //col-10  시작 
								tag += '<div>'; // 기존에 입력한 댓글과 시간
								tag += '<span style="width: 80%;color:black">'+v.q_comment+'</span><br/>';
								tag += '<span style="color:black;font-size:12px">'+ v.writedate+ '</span>';
								
								if(v.editdate!=null){
									tag += '&nbsp;&nbsp;<span style="color:gray;font-size:11px;">('+v.editdate+' 수정됨)</span>';
								}
								
								if (v.userid == '${userid}') {
									tag += '<div><input type="button" class="editBtn" value="수정">&nbsp;&nbsp;';
									tag += '<input type="button" class="delBtn" title="'+v.q_c_no+'" value="삭제"></div>';
								}
								tag += '</div>'; // 기존 입력한 댓글 시간 닫기 
								
								if(v.userid == '${userid}'){ //댓글쓴 사람의 아이디가 로그인한 사람과 같으면 수정폼 생성 
									tag += '<div style="display:none">';
									tag += '<form>';
									tag += '<input type="hidden" name="q_c_no" value="'+v.q_c_no+'"/>';
									tag += '<textarea class="form-control" name="q_comment" maxlength="100" style="width: 80%; max-width: 80%;">'+v.q_comment+'</textarea><br/>';
									tag += '<input type="submit" value="수정완료">&nbsp;<input type="button" value="취소" class="comment-edit-cancle"></form></div>';									
								}
								
								tag += '</div>'; //col-10 닫기 
								tag += '</div><hr/>';  //div-row닫기 
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
			if ($("#q_comment").val() == "") {
				alert("댓글을 입력해주세요");
				return false;
			}
			var url = "/myapp/qnaCommentWrite";
			var params = $("#commentWriteForm").serialize();
			$.ajax({
				url : url,
				data : params,
				success : function(result) {
					commentListSelect();
					$("#q_comment").val("");
				},
				error : function() {
					console.log("댓글 등록시 에러 발생..");
				}

			});
			return false;

		});

		
		//댓글 수정하기! -- > 수정 버튼 누르면 
		$(document).on('submit', '#commentList form', function(){
			var url = "/myapp/qnaCommentEdit";
			var params = $(this).serialize();
			
			$.ajax({
				url : url,
				data : params,
				success : function(result){
					commentListSelect();
				},error : function(){
					console.log("댓글 Edit 누를때 에러 Ajax ");
				}
			});
			return false;
		});
		
		//댓글 삭제하기 
		$(document).on('click', '.delBtn', function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				var url = "/myapp/qnaCommentDel";
				var params = "q_c_no="+ $(this).attr("title");
				 
				$.ajax({
					url : url,
					data : params,
					success : function(result){
						 commentListSelect();
					 },error : function(){
						 console.log("댓글 삭제시 에러 ");
					 }
				 });
			}
		});
		
		//댓글 글 개수 구하기 
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

		<div class="col-lg-12 col-md-auto">
			<h6 style="color: gray">
				<a href="/myapp/qnaMain">질문과답변</a>
			</h6>
			<h3 id="title">${vo.title}</h3>
			<div class="row">
				<div class="col-md-auto hb-view-content" style="font-size: 13px;">
					<img class="profile_pic" src="<%=request.getContextPath() %>/resources/upload/register/${vo.m_pic }">&nbsp; 
					<a href="#">${vo.userid }</a>
					· ${vo.writedate} &nbsp;&nbsp;조회수 ${vo.hit} · 답변 ${answerNum}개
					
					<c:if test="${loginId == vo.userid}">
						<a href="/myapp/qnaEdit?q_no=${vo.q_no }">수정</a>&nbsp;
					<a href="javascript:qnaDelCheck(${vo.q_no })">삭제</a>
					</c:if>
					
				</div>
			</div>
			<hr />
			<div class="contentDiv">${vo.content}</div>
			<br/>
			<hr />

			<!-- 댓글개수 표시창 -->
			<div style="margin: 20px;">
				<span style="font-size: 15px; color: gray;">답변&nbsp;&nbsp;</span><span id="commentNum" style="font-size: 15px; color: #E98374; font-weight: bold">0</span>
			</div>
			
			
			
			<!-- =================댓글입력창 ======================== -->
			<c:if test="${logStatus == 'Y'}">
				<div id="comment">
					<form method="post" id="commentWriteForm">
					<div class="row" style="padding-left:20px;">
						<div class="co-1"  >
							<img class="profile_pic" src="<%=request.getContextPath() %>/resources/upload/register/${m_pic }"><span style="margin: 2px 10px 0 10px"><a href="#">${userid}</a></span>
						</div>
						<div class="col-9">
							<input type="hidden" name="q_no" value="${vo.q_no }"> <!-- 원글번호 저장 --> 
							<textarea name="q_comment" id="q_comment" class="form-control" placeholder="댓글을 등록해보세요(최대 100글자)" maxlength="100" style="width: 100%; max-width: 100%;"></textarea>
						</div>
					
						<div class="col-1" style="margin:0;text-align:left;">
								<input type="submit" style="background-color: #E98374;color:white;" class="btn" value="등록" />
						</div>
					</div> <!-- row -->
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
					<p>답변은 로그인후 작성 가능합니다. <a href="/myapp/qnaReplyLogin?q_no=${vo.q_no }" style="color: blue;">로그인</a></p>
				</div>
			</c:if>
			<br/>
			<hr/>
			<!-- 댓글 리스트 -->
			<div id="commentList">
				<!-- 댓글리스트 나오는 곳 -->
			</div>
			<div class="col col-lg-2"></div>

		</div>
		<!-- row -->

	</div>
</div>