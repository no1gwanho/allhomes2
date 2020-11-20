<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>



<style>
	 #orderModal{
	            display: none;
	            width: 300px;
	            padding: 20px 60px;
	            background-color: #fefefe;
	            border: 1px solid #888;
                border-radius: 3px;
	 }
</style>
<script>
	$(function(){
		//상세조회 나타났다 사라졌다
		$("#searchDetail").click(function(){
			if($("#searchD").css("display")=="none"){
				$("#searchD").css("display", "block");
			}else{
				$("#searchD").css("display", "none");
			}
		});
		
		
		//datepicker
		$("#datePicker").datepicker({
			changeYear :true,
			changeMonth: true,
			constrainInput:true,
			dateFormat:"yy/mm/dd",
			dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearRange:"2019:2020"
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
	
	<!-- 주문 모달 -->
		<div id="orderModal">
			asdfadsf
			<a class="modal_close_btn">닫기</a>
		</div>
		<a class="btn" id="popup_open_btn">모달</a>
	<!-- 주문 모달 끝 -->
	
		<div class="col-lg-12">
			<!-- 검색 옵션 -->
			<a href="#" class="btn btn-light" style="color:#E98374;">                
                <span class="text">당일</span>
            </a>
			<a href="#" class="btn btn-light" style="color:#E98374;">                
                <span class="text">1개월</span>
            </a>
            <a href="#" class="btn btn-light" style="color:#E98374;">                
                <span class="text">3개월</span>
            </a>
            <a href="#" class="btn btn-light" id="searchDetail" style="background-color:#E98374; color:white">                
                <span class="text">상세조회</span>
            </a>
            
            <div class="my-2"></div>
            
            <!-- 상세조회 누르면 나오는 거 -->
            <div class="card shadow" id="searchD" style="display:none">
            	<div class="card-body" style="text-align:center">
            		<br/>
	            	<div style="display:inline-block">
		            	<form>
		            		<input id="datePicker" type="text" class="form-control"/> ~ <input id="datePicker" type="text" class="form-control"/>
		            	
			            	<a href="#" class="btn btn-light" style="background-color:#E98374; color:white">                
			                	<span class="text">검색</span>
			           		</a>
		            	</form>
	           		</div>
            	</div>
            </div><!-- 상세조회 끝 -->
            
            
            <div class="my-2"></div>
            
            <!-- 테이블 -->
            <div class="card shadow mb-4">
            	<div class="card-body" style="text-align:center">
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
						<tr>
							<th>주문번호</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>스토어명</th>
							<th>우편번호</th>
							<th>배송지</th>
							<th>주문자ID</th>
							<th>구매일</th>
							<th>상태</th>
						</tr>
						</thead>
						<tbody>
						<tr onClick="location.href=''">
							<td>1425123</td>
							<td>35234</td>
							<td>체크무늬 빈티지 커튼</td>
							<td>자연가구</td>
							<td>52491</td>
							<td class="wordCut">서울시 마포구 노고산동 어쩌구...</td>
							<td>seran22</td>
							<td>2020-11-13</td>
							<td>구매확정</td>
						</tr>
						<tr onClick="location.href=''">
							<td>1425123</td>
							<td>35234</td>
							<td>체크무늬 빈티지 커튼</td>
							<td>자연가구</td>
							<td>52491</td>
							<td class="wordCut">서울시 마포구 노고산동 어쩌구...</td>
							<td>seran22</td>
							<td>2020-11-13</td>
							<td>구매확정</td>
						</tr>
						<tr onClick="location.href=''">
							<td>1425123</td>
							<td>35234</td>
							<td>체크무늬 빈티지 커튼</td>
							<td>자연가구</td>
							<td>52491</td>
							<td class="wordCut">서울시 마포구 노고산동 어쩌구...</td>
							<td>seran22</td>
							<td>2020-11-13</td>
							<td>구매확정</td>
						</tr>
						<tr onClick="location.href=''">
							<td>1425123</td>
							<td>35234</td>
							<td>체크무늬 빈티지 커튼</td>
							<td>자연가구</td>
							<td>52491</td>
							<td class="wordCut">서울시 마포구 노고산동 어쩌구...</td>
							<td>seran22</td>
							<td>2020-11-13</td>
							<td>구매확정</td>
						</tr>
						<tr onClick="location.href=''">
							<td>1425123</td>
							<td>35234</td>
							<td>체크무늬 빈티지 커튼</td>
							<td>자연가구</td>
							<td>52491</td>
							<td class="wordCut">서울시 마포구 노고산동 어쩌구...</td>
							<td>seran22</td>
							<td>2020-11-13</td>
							<td>구매확정</td>
						</tr>
						</tbody>	
					</table>
					
					<!-- pagination -->
					<div style="display:inline-block">
						<ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">4</a></li>
						    <li class="page-item"><a class="page-link" href="#">5</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
					<!-- pagination 끝 -->
					
				</div><!-- card-body 끝 -->
			</div><!-- card 끝 -->
		</div><!-- col-lg-12 끝 -->
	</div>
</div>

<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>