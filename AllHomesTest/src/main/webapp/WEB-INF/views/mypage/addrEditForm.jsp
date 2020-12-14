<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${logStatus == null || logStatus == 'N'}">
	<script>
		alert{"로그인 후 이동이 가능합니다."};
		location.href="/myapp/";
	</script>
</c:if>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>



<script>
	$(function(){
		$("#updateBtn").click(function(){
			$("#updateFrm").submit();
					
		});
	
		$("#membOutBtn").click(function(){//회원탈퇴 버튼 클릭 시
			
			
		});

		
		
		$("#zipcodeBtn").click(function(){//우번번호 버튼 클릭시 
				 daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수

			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }

			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("addr").value = extraAddr;
			                
			                } else {
			                    document.getElementById("addr").value = '';
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('zipcode').value = data.zonecode;
			                document.getElementById("addr").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("addrdetail").focus();
			            }
			            	
			            	
			            
			        }).open();
			    });
			
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
	#picBox{width:230px;}
	#zipcodeBtn{float:left;margin-right:5px;}
	
	
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
	<h2 style="text-align:center;">배송지정보 수정</h2>
	<div class="hBlank"></div>
	
	
	<div id="notice">
		  <div class=wBlank>* 비밀번호 변경은 <a href="/myapp/find"><b style="color:#ee8374">아이디/비밀번호 찾기</b></a>를 통해 변경해주세요.</div><br/><br/>
		  <div class=wBlank>* 기본정보 수정은 아래 기본정보 수정 버튼을 눌러주세요.</div><br/><br/>
		  <div class=wBlank>* 배송지정보 수정 시 입력하신 사항이 맞는지 다시 한번 확인해주세요.</div>
	</div>
	<br/><br/>
	
	<!-- 폼테그 시작 -->
	<form id="updateFrm" method="post" action="/myapp/addrUpdateOk" enctype="multipart/form-data">
		<div class="row">
			<div class="hBlank2"></div>
			
			<div class="col-12" style="border-bottom:1px solid #eee;margin-bottom:5px;"><h5 style="color:#ee8374">배송지정보</h5></div>
		</div>	
		<br/>
	
		<!-- 배송지정보 -->
	
		   <div class="mb-3 row">
		    <label class="labelTag" for="receiver" class="col-sm-2 col-form-label">실수령자</label>
		    	 <div class="wBlank3"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="receiver" name="receiver" placeholder="실수령자 성함" value="${receiver}">
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label class="labelTag" for="zipcode" class="col-sm-2 col-form-label">우편번호</label>
		    	 <div class="wBlank3"></div>
		    <div class="col-sm-10">
		   	  <input id="zipcodeBtn" type="button" value="우편번호 입력">
		      <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호 입력" readonly value="${zipcode}">
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label class="labelTag" for="tel" class="col-sm-2 col-form-label">연락처</label>
		    	 <div class="wBlank2"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="tel" name="tel" placeholder="연락처 입력" value="${tel}">
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label class="labelTag" for="addr" class="col-sm-2 col-form-label">주소</label>
		    	 <div class="wBlank4"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="주소입력" value="${addr}">
		    </div>
		  </div>
		   <div class="mb-3 row">
		    <label class="labelTag" for="addrdetail" class="col-sm-2 col-form-label">상세주소</label>
		    	 <div class="wBlank3"></div>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="addrdetail" name="addrdetail" placeholder="상세주소입력" value="${addrdetail}">
		    </div>
		  </div>
		
		<!-- 박스종료 -->
		
		<br/>
		
	</form>
			
	
		<div class="row">
			<div class="col-4" style="text-align:right;">
				<button id="updateBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">수정</button>
			</div>
			
			
				<div class="col-4" style="text-align:center;">
				<a href="/myapp/userEdit" id="updateId" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">기본정보 수정</a>
			</div>
		
			<div class="col-4" data-toggle="modal" data-target="#secessionModal" style="text-align:left;">
	
			
				<button id="memoutBtn" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">회원탈퇴</button>
			</div>
		</div>
	
	</div>
	<br/>
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	      <form id="memOutFrm" method="post" action="/myapp/outcheckpoint">	
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
          	
          			<input id="finalCheck" type="checkbox"> 위 내용을 모두 확인하였습니다.<span style="font-color:pink;">(필수)</span>
          		</div>
				<div>
          			<br/>
          			<div>
          				<h5>allHomes를 탈퇴 사유 (복수선택 가능)</h5>
	          				<input id="useless" type="checkbox"/>이용빈도 낮음<br/>
	          				<input id="rereg" type="checkbox"/>재가입<br/>
	          				<input id="conless" type="checkbox"/>콘텐츠/제품정보/상품 부족<br/>
	          				<input id="indi" type="checkbox"/>개인정보보호<br/>
	          				<input id="etc" type="checkbox"/>기타<br/>
                    </div>
		   		</div>	
          	</div>
         	
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        	<button id="membOutBtn" type="button" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">탈퇴</button>
	      	</div>
	       </form>	
	    	</div>
	  	</div>
	</div>		

<br/>