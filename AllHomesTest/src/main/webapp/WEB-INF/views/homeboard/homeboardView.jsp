<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.card-inner {
	margin-left: 4rem;
}
.input-group {
	width: 90%;
	font-size: 13px;
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
</style>

<script>
	$(function(){
		
		$('textarea').keypress(function(e) {
		    var tval = $('textarea').val(),
		        tlength = tval.length,
		        set = 100,
		        remain = parseInt(set - tlength);
		    $('#textLength').text(remain);
		    if (remain <= 0 && e.which !== 0 && e.charCode !== 0) {
		        $('textarea').val((tval).substring(0, tlength - 1))
		    }
		})
		
		//댓글리스트 구하기
		function commentListSelect(){
			console.log("commetlist실행??")
			var url = "/myapp/commentList";
			var data = "b_no=${vo.b_no}";
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					console.log("commetlist실행22")
					var $result = $(result);
					var tag = "";
					var commentNum = $result.length;
					$("#commentNum").html(commentNum);
					$result.each(function(i,v){	
						tag += '<div class="input-group" style="margin-bottom:20px;">';
						tag += '<i class="fas fa-user-circle fa-2x" style="width: 30px;"></i>';
						tag += '<span style="margin: 2px 10px 0 10px; width: 100px;"><a href="#">'+v.userid+'</a></span>';
						tag += '<span style="width: 80%">'+v.hb_comment+'</span> <br />';
						tag += '<span style="margin-left: 150px">'+v.writedate+'</span>&nbsp;&nbsp;';
						tag += '<a href="#">수정</a>&nbsp;&nbsp;';
						tag += '<a href="#">삭제</a>&nbsp;&nbsp;';
						tag += '<a href="#" style="color: gray; font-size: 9px;">신고</a></div>';
					});		
					$("#commentList").html(tag);
					
				}, error: function(){
					console.log("댓글 전체리스트 불러오기 에러 발생..");
				}
				
			});
		}
		
		//새 댓글쓰기
		$("#commentWriteForm").submit(function(){
			if($("#hb_comment").val()==""){
				alert("댓글을 입력해주세요");
				return false;
			}
			if($("#hb_comment").val().length>100){
				alert("댓글은 최대 100글자까지만 가능합니다");
				return false;
			}
			var url = "/myapp/commentWrite";
			var params = $("#commentWriteForm").serialize();
			$.ajax({
				url:url,
				data : params,
				success : function(result){
					commentListSelect();
					$("#hb_comment").val("");
				},error:function(){
					console.log("댓글 등록시 에러 발생..");
				}
				
			});
			return false;
			
		});

	
		//글내용 보여줄때 댓글 내용도 보여주기
		commentListSelect();

		
	}); //jquery


</script>


<div class="container">


	<br /> <br />

	<div class="row justify-content-md-center">
		<div class="col col-lg-2"></div>

		<div class="col-lg-11 col-md-auto" style="border: 0.2px solid #f5f5f5">
			<h6 style="color: gray">
				테마 > <a href="#">${vo.theme}</a>
			</h6>
			<h3>${vo.title}</h3>
			<div class="row">
				<div class="col-md-auto" style="font-size: 13px;">
					<i class="fas fa-user-circle fa-2x"></i>&nbsp; 
					<a href="#">${vo.userid }</a>
					· ${vo.writedate} · 
					<a href="#">수정</a>&nbsp;
					<a href="#">삭제</a>
				</div>
				<div class="col"></div>
				<div class="col-lg-2 col-md-auto">
					<button class="btn"
						style="background-color: #E98374; font-size: 13px; color: white;">
						<i class="fas fa-file">&nbsp;</i>스크랩하기
					</button>
				</div>
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
				<span style="font-size: 15px; color: gray;">댓글&nbsp;&nbsp;</span><span id="commentNum" style="font-size: 15px; color: #E98374;font-weight:bold">3</span>
			</div>
			
			
			<!-- 댓글입력창 -->
			<div id="comment">
			<form method="post" id="commentWriteForm">
				<div class="input-group">
					<i class="fas fa-user-circle fa-2x"></i> 
					<input type="hidden" name="userid" value="${vo.userid }"/> <!-- userid보내기 -->
					<input type="hidden" name="b_no" value="${vo.b_no }"/> <!-- b_no보내기 -->
					<span style="margin: 2px 10px 0 10px"><a href="#">${vo.userid }</a></span> 
					<textarea name="hb_comment" id="hb_comment" class="form-control" placeholder="댓글을 등록해보세요(최대 100글자)" maxlength="100"></textarea>
					<div class="input-group-append">
					<input type="submit" style="background-color: #E98374" class="btn" value="등록"/>
					</div>
					
				</div>
			</form>
			
			</div>
			<div>
				<span id="textLength" style="margin-left:150px;color:gray;font-size:12px;">100</span><span style="color:gray;font-size:12px;">/100 글자</span>
			</div>
			<br /><br/>
			<!-- 댓글 리스트 -->
			<div id="commentList">
				<!-- 댓글리스트 나오는 곳 -->
			</div>
			
			<div class="col col-lg-2"></div>

		</div>
		<!-- row -->

	</div>
</div>