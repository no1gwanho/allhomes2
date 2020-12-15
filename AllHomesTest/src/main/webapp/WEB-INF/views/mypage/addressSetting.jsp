<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.col-3, .col-lg-3, .col-xs-6{
			text-align:center;
			margin-bottom:10px;
	}
	
	.container{
		max-width:1400px;
		margin: 0 auto;
		font-family: 'SCDream3';
	}
	
	#mypage-title {
		margin-top: 40px;
		margin-bottom: 15px;
		margin-left:20px;
		font-family:'SCDream5'
	}
	.profile-img{
		width:200px;
		height:200px;
		
		
		
	}
	
	.profile-img>img{
		width:200px;
		height:200px;
		border-radius: 50%;
		border: 0.5px solid #8f8d8d;
		
	}
	
	.profile-img{
		margin: 0 auto;
	}
</style>
<script>
    function sample6_execDaumPostcode() {
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
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
	function addrInsertSubmit(){
		
		if($("#receiverAdd").val()==""){
			alert("수신자를 입력해주십시오.");
			return false;
		}else if($("#sample6_postcode").val()==""){
			alert("우편번호를 입력해주십시오.");
			return false;
		}else if($("#sample6_address").val()==""){
			alert("주소를 입력해주십시오.");
			return false;
		}else if($("#sample6_detailAddress").val()==""){
			alert("상세주소를 입력해주십시오.");
			return false;
		}else if($("#telAdd").val()==""){
			alert("연락처를 입력해주십시오.");
			return false;
		}
	}
</script>
<div class="container">
	<h3 id="mypage-title">배송지 설정</h3>
	
	<div class="row">
		
		<div class="card col-3 mypage-profile"><br/>
			<!-- 프로필이미지 -->
			<div class="profile-img" style="text-align:center;">
				<img src="<%=request.getContextPath()%>/resources/upload/register/${rVO.m_pic}">
			</div><br/>
			<!-- 닉네임 -->
			<h4 style="font-family:SCDream5;">${rVO.nickname}</h4>
			<a href="/myapp/mypageEdit" class="btn btn-user alert-clean" style="float:right;color:gray">회원정보수정</a>
			<hr>
			<div class="row">
			<!-- 위시리스트 바로가기버튼-->
			<div class="col-2"></div>
			<div class="col-4">
				<a href="/myapp/mypageWishlist?userid=${vo.userid }">
					<img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist2.png" style="width:60px"/><br/>
					위시리스트
				</a>
			</div>
			<!-- 스크랩 바로가기버튼 -->
			<div class="col-4">
			<a href="/myapp/mypageScrap">
			<img src="<%=request.getContextPath()%>/resources/img/mypage/scrap2.png" style="width:60px"/><br/>
			스크랩</a>
			</div>
			<div class="col-2"></div>
			</div>
			
			<hr>
		</div><!-- mypage 프로필부분 끝 -->
		
		
		
		<div class="col-lg-9"><br/>
			<div class="card card border-light mb-3">
				<div class="card-header">
					나의 배송지
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					<c:forEach var="vo" items="${aList}">
						<form method="post" action="<%=request.getContextPath()%>/addressEdit?a_code=${vo.a_code}">
							
								<div class="row">
									<input type="hidden" name="a_code" value="${vo.a_code}"/>
									<input type="hidden" name="m_no" value="${vo.m_no}"/>
									<div class="col-lg-3 mb-3 mt-3">수신자</div>
									<input class="col-lg-5  mb-3 mt-3 form-control" name="receiver" value="${vo.receiver}"/>
								</div>
								
								<div class="row">
									<div class="col-lg-3 mb-3">우편번호</div>
									<input class="col-lg-5 mr-3 mb-3 form-control" type="text" 
									name="zipcode" id="sample6_postcode" value="${vo.zipcode}">
									<input  class="col-lg-2 mb-3 form-control btn-secondary" type="button"
									 onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								
								<div class="row">
									<div class="col-lg-3 mb-3">주소</div>
									<input class="col-lg-8 mb-3 form-control" name="addr" value="${vo.addr}"/>
								</div>
								
								<div class="row">
									<div class="col-lg-3 mb-3">상세 주소</div>
									<input class="col-lg-8 mb-3 form-control" name="addrdetail" value="${vo.addrdetail}"/>
								</div>
								
								<div class="row">
									<div class="col-lg-3 mb-3">연락처</div>
									<input class="col-lg-8 mb-3 form-control" name="tel" value="${vo.tel}"/><br/>
								</div>
								
								<div style="text-align:center">
									<button type="submit"  class="btn btn-light shadow-sm mr-3">수정</button>
									<a href="<%=request.getContextPath() %>/addressDel?a_code=${vo.a_code}"
										class="btn btn-light shadow-sm">삭제</a>
								</div>
							
						</form>
						<hr/>
					</c:forEach>
				
					
				</div>
			</div>
			
			<br/>
			<br/>
			
			<div class="card card border-light mb-3">
				<div class="card-header">
					배송지 추가
				</div>
				
				<div class="card-body"><!-- card-body 시작 -->
					
					<!-- 배송지 추가 form -->
					<form id="addrInsertForm" method="post" onsubmit="return addrInsertSubmit();" action="<%=request.getContextPath()%>/addressInsert">
						<div class="row">
							<input type="hidden" name="m_no" value="${m_no}"/>
							<div class="col-lg-3 mb-3 mt-3">수신자</div>
							<input class="col-lg-5  mb-3 mt-3 form-control" name="receiver" id="receiverAdd"/><br/>
						</div>
						
						<div class="row">
							<div class="col-lg-3 mb-3">우편번호</div>
							<input class="col-lg-5 mr-3 mb-3 form-control" type="text" 
							name="zipcode" id="sample6_postcode" placeholder="우편번호">
							<input  class="col-lg-2 mb-3 form-control btn-secondary" type="button"
								 onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						
						<div class="row">
							<div class="col-lg-3 mb-3">주소</div>
							<input  class="col-lg-8  mb-3 form-control"  type="text" 
							name="addr" id="sample6_address"><br>
							<div class="col-lg-3 mb-3">상세 주소</div>
							<input  class="col-lg-8  mb-3 form-control"  type="text"
							name="addrdetail" id="sample6_detailAddress">
						</div>
						
						<div class="row">
							<div class="col-lg-3 mb-3">연락처</div>
							<input class="col-lg-8 mb-3 form-control" name="tel" id="telAdd"/><br/>
						</div><br/>
						
						<div style="text-align:center">
						<button type="submit" class="btn col-lg-2 btn-primary form-control">추가</button>
						</div>
					</form>
					
				</div>
			</div>
			
		</div><!-- col-lg-8끝 -->		
	</div>
</div>