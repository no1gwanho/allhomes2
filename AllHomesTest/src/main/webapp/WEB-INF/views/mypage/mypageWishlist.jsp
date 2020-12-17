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
	<c:if test="${empty list }">
		<div style="margin:50px auto;height:800px;">
			<span style="font-size:1.2em;color:#1f1f1f;text-align:center;">아직 등록된 위시리스트가 없습니다.</span>
		</div>
	</c:if>
	<div class="row">
		<div class="col-lg-12" style="text-align:left;">
			<br/><br/>
			<img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist.png" style="width:40px;float:left;"/>
			<h4 style="width:30%;float:left;height:40px;line-height:40px;">&nbsp;&nbsp;위시리스트</h4>
			<br/><br/><hr><br/>
		</div><br/>
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
	</div>
	<div id="paging" style="margin-top:30px;">
		<ul class="pagination" style="margin-left:470px;">
			<li class="page-item">
				<c:if test="${pageVO.nowPage==1 }">
					<a class="page-link">Prev</a>
				</c:if>
				<c:if test="${pageVO.nowPage>1}">
					<a class="page-link" href="/myapp/mypageWishlist?nowPage=${pageVO.nowPage-1}">Prev</a>
				</c:if>
			</li>
			<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageRecord-1}">
				<c:if test="${p<=pageVO.totalPage}">	
					<li class="page-item">
						<c:if test="${p==pageVO.nowPage}"></c:if>
						<a class="page-link" href="/myapp/mypageWishlist?nowPage=${p}">${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<li class="page-item">
				<c:if test="${pageVO.nowPage==pageVO.totalPage }">
					<a class="page-link">Next</a>
				</c:if>
				<c:if test="${pageVO.nowPage<pageVO.totalPage}">
					<a class="page-link" href="/myapp/mypageWishlist?nowPage=${pageVO.nowPage+1}">Next</a>
				</c:if>
			</li>
		</ul>
	</div>
</div>