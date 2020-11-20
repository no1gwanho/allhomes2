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
</style>
<h1>카테고리 관리 페이지</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
            <div class="card shadow mb-4">
            	<div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">CATEGORY ADD</h6>
                </div>
            	<div class="card-body">
            		<div class="card shadow col-lg-10" id="category">
                		<img src="/myapp/resources/img/c_add.png"/>
                		<div class="my-2"></div>
                		<hr/>
                		카테고리명 : <input type="text"/>
                		우선순위 : <input type="text"/>
                		<br/>
                	</div>
     
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
                		<img src="/myapp/resources/img/c1.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		카테고리명 : <input type="text"/>
                		우선순위 : <input type="text"/>
                		<br/>
                	</div>
                	<!-- 카테고리 1 끝 -->
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/c2.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		카테고리명 : <input type="text"/>
                		우선순위 : <input type="text"/>
                		<br/>
                	</div>
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/c3.jpg" />
                		<div class="my-2"></div>
                		<hr/>
                		카테고리명 : <input type="text"/>
                		우선순위 : <input type="text"/>
                		<br/>
                	</div>
                	
                	<div class="card shadow col-lg-5" id="category">
                		<img src="/myapp/resources/img/c4.jpg"/>
                		<div class="my-2"></div>
                		<hr/>
                		카테고리명 : <input type="text"/>
                		우선순위 : <input type="text"/>
                		<br/>
                	</div>
                	
                	
                </div>
       		</div>
       	
       	</div><!-- col-lg-8 끝 -->
     </div>
</div>
<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>