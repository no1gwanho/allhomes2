<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>올홈즈 파트너십</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<style>
   #logo, h1{
      text-align:center;
   }
   #logo>img{
      width:100px;
      height:90px;
   }
   span{
      color:pink;
   }

   .col-12{
      margin-bottom:30px;
   }
</style>
</head>
<body>
<div class="container">
<<<<<<< HEAD
	<div id="logo">
		<img src="<%=request.getContextPath() %>/resources/img/allhomes3.png"/>
	</div>
	<h1>입점신청</h1>	
	<br/>
	<ul>
		<li>작성해주신 정보를 바탕으로 카테고리별 담당자가 입점을 검토하여 이메일을 보내드립니다.</li>
		<li>입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</li>
		<li>사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 sellers@allhomes.com으로 이메일을 보내주세요.</li>
		<li>입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능하오니 참고부탁드립니다.</li>
	</ul>
	<br/>
	<hr/>
	<br/>
	<form>
		<div class="row">
			<div class="col-12"><h4><b>회사 정보</b></h4></div>
			<div class="col-4" style="margin-bottom:15px;">회사 이름<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="올홈즈" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">사업자 등록번호<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="123-45-67890" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">홈페이지</div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="www.allhomes.com" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">올홈즈 아이디<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="allhomes1234" size="60"/></div>
		</div>
		<br/>
		<hr/>
		<br/>
		<div class="row">
			<div class="col-12"><h4><b>영업 담당자 정보</b></h4></div>
			<div class="col-4" style="margin-bottom:15px;">이름<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="올홈즈" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">전화번호<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="010-1234-5678" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">이메일<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="abcd@allhomes.com" size="60"/></div>		
		</div>
		<br/>
		<hr/>
		<br/>
		<div class="row">
			<div class="col-12"><h4><b>상품 정보</b></h4></div>
			<div class="col-4" style="margin-bottom:15px;">대표브랜드 이름<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="올홈즈 가구" size="60"/></div>
			<div class="col-4" style="margin-bottom:15px;">취급 카테고리<span>*</span></div>
			<div class="col-2" style="margin-bottom:15px;"><input type="checkbox"/>메인1</div>
			<div class="col-2" style="margin-bottom:15px;"><input type="checkbox"/>메인2</div>
			<div class="col-2" style="margin-bottom:15px;"><input type="checkbox"/>메인3</div>
			<div class="col-2" style="margin-bottom:15px;"><input type="checkbox"/>메인4</div>
			<div class="col-6" style="margin-bottom:15px; left:380px;"><input type="checkbox"/>메인5</div>
			<div class="col-6" style="margin-bottom:15px;"><input type="checkbox"/>메인6</div>
			<div class="col-4" style="margin-bottom:15px;">상품 소개<span>*</span></div>
			<div class="col-8" style="margin-bottom:15px;"><textarea name="" placeholder="판매하시는 상품에 대한 설명을 입력해주세요" style="width:700px;height:200px"></textarea></div>
			<div class="col-4" style="margin-bottom:15px;">판매 관련 파일 첨부</div>		
			<div class="col-8" style="margin-bottom:15px;">
				<input type="file" name=""/><br/>
				<p style="font-size:0.8em;color:#ccc">참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.<br/>
				첨부파일 관련 URL 주소가 있다면 상품 소개 입력창에 남겨주세요.</p>			
			</div>
		</div>
		<br/>
		<hr/>
		<br/>
		<div class="row">
			<div class="col-12">
				<h4><b>개인정보 수집 및 이용 동의</b></h4><br/>
				<p style="font-size:0.6em;">allhomes는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령상의 개인정보보호 규정을 준수하며, 판매자님이 입점신청 시 필요한 최소한의 개인 정보를 수집합니다.</p>
			</div>
			<br/>
			<div class="col-12" style="text-align:center;">
				<input style="font-size:1.2em;font-height:bold;" type="checkbox">&nbsp;&nbsp;입점신청을 위한 개인정보 수집 및 이용에 동의<span style="color:pink"><b>(필수)</b></span>
			</div>
			<button type="submit" class="btn btn-block" style="background-color:#ee8374;color:#fff;">입점 신청 완료</button>
		</div>		
	</form>	
