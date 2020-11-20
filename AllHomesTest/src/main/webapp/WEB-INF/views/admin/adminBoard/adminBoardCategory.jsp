<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/adminInc/adminSideBar.jspf"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">집들이 게시판 카테고리</h6>
				</div>
				
				<style>
					td{height:40px;line-height:40px;}
				
				</style>
				<!-- card body -->
				<div class="card-body">
					<table style="cursor:pointer;" class="table table-hover">
						<thead>
						<tr>
							<th>카테고리명</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>빈티지
								<div style="float:right">
									<a href="" class="btn alert-secondary">수정</a>
									<a href="" class="btn alert-danger">삭제</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>유럽풍
								<div style="float:right">
									<a href="" class="btn alert-secondary">수정</a>
									<a href="" class="btn alert-danger">삭제</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>모던
								<div style="float:right">
									<a href="" class="btn alert-secondary">수정</a>
									<a href="" class="btn alert-danger">삭제</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<form>
									<div class="col-lg-6">
										<input type="text" class="form-control" style="width:300px;"/>
									</div>
									<div style="float:right;">
										<a href="" class="form-control btn alert-primary">추가</a>
									</div>
								</form>
							</td>
						</tr>
						</tbody>	
					</table>
				</div>
			</div><!-- card 끝 -->
		</div><!-- col-lg-12 끝 -->
	</div>
</div>




<%@ include file="/WEB-INF/adminInc/adminFooter.jspf"%>