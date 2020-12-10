<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${logStatus == '' || logStatus == 'N'}">
	<script>
		alert{"로그인 후 이동이 가능합니다."};
		location.href="/myapp/";
	</script>
</c:if>

<script>
	$(function(){
		$("updateBtn").click(function(){
			
			
			
			
			$("updataFrm").submit();		
			
		});
	});

</script>
<style>
	.row{text-align:center;}
	
	
	
	.inputbox{height:100%;}

	#addr1,#addr2{margin:0;height:40%;}
	#notice{line-height:80%;margin-top:20px;}
	
	.wBlank{margin-left:200px;}
	.hBlank{margin-top:50px;}
	.hBlank2{margin-top:30px;}
	
	
	.mb-3{width:65%;margin-left:170px;}
	.labelTag{text-align:right;}
	
	.wBlank2{margin-left:51px;}	/*7자*/
	.wBlank3{margin-left:35px;}	/*4자*/
	.wBlank4{margin-left:67px;}	/*4자*/
	

</style>
<br/>    
<div class="container">
<br/><br/>
	<h2 style="text-align:center;">회원정보수정</h2>
	<div class="hBlank"></div>
	
	
	<div id="notice">
		  <div class=wBlank>* 비밀번호 변경은 <b style="color:#ee8374">아이디/비밀번호 찾기</b>를 통해 변경해주세요.</div><br/><br/>
		  <div class=wBlank>* 배송혼선을 막기위해 주소가 정확히 입력됐는지 다시 한번 확인해주세요.</div>
	</div>
	<br/><br/>
	
	<!-- 폼테그 시작 -->
	<form id="updataFrm" method="post" action="/myapp/updateOk" enctype="multipart/form-data">
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
		    <label class="labelTag" for="profileimg" class="col-sm-2 col-form-label">프로필 이미지</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="m_pic" name="m_pic" value=<%=session.getAttribute("m_pic")%>>
		    </div>
		  </div>
		<!-- 박스종료 -->
		<br/>
		
		
		
		
		<!-- 배송정보 -->
		<div class="row">
			<div class="col-12" style="border-bottom:1px solid #eee;margin-bottom:5px;"><h5 style="color:#ee8374">배송지정보</h5></div>
		</div>
		<br/>
					  
		<div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">받는분</label>
		    	 <div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="receiver" name="receiver" placeholder="실수령자 성함" value="${receiver}">
		    </div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">연락처</label>
		    	 <div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="tel" name="tel" placeholder="연락처" value="${tel}">
		    </div>
		  </div>
			
		 <div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label" >우편번호</label>
		    	<div class="wBlank3"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" value="${zipcode}">
		    </div>
		  </div>
		  
		  
		<div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">주소</label>
		    	 <div class="wBlank4"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="주소입력" value="${addr}">
		    </div>
		  </div>
		
		<div class="mb-3 row">
		    <label class="labelTag" for="nickname" class="col-sm-2 col-form-label">상세주소</label>
		    	 <div class="wBlank3"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="addrdetail" name="addrdetail" placeholder="상세주소 입력" value="${addrdetail}">
		    </div>
		  </div>
		
		</form>
	</div>

	
	<br/>
	<div class="row">
		<div class="col-6" style="text-align:right;">
			<button id="updateBtn"class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">수정</button>
		</div>
		
		
		<div class="col-6" data-toggle="modal" data-target="#secessionModal" style="text-align:left;">
			<button id="memoutBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">회원탈퇴</button>
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