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
		$("updateBtn").click(function(){
						
			$("updateFrm").submit();		
			
		});
	});
	
	
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
		  <div class=wBlank>* 비밀번호 변경은 <b style="color:#ee8374">아이디/비밀번호 찾기</b>를 통해 변경해주세요.</div><br/><br/>
		  <div class=wBlank>* 입력하신 정보가 맞는지 입력 후 다시 한번 확인해 주세요.</div>
	</div>
	<br/><br/>
	
	<!-- 폼테그 시작 -->
	<form id="updateFrm" method="post" action="/myapp/updateOk" enctype="multipart/form-data">
		<div class="row">
			<div class="hBlank2"></div>
		</div>	
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
		      <input type="button" id="zipBtn" value="우편번호검색">
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
	
	
	
	
		<br/>
		
<div class="row">
			<div class="col-6" style="text-align:right;">
				<button id="updateBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">수정</button>
			</div>
			
			
			<div class="col-6" data-toggle="modal" data-target="#secessionModal" style="text-align:left;">
				<button id="memoutBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">회원탈퇴</button>
			</div>
		</div>
	
		
		</form>
	</div>
	
	
	
			

