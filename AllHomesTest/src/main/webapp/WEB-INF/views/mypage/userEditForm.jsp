<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${logStatus == null || logStatus == 'N'}">
	<script>
		alert{"로그인 후 이동이 가능합니다."};
		location.href="/myapp/";
	</script>
</c:if>

<script>
	
	
	$(function(){
		$("#updateBtn").click(function(){	//회원정보 수정 form 데이터 submit 근데 submit일어나기전에 유효성검사 check
			
			//닉네임 검사
			if($("#nickname").val()==""){
				$("#nickname").val("membUs");
										
			}else{
				var nicknamePattern = /^[A-Za-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,10}$/;
				var nicknameTestResult = nicknamePattern.test($("#nickname").val());				
				if(nicknameTestResult!=true){
					alert("닉네임은 특수문자 제외 3~10자로 입력해주세요.");
					return false;
				}
			}
		
			//연락처 검사
			if($("#tel").val()==""){
				alert("연락처는 필수 입력사항입니다..");
				return false;
			}
			var telPattern = /^[0-9]{11}$/;
			var telTestResult = telPattern.test($("#tel").val());
			
			if(telTestResult!=true){
				alert("연락처는 '-'생략하고 입력해주세요.")
				return false;
			}
						
			
			//이메일 검사
			if($("#email").val()==""){
				alert("이메일은 필수 입력사항입니다..");
				return false;
			}
		
			var emailPattern = /^[A-Za-z0-9@.]{4,25}$/;
			var emailTestResult = emailPattern.test($("#email").val());
			if(emailTestResult != true){
				alert("이메일 주소는 4~25글자 내로 적어주세요");
				return false;
			}
		
					
			
			if($("#email").val()!=""){
				
				var url = "/myapp/mailFilter";
				var data = "email="+document.getElementById("email").value;
				
				$.ajax({
					url:url,
					data:data,
					success:function(result){
						
						if(result==""){
							
							$("#updateFrm").submit();
						}else{
							alert("이미 등록된 이메일 주소입니다.");
							
						}									
					},error:function(error){
						console.log("test에러잡기 5"+ error.responseText);
					}
				});				
			}						
							
			});		
	});	
	
	//유효성검사
	
	
		$("#updateAddr").click(function(){	//주소지정보수정 버튼 클릭 시 페이지 이동영역
			location.href="/addrEditForm";
		
			
			
		
	});
	
	}
</script>
<style>
	.row{text-align:center;}
	
	.inputbox{height:100%;}

	#addr1,#addr2{margin:0;height:40%;}
	#notice{line-height:80%;margin-top:20px;}
	#zipcode{width:449px;}
	#zipBtn{float:left;margin-right:10px;}
	#m_pic{width:230px;}
	
	
	
	.wBlank{margin-left:200px;}
	.hBlank{margin-top:50px;}
	.hBlank2{margin-top:30px;}
	
	
	.mb-3{width:65%;margin-left:170px;}
	.labelTag{text-align:right;}
	
	.wBlank2{margin-left:51px;}	/*7자*/
	.wBlank3{margin-left:35px;}	/*4자*/
	.wBlank4{margin-left:67px;}	/*4자*/
	.wBlank5{margin-left:200px;}

