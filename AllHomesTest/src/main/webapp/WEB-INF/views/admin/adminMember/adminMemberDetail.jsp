<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		//체크박스 전체체크
		$("#checkall").click(function(){
	        if($("#checkall").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
    	});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-2">
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Member</h6>
                  </div>
                  	<div class="card-body">
                  		<div class="">
                            <img src="/myapp/resources/img/admin/user_basic.png" style="width:100px;height:100px"/>
                            <br/><br/><hr/><br/>
                        	
			                <p><label class="col-4">ID</label>seran11<p>
			               	<p><label class="col-4">이름</label>권세란<p>
			               	<p><label class="col-4">Email</label>seran11@nate.com<p>
			               	<p><label class="col-4">Tel</label>010-1231-1231<p>
		                    
							<hr/><br/>
							
							<p><label class="col-7">작성글</label><span style="color:#EE8374">132</span><p>
			               	<p><label class="col-7">주문내역</label><span style="color:#EE8374">22</span><p>
			               	<p><label class="col-7">스크랩</label><span style="color:#EE8374">111</span><p>
			               	<p><label class="col-7">위시리스트</label><span style="color:#EE8374">444</span><p>
		            	</div>        
                  	</div>
            </div>                     
       </div><!-- col-lg-4 끝 -->

       <div class="col-lg-10">
			<div><!-- 검색옵션 -->
	            <select class="selectpicker">
	               <option value="" disabled selected>option</option>
	               <option value="1">집들이</option>
	               <option value="2">질문과 답변</option>
	               <option value="3">상품/배송 문의</option>
	               <option value="3">리뷰</option>
	            </select>
	            <select class="selectpicker">
	               <option value="" disabled selected>option</option>
	               <option value="1">제목     ▲</option>
	               <option value="1">제목     ▼</option>
	               <option value="1">작성일     ▲</option>
	               <option value="1">작성일     ▼</option>
	               
	            </select>
	            
	            <a href="#" class="btn alert-secondary">
                <span class="text">정렬</span>
                </a>
        		
        		
        		<!-- 버튼 -->     
                <a href="#" class="btn btn-danger btn-icon-split" style="float:right">
                <span class="icon text-white-50">
                <i class="fas fa-trash"></i>
                </span>                 
                <span class="text">삭제</span>
                </a>
                 
       		</div><!-- 검색옵션 끝 -->
       		
       		<div class="my-2"></div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">Board</h6>
                </div>
                <div class="card-body" style="text-align:center;">
                	<!-- table 제품 테이블 -->
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkall"/></th>
								<th>게시판</th>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="chk"/></td>
								<td>질문과답변</td>
								<td>15783342</td>
								<td>커튼봉 설치 질문</td>
								<td>2020-10-12</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="chk"/></td>
								<td>질문과답변</td>
								<td>15783342</td>
								<td>커튼봉 설치 질문</td>
								<td>2020-11-21</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="chk"/></td>
								<td>집들이 게시판</td>
								<td>15783342</td>
								<td>북유럽 인테리어</td>
								<td>2020-04-31</td>
							</tr>
						</tbody>	
					</table>
					<!-- table 끝 -->
					
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
					  
                 </div>
            </div><!-- card끝 -->
            
            <div class="my-2"></div>
            <div><!-- order 검색옵션 -->
	           
	            <select class="selectpicker">
	               <option value="" disabled selected>option</option>
	               <option value="1">주문번호     ▲</option>
	               <option value="1">주문번호     ▼</option>
	               <option value="1">상품명     ▲</option>
	               <option value="1">상품명     ▼</option>
	               <option value="1">구매일     ▲</option>
	               <option value="1">구매일     ▼</option>
	            </select>
	            
        		<!-- 버튼 -->     
	            <a href="#" class="btn alert-secondary">
                <span class="text">정렬</span>
                </a>
       		</div><!-- order 검색옵션 끝 -->
       		
       		<div class="my-2"></div>
       	
			<div class="card shadow mb-4">
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">Order</h6>
                </div>
                <div class="card-body" style="text-align:center;">
                	<!-- Order table -->
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>스토어명</th>
								<th>구매일</th>
								<th>상태</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>12341</td>
								<td>32423</td>
								<td>원목 의자</td>
								<td>자연가구</td>
								<td>2020-11-02</td>
								<td>구매확정</td>
							</tr>
							<tr>
								<td>12341</td>
								<td>32423</td>
								<td>원목 의자</td>
								<td>자연가구</td>
								<td>2020-11-02</td>
								<td>구매확정</td>
							</tr>
							<tr>
								<td>12341</td>
								<td>32423</td>
								<td>원목 의자</td>
								<td>자연가구</td>
								<td>2020-11-02</td>
								<td>구매확정</td>
							</tr>
						</tbody>	
					</table>
					<!-- table 끝 -->
					
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
					
                 </div>
            </div><!-- card끝 -->

			
			<div class="my-2"></div>
			<div class="card shadow mb-4"><!-- wishlist -->
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">Wishlist</h6>
                </div>
                <div class="card-body" style="text-align:center;">
                
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
					
                </div><!-- card-body끝 -->
         	</div>
         	
         	<div class="my-2"></div>
			<div class="card shadow mb-4"><!-- scrap -->
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">Scrap</h6>
                </div>
                <div class="card-body" style="text-align:center;">
                	
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
					
                </div><!-- card-body끝 -->
         	</div>
         	
         </div>
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>