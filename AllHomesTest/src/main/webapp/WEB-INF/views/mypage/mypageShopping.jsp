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
	<c:forEach var="p" items="${list }">
		<div class="row">
			<div class="col-3" style="margin-bottom:15px;border-bottom:1px solid #ddd;padding:5px;">
				주문번호 : ${p.pc_no }
			</div>
			<div class="col-9" style="margin-bottom:15px;border-bottom:1px solid #ddd;padding:5px;text-align:right;">
				주문일자 : ${p.pc_date }
			</div>
		</div>
		<div class="row" style="margin-bottom:35px;">
			<div class="col-3" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
				<input type="checkbox"/>
				<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><img src="<%=request.getContextPath()%>/resources/upload/productMainImg/${p.s_no}/${p.main_img}" style="border-radius:5%;width:180px;height:100px;margin-right:10px;margin-bottom:10px;"/></a>
			</div>
			<div class="col-5" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
				<b style="padding-top:10px;">${p.pd_name }</b><br/>
				결제금액 : ${p.price * p.num + p.shipping_c }원<br/>
				<c:if test="${p.o_value == null }">
					수량 : ${p.num }	/ 업체명 : ${p.s_name }<br/>
				</c:if>
				<c:if test="${p.o_value != null }">
					옵션 : ${p.o_value} / 수량 : ${p.num } / 업체명 : ${p.s_name }<br/>
				</c:if>
				
			</div>
			<div class="col-4" style="margin-bottom:10px;border-bottom:1px solid #ddd;">
				<c:if test="${p.confirm != 'Y' }">
					<a href="/myapp/order"><button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">취소/교환</button></a>
					<button class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">배송추적</button>
					<input type="submit" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;" value="구매확정"/>
				</c:if>
				<c:if test="${p.confirm == 'Y' }">
					<button data-toggle="modal" data-target="#reviewModal" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">리뷰쓰기</button></a>
					<a href="/myapp/storeDetail?pd_no=${p.pd_no }"><button type="button" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;">재구매하기</button></a>
				</c:if>
			</div>
			<hr/>
		</div>
	</c:forEach>
</div>
<!-- 리뷰 내용 -->
	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content contentSize">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="reviewModalTitle">리뷰쓰기</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<form method="post" action="/myapp/reviewWriteOk?pd_no=${pc.pd_no }" enctype="multipart/form-data">
		      		<div class="modal-body">
		      			<select name="pd_name" style="margin-bottom:20px;">
							<c:forEach var="pc" items="${list }">
								<option value="<c:out value='${pc.pd_name }'/>">
									<c:if test="${result.pd_name == pc.pd_name }">selected="selected"</c:if>
									<c:out value="${pc.pd_name }"/>
								</option>
							</c:forEach>			
						</select>			
		      			<div class="row">
							<div class="col-3" style="margin-bottom:15px;">
		      					구매일
		      				</div> 
		      				<div class="col-9" style="margin-bottom:15px;text-align:center">
		      					<input type="text" name="pc_date" id="pc_date" size="33" value="${pc.pc_date }"/>
		      				</div>
		      				<div class="col-3" style="margin-bottom:15px;">
		      					상품명
		      				</div>
		      				<div class="col-9" style="margin-bottom:15px;text-align:center">
		      					<input type="text" name="pd_name" id="pd_name" size="33" value="${pc.pd_name }"/>	
		      				</div>
		      				<c:if test="${pc.o_value != null }">
			      				<div class="col-3" style="margin-bottom:15px;">
			      					옵션
			      				</div>
			      				<div class="col-9" style="margin-bottom:15px;text-align:center">
		      						<input type="text" name="o_value" id="o_value" size="33" value="${pc.o_value }"/>
		      					</div>
		      				</c:if>
		      				<div class="col-3" style="margin-bottom:15px;">
		      					수량
		      				</div>
		      				<div class="col-9" style="margin-bottom:15px;text-align:center">
		      					<input type="text" name="num" id="num" size="33" value="${pc.num }"/>
		      				</div>
							<input type="hidden" name="pd_no" id="pd_no" value="${pc.pd_no }"/>	
							<input type="hidden" name="s_no" value="${pc.s_no }"/>
							<div class="col-3">
								별정
							</div>
		        			<div class="col-9">
		        				<input type="radio" name="rating" value="5"> <span style="margin-right:11px;">5점</span>
		        				<input type="radio" name="rating" value="4"> <span style="margin-right:11px;">4점</span>
		        				<input type="radio" name="rating" value="3"> <span style="margin-right:11px;">3점</span>
		        				<input type="radio" name="rating" value="2"> <span style="margin-right:11px;">2점</span>
		        				<input type="radio" name="rating" value="1"> <span style="margin-right:11px;">1점</span>
	        	      		</div>											
						</div>
       					<br/>
	        			<div style="margin-bottom:20px;">
	        				<h6>사진첨부(최대 1장)</h6>
							<input type="file" name="img">
	        			</div>
	        			<br/>
	        				<textarea name="content" placeholder="내용을 입력하세요." style="width:450px;height:150px;"></textarea>
          			</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        		<input type="submit" class="btn btn" style="font-size:1.0em;background-color:#ee8374;color:#fff;border:0;margin-bottom:3px;" value="등록"/>
	      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>
 <br/>
 <!-- 페이징 -->
  <div>
 
 </div>