<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<h1>스토어 상세 보기</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Store 상세</h6>
                  </div>
                  	<div class="card-body">
                  	
                  		<!-- 폼 -->
                        <form class="md-form"  style="color: #757575;">
                            <img src="/myapp/resources/img/storeadd.png" style="width:150px;height:150px"/>
                            <br/><hr/><br/>
		                    <label for="s_no">스토어번호</label>
		                    <input type="email" id="s_no" class="form-control">
                            <div class="my-2"></div>
                            <label for="s_name">스토어명</label>
							<input type="text" id="s_name" class="form-control">
	                    	<div class="my-2"></div>
		                    <label for="userid">판매자 ID</label>
		                    <input type="text" id="userid" class="form-control">
							<div class="my-2"></div>	
							<label for="tel">Tel</label>
		                    <input type="text" id="tel" class="form-control">
							<div class="my-2"></div>
							<label for="regdate">입점일</label>
		                    <input type="text" id="regdate" class="form-control">
							<br/>
							<hr/>
							<br/>
							<label for="product">제품</label>
		                    <input type="text" id="product" class="form-control">
		                    <div class="my-2"></div>
							<label for="sales">판매량</label>
		                    <input type="text" id="sales" class="form-control">
		                    
                        </form>
                  	</div>
            </div>                     
       </div><!-- col-lg-4 끝 -->

       <div class="col-lg-8">
			<div><!-- 버튼 -->
				   <a href="/myapp/productAdd" class="btn btn-success btn-icon-split">
                   <span class="icon text-white-50">
                   <i class="fas fa-check"></i>
                   </span>
                   <span class="text">추가</span>
                   </a>
                            
                   <a href="#" class="btn btn-danger btn-icon-split">
                   <span class="icon text-white-50">
                   <i class="fas fa-trash"></i>
                   </span>
                   <span class="text">삭제</span>
                   </a>
                 
       		</div><!-- 버튼 끝 -->
       		<div class="my-2"></div>
       		
			<div class="card shadow mb-4">
				<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">PRODUCT</h6>
                </div>
                <div class="card-body">
                	<!-- table 제품 테이블 -->
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>제품 번호</th>
								<th>썸네일</th>
								<th>제품명</th>
								<th>카테고리</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr onClick="location.href=''">
								<th>6234251</th>
								<th>썸네일</th>
								<th>빈티지 체크 커튼</th>
								<th>홈데코</th>
								<th>2019-12-21</th>
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