=======
   <div id="logo">
      <img src="<%=request.getContextPath() %>/resources/img/allhomes3.png"/>
   </div>
   <h1>입점신청</h1>   
   <br/>
   <ul>
      <li>작성해주신 정보를 바탕으로 카테고리별 담당자가 입점을 검토하여 이메일을 보내드립니다.</li>
      <li>입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</li>
      <li>사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 sellers@allhomes.com으로 이메일을 보내주세요.</li>
      <li>입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능하오니 참고부탁드립니다.</li>
   </ul>
   <br/>
   <hr/>
   <br/>
   <form>
      <div class="row">
         <div class="col-12"><h4><b>회사 정보</b></h4></div>
         <div class="col-4" style="margin-bottom:15px;">회사 이름<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="s_name" placeholder="올홈즈" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">사업자 등록번호<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="s_num" placeholder="123-45-67890" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">홈페이지</div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="s_homepage" placeholder="www.allhomes.com" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">올홈즈 아이디<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="s_id" placeholder="allhomes1234" size="60"/></div>
      </div>
      <br/>
      <hr/>
      <br/>
      <div class="row">
         <div class="col-12"><h4><b>영업 담당자 정보</b></h4></div>
         <div class="col-4" style="margin-bottom:15px;">이름<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="staff_n" placeholder="올홈즈" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">전화번호<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="staff_t" placeholder="010-1234-5678" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">이메일<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="staff_e" placeholder="abcd@allhomes.com" size="60"/></div>      
      </div>
      <br/>
      <hr/>
      <br/>
      <div class="row">
         <div class="col-12"><h4><b>상품 정보</b></h4></div>
         <div class="col-4" style="margin-bottom:15px;">대표브랜드 이름<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><input type="text" name="" placeholder="올홈즈 가구" size="60"/></div>
         <div class="col-4" style="margin-bottom:15px;">취급 카테고리<span>*</span></div>
         <div class="col-2" style="margin-bottom:15px;"><input type="checkbox" name="main_c"/>메인1</div>
         <div class="col-2" style="margin-bottom:15px;"><input type="checkbox" name="main_c"/>메인2</div>
         <div class="col-2" style="margin-bottom:15px;"><input type="checkbox" name="main_c"/>메인3</div>
         <div class="col-2" style="margin-bottom:15px;"><input type="checkbox" name="main_c"/>메인4</div>
         <div class="col-6" style="margin-bottom:15px; left:380px;"><input type="checkbox" name="main_c"/>메인5</div>
         <div class="col-6" style="margin-bottom:15px;"><input type="checkbox" name="main_c"/>메인6</div>
         <div class="col-4" style="margin-bottom:15px;">상품 사진 첨부<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;">
         	<input type="file" name="main_img"/><br/>
         	<p style="font-size:0.8em;color:#ccc">상품 등록 시 썸네일 이미지로 사용됩니다.</p>
         </div>
         <div class="col-4" style="margin-bottom:15px;">상품 소개<span>*</span></div>
         <div class="col-8" style="margin-bottom:15px;"><textarea name="" placeholder="판매하시는 상품에 대한 설명을 입력해주세요" style="width:700px;height:200px"></textarea></div>
         <div class="col-4" style="margin-bottom:15px;">판매 관련 파일 첨부</div>      
         <div class="col-8" style="margin-bottom:15px;">
            <input type="file" name=""/><br/>
         	<p style="font-size:0.8em;color:#ccc">참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.<br/>
            	첨부파일 관련 URL 주소가 있다면 상품 소개 입력창에 남겨주세요.</p>         
         </div>         
      </div>
      <br/>
      <hr/>
      <br/>
      <div class="row">
         <div class="col-12">
            <h4><b>개인정보 수집 및 이용 동의</b></h4><br/>
            <p style="font-size:0.6em;">allhomes는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령상의 개인정보보호 규정을 준수하며, 판매자님이 입점신청 시 필요한 최소한의 개인 정보를 수집합니다.</p>
         </div>
         <br/>
         <div class="col-12" style="text-align:center;">
            <input style="font-size:1.2em;font-height:bold;" type="checkbox">&nbsp;&nbsp;입점신청을 위한 개인정보 수집 및 이용에 동의<span style="color:pink"><b>(필수)</b></span>
         </div>
         <button type="submit" class="btn btn-block" style="background-color:#ee8374;color:#fff;">입점 신청 완료</button>
      </div>      
   </form>   
>>>>>>> d2f79c89a5b3d1a5ae261b97e821e267b08a0d6b
</div>
<br/>
</body>
</html>