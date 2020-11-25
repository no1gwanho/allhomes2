<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<script>
	$(function(){
		$("#searchSelect").change(function(){
			if($("#searchSelect option:selected").val()=="writedate"){
				$("#searchDate").css("display","block");
			}
		});
		
	});
	



</script>
<div class="container-fluid">
	<div class="row">
		<!-- 카드 들 -->
		<div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                     <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xl font-weight-bold text-danger text-uppercase mb-1">
                               Home Board</div>
                                   <div class="h5 mb-0 font-weight-bold text-gray-800">+${countHb}</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas fa-home fa-2x text-gray-300"></i>
                          </div>
                    </div>
               </div>
           </div>
        </div>
        
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                     <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xl font-weight-bold text-warning text-uppercase mb-1">
                               Q&A Board</div>
                                   <div class="h5 mb-0 font-weight-bold text-gray-800">+${countQa}</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas fa-question fa-2x text-gray-300"></i>
                          </div>
                    </div>
               </div>
           </div>
        </div>
        
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                     <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                               Review</div>
                                   <div class="h5 mb-0 font-weight-bold text-gray-800">+${countReview}</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas fa-star fa-2x text-gray-300"></i>
                          </div>
                    </div>
               </div>
           </div>
        </div>
		<!-- 카드 끝 -->
		
		<style>
			td{height:40px;line-height:40px;}	
		</style>
		
		
		<div class="col-lg-12">
			<br/><br/><br/>
			<!-- 검색 옵션 -->
			<div>
				<select class="selectpicker" id="searchSelect">
	               		<optgroup label="검색 필터"> 
		                   <option value="userid">회원 ID로 검색</option>
		                   <option value="subject">제목으로 검색</option>
		                   <option value="content">글 내용으로 검색</option>
		                   <option value="writedate">기간으로 검색</option>
	                   </optgroup>
	            </select>
	            
				<!-- search 검색 -->
				<form
	                 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	                 <div class="input-group">
	                      <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
	                              aria-label="Search" aria-describedby="basic-addon2">
	                       <div class="input-group-append">
	                        	<button class="btn btn-dark" type="button">
	                                    <i class="fas fa-search fa-sm"></i>
	                          	</button>
	                       </div>
	                  </div>
	             </form>
	             <!-- search 검색 끝 -->
	             
	             <div style="display:none" id="searchDate"> <!-- 기간으로 검색 눌러야 나오는 검색창 -->
	             	<input type="text"/>-<input type="text"/>
	             </div>
	             
	             <div class="my-2"></div>
	             
		         <div class="card shadow mb-4">
		         	<div class="card-body"  style="text-align:center">
			            <table style="cursor:pointer;" class="table table-hover">
							<thead>
							<tr>
								<th>
									<select class="selectpicker">
					               		<optgroup label="게시판"> 
						                   <option value="">집들이</option>
						                   <option value="">질문과답변</option>
						                   <option value="">후기게시판</option>
					                   </optgroup>
		            				</select>
								</th>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>좋아요</th>
								<th>삭제</th>
							</tr>
							</thead>
							<tbody>
							<tr onClick="location.href=''">
								<td>질문과답변</td>
								<td>12353</td>
								<td>이중 커튼 커튼봉 질문합니다</td>
								<td>seran11</td>
								<td>2020-10-12</td>
								<td>62</td>
								<td>231</td>
								<td>
									<a href="#" class="btn btn-danger btn-circle">
	                                   <i class="fas fa-trash"></i>
	                                </a>
								</th>
							</tr>
							<tr onClick="location.href=''">
								<td>질문과답변</td>
								<td>12353</td>
								<td>이중 커튼 커튼봉 질문합니다</td>
								<td>seran11</td>
								<td>2020-10-12</td>
								<td>62</td>
								<td>231</td>
								<td>
									<a href="#" class="btn btn-danger btn-circle">
	                                   <i class="fas fa-trash"></i>
	                                </a>
								</th>
							</tr>
							<tr onClick="location.href=''">
								<td>질문과답변</td>
								<td>12353</td>
								<td>이중 커튼 커튼봉 질문합니다</td>
								<td>seran11</td>
								<td>2020-10-12</td>
								<td>62</td>
								<td>231</td>
								<td>
									<a href="#" class="btn btn-danger btn-circle">
	                                   <i class="fas fa-trash"></i>
	                                </a>
								</th>
							</tr>
							<tr onClick="location.href=''">
								<td>질문과답변</td>
								<td>12353</td>
								<td>이중 커튼 커튼봉 질문합니다</td>
								<td>seran11</td>
								<td>2020-10-12</td>
								<td>62</td>
								<td>231</td>
								<td>
									<a href="#" class="btn btn-danger btn-circle">
	                                   <i class="fas fa-trash"></i>
	                                </a>
								</th>
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
						
						
		             </div><!-- card-body끝 -->
	             </div><!-- card 끝 -->
			</div><!-- 검색 옵션 끝 -->
			
		</div><!-- col-lg-12 끝 -->
	</div>
</div>

<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>