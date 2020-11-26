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
		
		//스토어 삭제 
		$("#storeDel").click(function(){
			var result = confirm("스토어를 삭제하시겠습니까? 스토어의 모든 상품들이 함께 삭제됩니다.");
			if(result){
				location.href="/myapp/storeDel?s_no=${vo.s_no}";
			}
		});
		
		
		
	});
	
	
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3">
			<div><!-- 스토어  버튼 -->
            	<a href="/myapp/storeEdit?s_no=${vo.s_no}" id="storeEdit" class="btn alert-clean btn-icon-split shadow-sm">
	                <span class="icon text-white-50">
	                   <i class="fas fa-check"></i>
	                </span>
	          	 	<span class="text">수정</span>
        		</a>
        		
            	<button id="storeDel" class="btn alert-clean btn-icon-split shadow-sm">
	                <span class="icon text-white-50">
	                   <i class="fas fa-trash"></i>
	                </span>
	          	 	<span class="text">삭제</span>
        		</button>
            </div>     
            <div class="my-2"></div>
            <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Store 상세</h6>
                  </div>
                  	<div class="card-body">
                  		<div  style="text-align:center">
	                  		<div style="display:inline-block">
	                            <img src="<c:url value='/storeImg/${vo.s_pic}'/>" style="width:150px;height:150px; border-radius:70%;"/>
	                        </div>
                        </div>
                            <br/><hr/><br/>
			                <p><label class="col-6">번호</label>${vo.s_no }<p>
			               	<p><label class="col-6">스토어명</label>${vo.s_name }<p>
			               	<p><label class="col-6">판매자 ID</label>${vo.s_id }<p>
			               	<p><label class="col-6">입점일</label>${vo.openingdate}<p>
							<hr/><br/>
							<p><label class="col-7">제품</label><span style="color:#EE8374">132</span><p>
			               	<p><label class="col-7">누적 판매</label><span style="color:#EE8374">22</span><p>
                  	</div>
            </div>
                
                        
       </div><!-- col-lg-4 끝 -->
		
       <div class="col-lg-9">
			<div><!-- 버튼 -->
				   <a href="/myapp/productAdd?s_no=${vo.s_no}" class="btn btn-primary btn-icon-split">
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
                   
                   <select class="form-control col-lg-2" style="float:right">
                       <option>제품명 순</option>
                       <option>재고 순</optoin>
                       <option>입고일 순</option>
                       <option>판매량 순</option>
                   </select>
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
								<th>판매량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pVo" items="${pVo}">
								<tr>
									<td>${pVo.pd_no}</td>
									<td>${pVo.pd_name}</td>
									<td>${pVo.sub_c}</td>
									<td>${pVo.stock}</td>
									<td>${pVo.status}</td>
									<td>521</td>
								</tr>
							</c:forEach>
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