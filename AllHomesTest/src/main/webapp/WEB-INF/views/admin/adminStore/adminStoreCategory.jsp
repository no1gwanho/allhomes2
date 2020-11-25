<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>
<style>
	#category{
		float:left;
		margin:35px;
	}
	#category img:first-child{
		width:200px;
		height:230px;
		margin:0 auto;
		padding-top:30px;
	}
	
	#category img{
		width:300px;
		height:330px;
		margin:0 auto;
		padding-top:30px;
	}
	#formC{
		float:left;
		height:30px;
		line-height:30px
	}
</style>
<script>
	$(function(){
		
		$("#mainCFrm").submit(function(){
			if($("#main_c").val()==""){
				alert("카테고리명을 입력해주십시오.");
				return false;
			}else if($("#priority").val==""){
				alert("우선순위를 입력해주십시오.");
				return false;
			}
			
		});	
		
		//메인카테고리 수정
		$(".editMain").click(function(){
			var main_c = $("#main_c").val();
			alert(main_c);
		});
		
		//서브카테고리 추가
		$("#subC_add").click(function(){
			if($("#main_cName").val()==""){
				alert("메인 카테고리를 입력하세요.");
				return false;
			}else if($("#sub_c").val()==""){
				alert("서브 카테고리를 입력하세요.");
				return false;
			}
			
			
			var url="/myapp/adminSubCategoryAdd";
			var main_c = $("#main_cName").val();
			var sub_c = $("#sub_c").val();
			
			//ajax
			$.ajax({
				url:url,
				dataType:"text",
				data: {"main_c":main_c, "sub_c":sub_c},
				success: function(result){
					if(result>0){
						alert("서브 카테고리를 추가하였습니다.");
					}else{
						alert("서브 카테고리 추가에 실패했습니다.");
					}
				},error: function(){
					console.log("서브 카테고리 추가 오류");	
				}
			});
			return false;
		});
		
		//메인카테고리 삭제
		$(".delMainC").click(function(){
			var main_c = $(this).attr('id'); //메인 카테고리 값
			var url= "/myapp/adminMainCategoryDel";
			
			 $.ajax({
				url:url,
				dataType:"text",
				data:{"main_c":main_c},
				success: function(result){
					if(result>0){
						alert("메인 카테고리를 삭제했습니다.");
					}else{
						alert("메인 카테고리 삭제에 실패했습니다.");
					}
				},error: function(){
					console.log("메인 카테고리 삭제 오류");
				}
			}); 
			
		});
		
		
		//서브카테고리 삭제
		$(".delSubC").click(function(){
			var sub_c = $(this).parent().prev().text(); //서브카테고리 값
			var url= "/myapp/adminSubCategoryDel";
			
			$.ajax({
				url:url,
				dataType:"text",
				data:{"sub_c":sub_c},
				success: function(result){
					if(result>0){
						alert("서브 카테고리를 삭제했습니다.");
					}else{
						alert("서브 카테고리 삭제에 실패했습니다.");
					}
				},error: function(){
					console.log("서브 카테고리 삭제 오류");
				}
			});
		});
	});
	
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
			
			
            <div class="card shadow mb-4">
            	<div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">MAIN CATEGORY ADD</h6>
                </div>
            	<div class="card-body">
            		<div class="card shadow col-lg-10" id="category">
                		
                		
                		<form id="mainCFrm" class="col-lg-12" method="post" style="text-align:center" action="<%=request.getContextPath()%>/mainCategoryAdd" enctype="multipart/form-data">
                			<div style="display:inline-block"> 
	                			<img src="/myapp/resources/img/admin/c_add.png"/>
	                			<br/>
	                			<input type="file" name="file"/>
			                	<div class="my-2"></div>
			                	<hr/>
	                			<p>
	                				<span id="formC" class="col-lg-6">카테고리명</span>
	                				<input type="text" class="form-control col-lg-4" id="main_c" name="main_c" />
	                			</p>
	                			<p>
	                				<span id="formC" class="col-lg-6">우선순위</span>
	                				<input type="number" class="form-control col-lg-4" id="priority" name="priority"/>
	                			</p>
		                		<!-- 추가 버튼 -->
		                		<div class="" style="text-align:center">
			                		<!-- 추가 버튼 -->
			                		<button type="submit" class="btn btn-primary btn-icon-split">
			                			<span class="icon text-white-50">
				           				<i class="fas fa-check"></i></span>
					        			<span class="text">추가</span>
			                		</button>
				                </div><br/>
			                </div>
                		</form>
	                </div>
                	<br/>
                		
     				
            	</div>
            </div>
       	</div><!-- col-lg-4 끝 -->
       	
       	<div class="col-lg-8">
		    
       		<div class="card shadow mb-4" >
       			<div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">MAIN CATEGORY</h6>
                </div>
                <div class="card-body">
                	
                	<c:forEach var="vo" items="${list}" varStatus="status">
	                	<div class="card shadow col-lg-5" id="category">
	                		<img src="${vo.img}"/>
	                		<div class="my-2"></div>
	                		<hr/>
	                		<form class="col-lg-10" style="text-align:center">
	                			<p>
	                				<span id="formC" class="col-lg-6">카테고리명</span><input type="text" id="main_c" class="form-control col-lg-6" value="${vo.main_c}"/>
	                			</p>
	                			<p>
	                				<span id="formC" class="col-lg-6">우선순위</span><input type="text" id="priority" class="form-control col-lg-6" value="${vo.priority}"/>
	                			</p>
	                		</form>
	                		<br/>
	                		
	                		<!-- 버튼 -->
	                		<div style="text-align:center">
				    			<button class="btn btn-secondary btn-icon-split editMain">
			                			<span class="icon text-white-50">
				           				<i class="fas fa-check"></i></span>
					        			<span class="text">수정</span>
			                		</button>
				    			<!-- 삭제 버튼 -->
				    			<button id="${vo.main_c}" class="btn btn-danger btn-icon-split delMainC">
			                		<span class="icon text-white-50">
				           			<i class="fas fa-trash"></i></span>
					        		<span class="text">삭제</span>
			               		</button>
				    			
			                </div>    
				    		<br/>   
			                <!-- 버튼 끝 -->
	                	</div>
                	</c:forEach>
                	
                	
                </div>
       		</div>
       	
       	</div><!-- col-lg-8 끝 -->
       	
       	<div class="col-lg-12">
       		<div class="card shadow mb-4">
       			 <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">SUB CATEGORY</h6>
                 </div>
		         <div class="card-body"  style="text-align:center">
			           <table style="cursor:pointer;" class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>메인 카테고리명</th>
								<th>서브 카테고리명</th>
								<th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sVo" items="${subList}">
							<tr style="height:35px; line-height:35px">
								<td>${sVo.main_c}</td>
								<td>${sVo.sub_c}</td>
								<td>
									<button class="btn btn-user btn-danger delSubC">삭제</button>
								</td>
							</tr>
							</c:forEach>
							<tr>
								<td>
									<select class="form-control" id="main_cName">
										<c:forEach var="main" items="${mainList}">
								   		<option>${main}</option>
								    	</c:forEach>
								    </select>
								</td>
								<td><input type="text" class="form-control" id="sub_c"/></td>
								<td><button id="subC_add" class="btn btn-user btn-primary">추가</button></td>
							</tr>
						</tbody>	
					</table>
		             
		            
		       </div><!-- card-body끝 -->
	        </div><!-- card 끝 -->
       	
       	</div><!-- col-lg-12끝 -->
     </div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>