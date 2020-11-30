<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	#dialogOpen, #schedule{font-size:2em; text-align:center; background-color:pink}
	#schedule{background-color:lightblue;}
	img{width:100%;}
	h1{text-align:center;}
</style>

<script>
	$(function(){
		//다이얼로그 열기
		$("#dialogOpen").click(function(){
			$("#dialog").dialog('open'); //다이얼로그 창 열기
			$(".ul-widget-overlay").css({opacity:0.3, backgroundColor:'gray'});
		});
	
		//다이얼로그 설정
		$("#dialog").dialog({
			autoOpen:false //시작하면 자동으로 dialog 열리기 설정(true,false)
			
			,modal:true//true, false(기본)
		
		});
		//DatePicker설정
		$("#event-date").datepicker({
			dateFormat: 'yy년 mm월 dd일'
			,numberOfMonths:3 //한번에 보여지는 달력의 개월 수 /2하면 2개월치달력이 보여짐
		});
	});
</script>

<div id="dialogOpen">일정등록</div>
<hr/>
<div id="schedule"></div>
<!-- 다이얼로그 내용 -->

<div id="dialog" title="스케쥴 등록"> <!-- title속성의 값이 dialog창의 제목으로 설정된다. -->
<h1>일정을 등록하세요.</h1>
<label for="event-name">일정제목 : </label><input type="text" id="event-name"/><br/> 
<label for="event-date">날짜선택 : </label><input type="text" id="event-date"/> 
</div>

<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>