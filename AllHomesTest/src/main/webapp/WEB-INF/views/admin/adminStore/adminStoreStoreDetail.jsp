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
		<div class="col-lg-3">
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Store 상세</h6>
                  </div>
                  	<div class="card-body">
                  		<div  style="text-align:center">
	                  		<div style="display:inline-block">
	                            <img src="/myapp/resources/img/admin/storeBasic.png" style="width:150px;height:150px"/>
	                        </div>
                        </div>
                            <br/><hr/><br/>
			                <p><label class="col-6">번호</label>1523<p>
			               	<p><label class="col-6">스토어명</label>자연가구<p>
			               	<p><label class="col-6">판매자 ID</label>seran11<p>
			               	<p><label class="col-6">Tel</label>010-1231-1231<p>
			               	<p><label class="col-6">입점일</label>2020-10-21<p>
							<hr/><br/>
							<p><label class="col-7">제품</label><span style="color:#EE8374">132</span><p>
			               	<p><label class="col-7">누적 판매</label><span style="color:#EE8374">22</span><p>
                  	</div>
            </div>                     
       </div><!-- col-lg-4 끝 -->

       <div class="col-lg-9">
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
                <div class="card-body" style="text-align:center">
                	<!-- table 제품 테이블 -->
		            <table style="cursor:pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>제품 번호</th>
								<th>제품명</th>
								<th>카테고리</th>
								<th>재고</th>
								<th>상태</th>
								<th>등록일</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody>
							<tr onClick="location.href=''">
								<td>6234251</td>
								<td>빈티지 체크 커튼</td>
								<td>홈데코</td>
								<td>142</td>
								<td>입고</td>
								<td>2019-12-21</td>
								<td>521</td>
							</tr>
							<tr onClick="location.href=''">
								<td>6234251</td>
								<td>빈티지 체크 커튼</td>
								<td>홈데코</td>
								<td>142</td>
								<td>입고</td>
								<td>2019-12-21</td>
								<td>521</td>
							</tr>
							<tr onClick="location.href=''">
								<td>6234251</td>
								<td>빈티지 체크 커튼</td>
								<td>홈데코</td>
								<td>142</td>
								<td>입고</td>
								<td>2019-12-21</td>
								<td>521</td>
							</tr>
						</tbody>	
					</table><!-- table 제품 테이블 끝 -->
					
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

         </div>
	</div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>