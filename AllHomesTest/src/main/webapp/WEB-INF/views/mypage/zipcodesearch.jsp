<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script>
<script>
	$(function(){
		//서버에서 비동기식으로 주소 목록 가져오기
		$("#zipFrm").submit(function(){
			if($("#doro").val()==""){//도로명을 입력하지 않은경우
				alert("도로명입력후 다시 검색하기");
			}else{//도로명이 있을때
				var url = "<%=request.getContextPath()%>/register/zipSearchAjax.do";
				//form의 필드 name과 값을 직렬화시키기
				
				var params = "doro="+$("#doro").val();	//doro=백범로22길
				var params = $("#zipFrm").serialize();	//doro=백범로22길
				$.ajax({
					url:url,										//: 좌측에 있는 url은 ajax의 변수임
					data:params,
					success:function(result){		//zipcodeViewAjax.jsp에서 담은 resul가 여기에 담겼음
						$("#zipList").html(result);
					console.log(result);
					},error:function(){
						console.log("검색실패...");
					}
				});
			}
			return false;
		});
		//우편번호와 주소를 회원등록폼으로 셋팅하는
		$(document).on('click','#zipList>li',function(){
			var zipcode = $(this).children(".zip").text();
			var address = $(this).children(".addr").text();
			
			opener.document.getElementById("zipcode").value= zipcode;
			opener.document.getElementById("addr").value = address;
			
			window.close();//팝업창 닫기 self.close(); 
		});
	});

</script>
</head>
<body>
<form method="post" id="zipFrm">
	도로명을 입력후 주소를 검색하세요...<br/>
	(예:백범로22길)<br/>
	<input type="text" name="doro" id="doro" placeholder="백범로22길"/>
	<input type="submit" value="주소검색하기"/>
</form>
<hr/>
<ul id="zipList"></ul>
</body>
</html>>