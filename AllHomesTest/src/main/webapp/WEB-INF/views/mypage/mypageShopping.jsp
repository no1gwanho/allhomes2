<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#myShopping{
		text-align:center;
		margin-top:40px;
		height:200px;
	}
	#state{
		float:left;
		background-color: #eeee;
		width:14%;
		margin:5px;
		display:inline-block;
		vertical-align:middle;

	}
	#myShopping hr{
		width:70%;
	}
	
	#searchDetail input{
		margin-right:10px;
	}
	#searchDetail input{
		margin-right:10px;
	}
	
</style>
<script>
	$(function(){
		$("#searchFrm").click(function(){
			$("#searchDetail").css("display","block");
		});
	});
	
</script>


<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div id="myShopping">
				<div id="state"><br/>입금 대기<hr>0건<br/><br/></div>
				<div id="state"><br/>결제완료<hr>0건<br/><br/></div>
				<div id="state"><br/>배송준비<hr>0건<br/><br/></div>
				<div id="state"><br/>배송중<hr>0건<br/><br/></div>
				<div id="state"><br/>배송완료<hr>0건<br/><br/></div>
				<div id="state"><br/>구매확정<hr>0건<br/><br/></div>
			</div>
		
		<div>
			<a href="" class="btn btn-secondary">
           		<span class="text">1개월</span>
       		</a>
       		<a href="" class="btn btn-secondary">
           		<span class="text">3개월</span>
       		</a>
       		<a href="" class="btn btn-secondary">
           		<span class="text">6개월</span>
       		</a>
       		&nbsp;&nbsp;&nbsp;
       		<a href="" class="btn" style="background-color:#EE8374;color:white"  id="searchFrm">
           		<span class="text">상세조회</span>
       		</a>
       		
       		
			<form id="searchDetail" class="form-inline" style="display:none">
				<br/><br/><br/>
				<div class="form-group">
					<input class="form-control" type="text" placeholder="YYYY-MM-DD">-&nbsp;<input  class="form-control" type="text" placeholder="YYYY-MM-DD">
				</div>
				
				<select class="form-control">
					<option selected>전체</option>
					<option>입금대기</option>
					<option>결제완료</option>
					<option>배송준비</option>
					<option>배송중</option>
					<option>배송완료</option>
					<option>구매확정</option>
				</select>
				<input class="form-control" type="submit" value="검색" style="background-color:#EE8374;color:white;margin-left:10px;"/>
			</form>
		</div>
		</div><!-- col-lg-12 끝 -->
	</div>
	<br/>
	<form method="post" action="/myapp/setInPurchase">
	<c:forEach var="vo" items="${vo}">
		<div id="list1">
			<div class="row">
				<div class="col-lg-3">		
					주문번호 : ${vo.pc_no }
				</div>
				<div class="col-lg-9">
					주문일자: ${vo.pc_date }
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-2"><input type="checkbox"/>&nbsp;<img style="width:150px; height:125px;" src="<%=request.getContextPath()%>/resources/img/pd/tb01.png"/></div>
				<div class="col-md-4">
					<b style="font-size:1.5em;">${vo.pd_no }</b><br/>
					<b>결제금액 : ${vo.total_p }</b>
				</div>
				<div class="col-md-2">
					옵션 : ${vo.o_no} /  수량 : ${vo.num }
				</div>
				<c:if test="${vo.confirm!=Y }">
					<div class="col-md-2">
						<a href="#">업체명 : ${vo.s_no }</a><br/>
						<a href="#">문의하기</a>
					</div>
					<div class="col-md-2">
						<a href="/myapp/order"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">취소/교환</button></a>
						<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">배송추적</button>
						<input type="submit" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;" value="구매확정"/>
					</div>
				</c:if>
				<c:if test="${vo.confirm==Y}">
					<div class="col-md-2">
						<a href="#">업체명 : ${vo.s_no }</a><br/>
					</div>
					<div class="col-md-2">
						<button class="btn btn" data-toggle="modal" data-target="#reviewModal" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">리뷰쓰기</button>
						<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">재구매하기</button>
					</div>
				</c:if>
			</div>
		</div>		
	</c:forEach>
	</form><%--  
	<div id="list1">
		<div class="row">
			<div class="col-lg-3">
				주문번호 : 3493284032
			</div>
			<div class="col-lg-9">
				주문일자:2020-10-10
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2"><input type="checkbox"/>&nbsp;<img style="width:150px; height:125px;" src="<%=request.getContextPath()%>/resources/img/pd/tb01.png"/></div>
			<div class="col-md-4">
				<b style="font-size:1.5em;">상품명</b><br/>
				<b>결제금액&nbsp;&nbsp;125,800</b>
			</div>
			<div class="col-md-2">
				옵션 / 수량
			</div>
			<div class="col-md-2">
				<a href="#">업체명</a><br/>
				<a href="#">문의하기</a>
			</div>
			<div class="col-md-2">
				<a href="/myapp/order"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">취소/교환</button></a>
				<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">배송추적</button>
				<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">구매확정</button>
			</div>
		</div>
	</div>		
	<br/>
	<div id="list1">
		<div class="row">
			<div class="col-lg-3">
				주문번호 : 3493284032
			</div>
			<div class="col-lg-9">
				주문일자:2020-10-10
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2"><input type="checkbox"/>&nbsp;<img style="width:150px; height:125px;" src="<%=request.getContextPath()%>/resources/img/pd/tb01.png"/></div>
			<div class="col-md-4">
				<b style="font-size:1.5em;">상품명</b><br/>
				<b>결제금액&nbsp;&nbsp;125,800</b>
			</div>
			<div class="col-md-2">
				옵션 / 수량
			</div>
			<div class="col-md-2">
				<a href="#">업체명</a><br/>
			</div>
			<div class="col-md-2">
				<button class="btn btn" data-toggle="modal" data-target="#reviewModal" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">리뷰쓰기</button>
				<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">재구매하기</button>
			</div>
		</div>
	</div> --%>
</div>
<!-- 리뷰 내용 -->
<form>
	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content contentSize">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reviewModalTitle">리뷰쓰기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
        	<div>
        		<img src="${pageContext.request.contextPath}/resources/img/pd/pd01.jpg" style="width:30%"/>
        	</div>
        	<div>
        		구매일 : 2020-10-10<br/>
        		회사명 : All Homes Corea<br/>
        		제품명 : 미니 홈바 테이블<br/>
        		옵션명 : Basic(기본옵션)<br/>
        		수량 : 1개
        	</div>
        	<br/>
        	<div>
        		상품평가
        	</div>
        	<div>
        		<label>
		        	가격
        			<select>
        				<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
        			</select>
        		</label>
        		<label>
        			배송
        			<select>
        				<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
        			</select>
        		</label>
        		<label>
        			디자인
        			<select>
        				<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
        			</select>
        		</label>	        			        			        			        			        		
        		<label>
        			내구성
        			<select>
        				<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
        			</select>
        		</label>
       		</div>
       		<br/>
        	<div>
        		<h6>사진첨부(최대 1장)</h6>
				<input type="file" name="img">
        	</div>
        	<br/>
        	<textarea placeholder="내용을 입력하세요." style="width:450px;height:150px;"></textarea>
          </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">등록</button>
	      </div>
	    </div>
	  </div>
	</div>	
</form>
<br/>