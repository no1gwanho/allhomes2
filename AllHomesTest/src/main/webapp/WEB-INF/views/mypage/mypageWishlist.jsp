<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.col-3 {
	text-align:center;
	margin-bottom:10px;
	}
	.storeImg img {
		width:350px;
		height:260px;
		border-radius: 5%;
		text-align: center;
	}
	.col-lg-12{
		margin:0 auto;
	}
	.wishlist-title{
		font-family:'SCDream5';
		margin: 50px auto 50px auto;
		text-align:center;
	}
	
	.scrap-owner-info{
	text-align:center;
	}
	.profile_pic{
		width:30px;
		height:30px;
		border-radius: 45%;
		text-align:center;
		
	}
	
</style>
<script>
	$(function() {
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
	
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		$("#delBtn").click(function(){
			var confirm_val = confirm("위시리스트를 삭제하시겠습니까?");
			if(confirm_val){
				var chkList="";
				
				$("input[class='chBox']:checked").each(function(i){
					if(i>0){
						chkList += ",";
					}
					chkList += $(this).val();
				});
				
				location.href='<%=request.getContextPath() %>/wishDel?pd_no='+chkList;
			}
		})
	})
</script>
<div class="container">
	<h3 class="wishlist-title">위시리스트</h3>
	
	<div class="scrap-owner-info">
	<img class="profile_pic" src="<%=request.getContextPath()%>/resources/upload/register/${m_pic}"/>
	${nickname } 
	</div>
	<br/><br/>
	<hr/>

	<div class="row">
	
	<c:if test="${empty list }">
		<div style="margin:50px auto;height:400px;">
			<span style="font-size:1.2em;color:#1f1f1f;text-align:center;">아직 등록된 위시리스트가 없습니다.</span>
		</div>
	</c:if>
	<c:if test="${!empty list }">
		
		<div class="col-2"><input type ="checkbox" name="allCheck" id="allCheck" style="background-color:#ee8374;margin-right:10px;"/><label for = "allCheck">모두 선택</label>
		</div>
		<div class="col-10" style="text-align:right;">
			<button class="btn btn-secondary" id="delBtn">삭제</button>
		</div>
		<div class="col-12"><hr/></div>
		<c:forEach var="v" items="${list }">
		<div class="col-4 storeImg" style="margin-bottom:5px;">		
			<input type="checkbox" name="chBox" class="chBox" value=${v.pd_no } style="text-align:left;"/><br/>
			<a href="/myapp/storeDetail?pd_no=${v.pd_no }">
				<img src="<%=request.getContextPath() %>/resources/upload/productMainImg/${v.s_no}/${v.main_img }"/><br/>
				<span style="font-size:0.8em;">${v.pd_name }</span>
   			</a>
		</div>	
		</c:forEach>
	</c:if>
	</div>
	
	<c:if test="${!empty list }">
	<div id="paging" style="margin-top:30px;">
		<ul class="pagination" style="margin-left:470px;">
			<li class="page-item">
				<c:if test="${pageVO.nowPage==1 }">
					<a class="page-link">Prev</a>
				</c:if>
				<c:if test="${pageVO.nowPage>1}">
					<a class="page-link" href="/myapp/mypageShopping?nowPage=${pageVO.nowPage-1}">Prev</a>
				</c:if>
			</li>
			<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageRecord-1}">
				<c:if test="${p <= pageVO.totalPage}">	
					<li class="page-item">
						<c:if test="${p == pageVO.nowPage}"></c:if>
						<a class="page-link" href="/myapp/mypageShopping?nowPage=${p}">${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<li class="page-item">
				<c:if test="${pageVO.nowPage == pageVO.totalPage }">
					<a class="page-link">Next</a>
				</c:if>
				<c:if test="${pageVO.nowPage < pageVO.totalPage}">
					<a class="page-link" href="/myapp/mypageShopping?nowPage=${pageVO.nowPage+1}">Next</a>
				</c:if>
			</li>
		</ul>
	</div>
	</c:if>
</div>