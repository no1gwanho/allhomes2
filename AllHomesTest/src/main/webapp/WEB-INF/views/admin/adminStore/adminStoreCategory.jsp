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
		
	
		//서브카테고리 추가
		$("#subC_add").click(function(){
			if($("#main_cName").val()==""){
				alert("메인 카테고리를 입력하세요.");
				return false;
			}else if($("#sub_c").val()==""){
				alert("서브 카테고리를 입력하세요.");
				return false;
			}
			
			
			location.href="/myapp/adminSubCategoryAdd?main_c="+$("#main_cName option:selected").val()+"&sub_c="+$("#sub_c").val();
			
		});
		
	
		//미리보기
		$("#previewMainImg").on("change", selectImgPreview);
	});
	
	//미리보기 function
	function selectImgPreview(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
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
                		<form id="mainCFrm" method="post" style="text-align:center" action="<%=request.getContextPath()%>/mainCategoryAdd" enctype="multipart/form-data">
                			<div style="display:inline-block"> 
	                			<img src="/myapp/resources/img/admin/c_add.png" id="img"/>
	                			<br/><br/>
	                			<input type="file" name="file" id="previewMainImg"/>
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
                		<form method="post" action="/myapp/mainCategoryUpdate" onsubmit="return updateChk()" enctype="multipart/form-data"/>
	                	<div class="card shadow col-lg-5" id="category">
	                		<img src="<%=request.getContextPath()%>/resources/upload/storeMainCategoryImg/${vo.img}"/>
	                		<div class="my-2"></div>
	                		<hr/>
	                		<form class="col-lg-10" style="text-align:center">
	                			<p>
	                				<span id="formC" class="col-lg-6">카테고리명</span><input type="text" id="main_c" class="form-control col-lg-6" value="${vo.main_c}"/>
	                			</p>
	                			<p>
	                				<span id="formC" class="col-lg-6">우선순위</span><input type="text" id="priority" class="form-control col-lg-6" value="${vo.priority}"/>
	                			</p>
	                			<input type="hidden" id="main_c_no" value="${vo.main_c_no}"/>
	                		</form>
	                		<br/>
	                		
	                		<!-- 버튼 -->
	                		<div style="text-align:center">
				    		<!-- 	<button type="submit" class="btn btn-secondary btn-icon-split editMain">
			                			<span class="icon text-white-50">
				           				<i class="fas fa-check"></i></span>
					        			<span class="text">수정</span>
			                		</button>
			                		<script>
			                		function updateChk(){
									       return confirm("수정하시겠습니까?");
									}
			                		</script> -->
				    			<!-- 삭제 버튼 -->
				    			<a href="/myapp/adminMainCategoryDel?no=${vo.main_c_no }" onclick="return delchk();" class="btn btn-danger btn-icon-split delMainC">
			                	
			                		<span class="icon text-white-50">
				           			<i class="fas fa-trash"></i></span>
					        		<span class="text">삭제</span>
			               		</a>
				    			 <script type="text/javascript">
									function delchk(){
									       return confirm("삭제하시겠습니까?");
									}
								</script>
			                </div>    
				    		<br/>   
			                <!-- 버튼 끝 -->
	                	</div>
	                	</form>
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
									<a href="<%=request.getContextPath() %>/adminSubCategoryDel?sub_c=${sVo.sub_c}" onclick="return delchk()"
											class="btn btn-user btn-danger delSubC">삭제</a>
									
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