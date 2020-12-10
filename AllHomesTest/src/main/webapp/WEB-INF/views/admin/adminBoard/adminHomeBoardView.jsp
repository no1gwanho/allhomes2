<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		//글 삭제 
		$("#HBDelBtn").click(function(){
			var result = confirm("글을 삭제하시겠습니까?");
			if(result){
				 location.href= "<%=request.getContextPath()%>/adminHomeboardDelete?b_no=${list.b_no}";
			}
		});
		
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
								tag += '<span style="width: 80%;color:black">'+v.hb_comment+'</span><br/>';
								tag += '<span style="color:black;font-size:12px">'+ v.writedate+ '</span>';
								
								if(v.editdate!=null){
									tag += '&nbsp;&nbsp;<span style="color:gray;font-size:11px;">('+v.editdate+' 수정됨)</span>';
								}
								
								if (v.userid == '${userid}') {
									tag += '<div><input type="button" class="editBtn" value="수정">&nbsp;&nbsp;';
									tag += '<input type="button" class="delBtn" title="'+v.hb_c_no+'" value="삭제"></div>';
								}
								tag += '</div>'; // 기존 입력한 댓글 시간 닫기 
								
							if(v.userid == '${userid}'){ //댓글쓴 사람의 아이디가 로그인한 사람과 같으면 수정폼 생성 
								tag += '<div style="display:none">';
								tag += '<form>';
								tag += '<input type="hidden" name="hb_c_no" value="'+v.hb_c_no+'"/>';
								tag += '<textarea class="form-control" name="hb_comment" maxlength="100" style="width: 80%; max-width: 80%;">'+v.hb_comment+'</textarea><br/>';
								tag += '<input type="submit" value="수정완료">&nbsp;<input type="button" value="취소" class="comment-edit-cancle"></form></div>';									
								}
								
								
								tag += '</div>'; //col-10 닫기 
								//로그인한 아이디와 현재 댓글으 아이디가 같으면 수정폼 만들어주기 
								
								tag += '</div><hr/>';  //div-row닫기 
							});
							$("#commentList").html(tag);

						},
						error : function() {
							console.log("댓글 전체리스트 불러오기 에러 발생..");
						}
						
					});
				}
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