</style>
<br/>    
<div class="container">
<br/><br/>
	<h2 style="text-align:center;">회원정보수정</h2>
	<div class="hBlank"></div>
	
	
	<div id="notice">
		  <div class=wBlank>* 비밀번호 변경은 <a href="/myapp/find"><b style="color:#ee8374">아이디/비밀번호 찾기</b></a>를 통해 변경해주세요.</div><br/><br/>
		  <div class=wBlank>* 배송지 정보 수정은 아래 배송지 수정버튼을 눌러주세요.</div>
	</div>
	<br/><br/>
	
	<!-- 폼테그 시작 -->
	<form id="updateFrm" method="post" action="/myapp/updateOk" enctype="multipart/form-data">
		<div class="row">
			<div class="hBlank2"></div>
			
			<div class="col-12" style="border-bottom:1px solid #eee;margin-bottom:5px;"><h5 style="color:#ee8374">기본정보</h5></div>
		</div>	
		<br/>
	
		<!-- 기본정보 -->
		 <div class="mb-3 row">
		    <label class="labelTag" for="staticId" class="col-sm-2 col-form-label">아이디</label>
		   		<div class="wBlank2"></div>
		    <div class="col-sm-10">
		        <input id="staticEmail" type="text" readonly class="form-control-plaintext" value=<%=session.getAttribute("userid")%>>
		    </div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label class="labelTag" for="email" class="col-sm-2 col-form-label">이메일</label>
		    	<div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="email" name="email" value=<%=session.getAttribute("email")%>>
		    </div>
		  </div>
		   <div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">닉네임</label>
		    	 <div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="nickname" name="nickname" value=<%=session.getAttribute("nickname")%>>
		    </div>
		  </div>
		    <div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">연락처</label>
		    	 <div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="tel" name="tel" value=<%=session.getAttribute("tel")%>>
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label class="labelTag" for="profileimg" class="col-sm-2 col-form-label">프로필 이미지</label>
		    <div class="col-sm-10">
		      <input id="m_pic" type="file" class="form-control" value=<%=session.getAttribute("m_pic")%>><!-- name 추가후 작업 -->
		      <img id="preProfile" style="width:150px;height:150px" src="/myapp/resources/upload/register/<%=session.getAttribute("m_pic")%>"/>
		    </div>
		  </div>
		<!-- 박스종료 -->
		<br/>
		
		</form>
		
		
		
	
	
	
	
		<br/>
		<div class="row">
			<div class="col-4" style="text-align:right;">
				<button id="updateBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">수정</button>
			</div>
			
			
			<div class="col-4" style="text-align:center;">
				<a href="/myapp/addrEditForm" id="updateAddr" name="updateAddr" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">주소정보 수정</a>
			</div>
		</div>
	
		
		
				<button id="memoutBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">회원탈퇴</button>
			</div>
		</div>
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 회원탈퇴 Modal -->
	<div class="modal fade" id="secessionModal" tabindex="-1" role="dialog" aria-labelledby="secessionModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
	   		<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="secessionModalTitle">회원탈퇴</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      	<div class="modal-body">
          		<h5>회원 탈퇴 전에 아래 내용을 반드시 확인해 주세요.</h5>
          		<br/>
          		<div>
          			<h5><b>회원탈퇴 시 소비자 관련 정보 처리 내용</b></h5>
          			<ul>
          				<li>올홈즈 구매 정보가 삭제됩니다.</li>
          				<li>소비자보호에 관한 법률 제6조에 의거, 개인정보가 일정기간 보관됩니다.</li>
          				<li>법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</li>
          			</ul>
          			<h5><b>회원탈퇴 시 게시물 관리 내용</b></h5>
          			<ul>
          				<li>회원탈퇴 후 기존에 입력된 게시물 및 댓글은 삭제되지 않습니다.</li>
          				<li>회원탈퇴 후 기존 게시물 편집 및 삭제를 할 수 없습니다.</li>
          				<li>게시물 삭제 후 탈퇴를 신청하시기 바랍니다.</li>
          			</ul>
          			<br/>
          			<input type="checkbox"> 위 내용을 모두 확인하였습니다.<span style="font-color:pink;">(필수)</span>
          		</div>
				<div>
          			<br/>
          			<div>
          				<h5>allHomes를 탈퇴 사유 (복수선택 가능)</h5>
	          				<input type="checkbox"/>이용빈도 낮음<br/>
	          				<input type="checkbox"/>재가입<br/>
	          				<input type="checkbox"/>콘텐츠/제품정보/상품 부족<br/>
	          				<input type="checkbox"/>개인정보보호<br/>
	          				<input type="checkbox"/>기타<br/>
                    </div>
		   		</div>	
          	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        	<button type="button" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">탈퇴</button>
	      	</div>
	    	</div>
	  	</div>
	</div>		
</div>
<br/>