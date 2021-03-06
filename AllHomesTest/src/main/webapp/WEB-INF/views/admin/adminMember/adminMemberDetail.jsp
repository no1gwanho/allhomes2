<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="col-lg-3">
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Member</h6>
                  </div>
                  	<div class="card-body">
                  		<div class="col-lg-12 mt-4" style="text-align:center">
                            <img src="<%=request.getContextPath()%>/resources/upload/register/${mVo.m_pic}" 
                            style="width:150px;height:150px;border-radius:70%;display:inline-block"/>
                            <br/><br/><hr/><br/>
		            	</div>        
                        	
			                <p><label class="col-4">ID</label>${mVo.userid}<p>
			               	<p><label class="col-4">이름</label>${mVo.username}<p>
			               	<p><label class="col-4">닉네임</label>${mVo.nickname}<p>
			               	<p><label class="col-4">Email</label>${mVo.email}<p>
			               	<p><label class="col-4">Tel</label>${mVo.tel}<p>
			               	<p><label class="col-4">등록일</label>${mVo.regdate}<p>
		                    
							<hr/><br/>
							
							<p><label class="col-7">작성글</label><span style="color:#EE8374">${infoVO.boardCnt}</span><p>
			               	<p><label class="col-7">주문내역</label><span style="color:#EE8374">${infoVO.orderCnt}</span><p>
			               	<p><label class="col-7">스크랩</label><span style="color:#EE8374">${infoVO.scrapCnt}</span><p>
			               	<p><label class="col-7">위시리스트</label><span style="color:#EE8374">${infoVO.wishCnt}</span><p>
                  	</div>
            </div>                     
       </div><!-- col-lg-4 끝 -->

       <div class="col-lg-9">
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
							<c:forEach var="vo" items="${oList}">
							<tr>
								<td>${vo.pc_no}</td>
								<td>${vo.pd_no}</td>
								<td>${vo.pd_name}</td>
								<td>${vo.s_name}</td>
								<td>${vo.pc_date}</td>
								<td>${vo.status}</td>
							</tr>
							</c:forEach>
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