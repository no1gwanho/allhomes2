<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.row{
		text-align:center;

	}
	.col-3{
		text-align:right;
		margin-bottom:5px;
		
	}
	.col-9{
		text-align:left;
		margin-bottom:5px;
		
	}
	.inputbox{height:80%;}

	#addr1,#addr2{margin:0;height:40%;}
	#notice{line-height:80%;margin-top:20px;}
	
	.wBlank{margin-left:200px;}
	.hBlank{margin-top:50px;}
	.hBlank2{margin-top:30px;}
	
</style>
<br/>    
<div class="container">
	<h2 style="text-align:center;">회원정보수정</h2>
	<div class="hBlank"></div>
	
	
	<div id="notice">
		  <div class=wBlank>* 비밀번호 변경은 <b style="color:#ee8374">아이디/비밀번호 찾기</b>를 통해 변경해주세요.</div><br/><br/>
		  <div class=wBlank>* 배송혼선을 막기위해 주소가 정확히 입력됐는지 다시 한번 확인해주세요.</div>
	</div>
	
	
	<!-- 폼테그 시작 -->
	<form>
		<div class="row">
			<div class="hBlank2"></div>
			<div class="col-12" style="border-bottom:1px solid #eee;margin-bottom:5px;"><h5 style="color:#ee8374">기본정보</h5></div>
		</div>		
    	<div class="row">
    		<div class="col-3">아이디</div>
	        <div class="col-9"><input class="inputbox" type="text" name="userid" value=<%=session.getAttribute("userid")%> size=80 disabled/></div>
	       	<div class="col-3">비밀번호</div> 
	      	<div class="col-9"><input class="inputbox" type="text" name="userpwd" value="비밀번호 변경은 " size=80 disabled/></div> 
	      	<div class="col-3">이메일</div>
	      	<div class="col-9"><input class="inputbox" type="text" name="email" size=80 value="abcd@naver.com"/></div> 
	      	<div class="col-3">닉네임</div> 
	      	<div class="col-9"><input class="inputbox" type="text" name="nickname" size=80 value="올홈즈화이팅"/></div> 
	      	<div class="col-3">프로필 이미지</div> 
	      	<div class="col-9"><input class="inputbox" type="text" name="nickname" size=80 value="프로필 이미지 박스"/></div> 
	      	
	      	
		</div>
		<br/>
		<div class="row">
			<div class="col-12" style="border-bottom:1px solid #eee;margin-bottom:5px;"><h5 style="color:#ee8374">배송지정보</h5></div>
		</div>
		<div class="row">
			<div class="col-3">배송지명</div> 
			<div class="col-9"><input class="inputbox" type="text" name="" size=80 value="우리집"/></div>       		
      		<div class="col-3">받는분</div> 
      		<div class="col-9"><input class="inputbox" type="text" name="username" size=80 value="최은빈"/></div> 
      		<div class="col-3">우편번호</div> 
      		<div class="col-9"><input class="inputbox" type="text" name="a_code" size=80 value="10254"/></div> 
      		<div class="col-3">주소</div> 
      		<div class="col-9"><input id="addr1" class="inputbox" style="margin-bottom:5px;" type="text" name="addr" size=80 value="경기도 고양시 일산동구 지영로229번길"/>
      						   <input id="addr2" class="inputbox" type="text" name="addrdetail" size=80 value="7-16 고개 아래 우측 첫집"/></div>
		
		</div>
	</form>
	<br/>
	<div class="row">
		<div class="col-6" style="text-align:right;"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">수정</button></div>
		<div class="col-6" data-toggle="modal" data-target="#secessionModal" style="text-align:left;"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">회원탈퇴</button></div>
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