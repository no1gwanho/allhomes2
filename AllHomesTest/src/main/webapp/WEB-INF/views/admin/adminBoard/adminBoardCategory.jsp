<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		
		//카테고리 추가
		$("#addTheme").click(function(){
			if($("#theme").val()==""){
				alert("카테고리명을 입력해주십시오.");
				return false;
			}
		}); 
		
		//카테고리 수정
		/*  $(".editTheme").click(function(){
			if(("#theme").val()==""){
				alert("카테고리명을 입력해주십시오.");
				return false;
			}
		});  유효성 검사 x 바꿔야됨*/
		
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">집들이 게시판 카테고리</h6>
				</div>
				
				<style>
					td{height:40px;line-height:40px;}
				
				</style>
				<!-- card body -->
				<div class="card-body">
					<table style="cursor:pointer;" class="table table-hover">
						<thead>
						<tr>
							<th>카테고리명</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						
						<c:forEach var="vo" items="${list}">
						<form method="post" action="/myapp/homeBoardThemeEdit">
						<tr>
							<input type="hidden" name="no" value="${vo.hb_theme_no}"/>
							<td>
								<input type="text" class="form-control" id="theme" name="theme" value="${vo.theme}"/>
							</td>
							<td>
								<div style="float:right">
									<button class="btn alert-secondary editTheme">수정</button>
									<a href="/myapp/homeBoardThemeDel?no=${vo.hb_theme_no}" class="btn alert-danger">삭제</a>
								</div>
							</td>
						</tr>
						</form>
						</c:forEach>
						
						<!-- 카테고리 추가 form -->
						<tr>
							<form method="post" action="/myapp/homeBoardThemeAdd">
							<td>
								<input type="text" class="form-control" id="theme" name="theme"/>
							</td>
							<td>
								<div style="float:right">
									<button id="addTheme" class="btn btn-user alert-primary">추가</button>
								</div>
							</td>
							</form>
						</tr>
						</tbody>	
					</table>
				</div>
			</div><!-- card 끝 -->
		</div><!-- col-lg-12 끝 -->
	</div>
</div>


