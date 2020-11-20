<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<h1>회원 상세 페이지</h1>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-2">
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Member 상세</h6>
                  </div>
                  	<div class="card-body">
                  	
                  		<!-- 폼 -->
                        <form class="md-form"  style="color: #757575;">
                            <img src="/myapp/resources/img/user_basic.png" style="width:100px;height:100px"/>
                            <br/><hr/><br/>
		                    <label for="s_no">ID</label>
		                    <input type="email" id="s_no" class="form-control">
                            <div class="my-2"></div>
                            <label for="s_name">이름</label>
							<input type="text" id="s_name" class="form-control">
	                    	<div class="my-2"></div>
		                    <label for="userid">Email</label>
		                    <input type="text" id="userid" class="form-control">
							<div class="my-2"></div>	
							<label for="tel">Tel</label>
		                    <input type="text" id="tel" class="form-control">
							<div class="my-2"></div>
							
							<br/>
							<hr/>
							<br/>
							<label for="product">작성글</label>
		                    <a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;263</a>
		                    <div class="my-2"></div>
							<label for="sales">주문내역</label>
		                    <a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13</a>
		                    <div class="my-2"></div>
							<label for="sales">스크랩</label>
		                    <a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24</a>
		                    <div class="my-2"></div>
							<label for="sales">위시리스트</label>
		                    <a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;45</a>
		                    
		                    
                        </form>
                  	</div>
            </div>                     
       </div><!-- col-lg-4 끝 -->

       <div class="col-lg-10">
			<div>
				<!-- 검색 옵션 -->
	            <select class="selectpicker"><!-- 메인 -->
	               <option value="" disabled selected>option</option>
	               <option value="1">게시판</option>
	               <option value="2">주문 내역</option>
	               <option value="3">위시리스트</option>
	               <option value="3">스크랩</option>
	            </select>
	            <select class="selectpicker"><!-- 서브 -->
	               <option value="" disabled selected>option</option>
	               <option value="1">집들이</option>
	               <option value="2">질문과 답변</option>
	               <option value="3">상품/배송 문의</option>
	               <option value="3">리뷰</option>
	            </select>
	            <select class="selectpicker"><!-- 서브2-->
	               <option value="" disabled selected>option</option>
	               <option value="1">제목</option>
	               <option value="2">작성일</option>
	               
	            </select>
        		<!-- 검색옵션 끝 -->
        		
        		<!-- 버튼 -->     
                <a href="#" class="btn btn-danger btn-icon-split" style="float:right">
                <span class="icon text-white-50">
                <i class="fas fa-trash"></i>
                </span>                 
                <span class="text">삭제</span>
                </a>
                 
       		</div><!-- selection 끝 -->
       		<div class="my-2"></div>
       		
			<div class="card shadow mb-4">
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">Board</h6>
                </div>
                <div class="card-body">
                	<!-- table 제품 테이블 -->
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>체크</th>
								<th>게시판</th>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성일</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>체크</th>
								<th>질문과답변</th>
								<th>15783342</th>
								<th>커튼봉 설치 질문</th>
								<th>2020-10-12</th>
							
							</tr>
						</tbody>	
					</table>
					<!-- table 제품 테이블 끝 -->
					
                 </div>
            </div>

         </div>
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>