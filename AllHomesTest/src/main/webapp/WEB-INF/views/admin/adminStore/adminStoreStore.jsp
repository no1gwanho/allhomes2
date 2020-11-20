<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
	td{height:50px; line-height:50px}
</style>
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
	    <!-- 검색 옵션 -->
		<div>
              <select class="mdb-select md-form mb-4 initialized" id="select">
                   <option value="" disabled selected>option</option>
                   <option value="1">스토어명 순</option>
                   <option value="2">입점일 순</option>
                   <option value="3">제품 순</option>
               </select>
        </div>
            
            
		<!-- 버튼들 -->
		<a href="/myapp/storeAdd" class="btn btn-primary btn-icon-split">
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
		
		<!-- 버튼 끝 -->
		
		<div class="mb-2"></div>
		<div class="card shadow mb-4"><!-- 테이블~~~~ -->
			<div class="card-body" style="text-align:center">	
				<table style="cursor:pointer;" class="table table-hover">
					<thead>
					<tr>
						<th><input type="checkbox" id="checkall"/></th>
						<th>번호</th>
						<th>스토어명</th>
						<th>사업자등록번호</th>
						<th>프로필</th>
						<th>ID</th>
						<th>입점일</th>
						<th>제품</th>
					</tr>
					</thead>
					<tbody>
					<tr onClick="location.href='/myapp/adminStoreDetail'">
						<td><input type="checkbox" name="chk"/></td>
						<td>135213</td>
						<td>자연가구</td>
						<td>14531-23152</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/img/admin/storeBasic.png" style="width:50px;height:50px;"/>
						</td>
						<td>seran13</td>
						<td>2020-10-31</td>
						<td>59</td>
					</tr>
					<tr onClick="location.href='/myapp/adminStoreDetail'">
						<td><input type="checkbox" name="chk"/></td>
						<td>135213</td>
						<td>자연가구</td>
						<td>14531-23152</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/img/admin/storeBasic.png" style="width:50px;height:50px;"/>
						</td>
						<td>seran13</td>
						<td>2020-10-31</td>
						<td>59</td>
					</tr>
					<tr onClick="location.href='/myapp/adminStoreDetail'">
						<td><input type="checkbox" name="chk"/></td>
						<td>135213</td>
						<td>자연가구</td>
						<td>14531-23152</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/img/admin/storeBasic.png" style="width:50px;height:50px;"/>
						</td>
						<td>seran13</td>
						<td>2020-10-31</td>
						<td>59</td>
					</tr>
					<tr onClick="location.href='/myapp/adminStoreDetail'">
						<td><input type="checkbox" name="chk"/></td>
						<td>135213</td>
						<td>자연가구</td>
						<td>14531-23152</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/img/admin/storeBasic.png" style="width:50px;height:50px;"/>
						</td>
						<td>seran13</td>
						<td>2020-10-31</td>
						<td>59</td>
					</tr>
					</tbody>	
				</table>
				
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
					
			</div><!-- card body 끝 -->
		</div><!-- card 끝 -->
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>