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
			return false;
		});	
	});
	
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
			
			
            <div class="card shadow mb-4">
            	<div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">CATEGORY ADD</h6>
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
                     <h6 class="m-0 font-weight-bold text-primary">CATEGORY</h6>
                </div>
                <div class="card-body">
                	<!-- 카테고리 1 -->
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/admin/c1.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		<form class="col-lg-10" style="text-align:center">
                			<p>
                				<span id="formC" class="col-lg-6">카테고리명</span>
                				<input type="text" class="form-control col-lg-6" id="main_c" name="main_c"/>
                			</p>
                			<p>
                				<span id="formC" class="col-lg-6">우선순위</span>
                				<input type="text" class="form-control col-lg-6" id="priority" name="priority"/>
                			</p>
                		</form>
                		<br/>
                		
                		<!-- 버튼 -->
                		<div class="" style="text-align:center">
	                		<!-- 수정 버튼 -->
							<a href="#" class="btn btn-secondary btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-check"></i></span>
			        			<span class="text">수정</span>
			    			</a>
			    			<!-- 삭제 버튼 -->
			    			<a href="#" class="btn btn-danger btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-trash"></i></span>
			        			<span class="text">삭제</span>
			    			</a>
			    			
		                </div>    
			    		<br/>   
		                <!-- 버튼 끝 -->
		                
		                
                	</div>
                	<!-- 카테고리 1 끝 -->
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/admin/c2.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		<form class="col-lg-10" style="text-align:center">
                			<p>
                				<span id="formC" class="col-lg-6">카테고리명</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                			<p>
                				<span id="formC" class="col-lg-6">우선순위</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                		</form>
                		<br/>
                		
                		<!-- 버튼 -->
                		<div class="" style="text-align:center">
	                		<!-- 수정 버튼 -->
							<a href="#" class="btn btn-secondary btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-check"></i></span>
			        			<span class="text">수정</span>
			    			</a>
			    			<!-- 삭제 버튼 -->
			    			<a href="#" class="btn btn-danger btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-trash"></i></span>
			        			<span class="text">삭제</span>
			    			</a>
			    			
		                </div>    
			    		<br/>   
		                <!-- 버튼 끝 -->
                	</div>
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/admin/c3.jpg" />
                		<div class="my-2"></div>
                		<hr/>
                		<form class="col-lg-10" style="text-align:center">
                			<p>
                				<span id="formC" class="col-lg-6">카테고리명</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                			<p>
                				<span id="formC" class="col-lg-6">우선순위</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                		</form>
                		<br/>
                		
                		<!-- 버튼 -->
                		<div class="" style="text-align:center">
	                		<!-- 수정 버튼 -->
							<a href="#" class="btn btn-secondary btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-check"></i></span>
			        			<span class="text">수정</span>
			    			</a>
			    			<!-- 삭제 버튼 -->
			    			<a href="#" class="btn btn-danger btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-trash"></i></span>
			        			<span class="text">삭제</span>
			    			</a>
			    			
		                </div>    
			    		<br/>   
		                <!-- 버튼 끝 -->
		                
		                
                	</div>
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/admin/c4.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		<form class="col-lg-10" style="text-align:center">
                			<p>
                				<span id="formC" class="col-lg-6">카테고리명</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                			<p>
                				<span id="formC" class="col-lg-6">우선순위</span><input type="text" class="form-control col-lg-6"/>
                			</p>
                		</form>
                		<br/>
                		
                		<!-- 버튼 -->
                		<div class="" style="text-align:center">
	                		<!-- 수정 버튼 -->
							<a href="#" class="btn btn-secondary btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-check"></i></span>
			        			<span class="text">수정</span>
			    			</a>
			    			<!-- 삭제 버튼 -->
			    			<a href="#" class="btn btn-danger btn-icon-split">
		           				<span class="icon text-white-50">
		           				<i class="fas fa-trash"></i></span>
			        			<span class="text">삭제</span>
			    			</a>
			    			
		                </div>    
			    		<br/>   
		                <!-- 버튼 끝 -->
                	</div>
                	
                	
                </div>
       		</div>
       	
       	</div><!-- col-lg-8 끝 -->
     </div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>