<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="container">
	<div class="row">
		
		<div class="col-lg-3"><br/>
			<div class="card border-light mb-3 text-center"><!-- card시작 -->
				<div class="my-2"></div>
				<div style="float:right">
					<a href="/myapp/mypageEdit" class="btn btn-user alert-clean shadow-sm" style="float:right;color:#bbbbbb">설정</a>
				</div>
				<!-- card body 시작 -->
				<div class="card-body my-auto">
					<img class="card-img-top" src="<%=request.getContextPath()%>/resources/img/mypage/user_basic.png" alt="Card image cap" style="width:200px;">
					<div class="my-2"></div>
					<div><!-- 닉네임 -->
						<br/><h4>seran22</h4><br/>
					</div>
					<hr style="width:70%"><br/>
					
					<!-- 위시리스트, 스크랩 -->
					<div style="float:left; margin-left:40px;">
						<img src="<%=request.getContextPath()%>/resources/img/mypage/wishlist.png" style="width:60px"/><br/>
						<a href="">위시리스트</a>
					</div style="float:right">
					<div>
						<img src="<%=request.getContextPath()%>/resources/img/mypage/like.png" style="width:60px"/><br/>
						<a href="">스크랩</a>
					</div>
					
				</div><!-- card-body 끝 -->
				<hr>
			</div><!-- card 끝 -->
		</div><!-- col-lg-2끝 -->
		
		<div class="col-lg-9"><br/>
			<div class="card card border-light mb-3">
				<div class="card-header">
					나의 배송지
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					<c:forEach var="vo" items="${aList}">
						<form method="post" action="<%=request.getContextPath()%>/addressEdit?a_code=${vo.a_code}">
							<div class="col-lg-9">
								<div class="row">
									<input type="hidden" name="a_code" value="${vo.a_code}"/>
									<input type="hidden" name="a_code" value="${vo.m_no}"/>
									<div class="col-lg-3 mb-3 mt-3">수신자</div>
									<input class="col-lg-9  mb-3 mt-3 form-control" name="receiver" value="${vo.receiver}"/>
									
									<div class="col-lg-3 mb-3">우편번호</div>
									<input class="col-lg-3 mb-3 form-control" name="zipcode" value="${vo.zipcode}"/>
									<button class="btn alert-secondaryr col-lg-2" value="우편번호 검색"></button><br/>
									
									<div class="col-lg-3 mb-3">주소</div>
									<input class="col-lg-9 mb-3 form-control" name="addr" value="${vo.addr}"/>
									
									<div class="col-lg-3 mb-3">상세 주소</div>
									<input class="col-lg-9 mb-3 form-control" name="addrdetail" value="${vo.addrdetail}"/>
									
									<div class="col-lg-3 mb-3">연락처</div>
									<input class="col-lg-9 mb-3 form-control" name="tel" value="${vo.tel}"/><br/>
									
									<button type="submit" class="col-lg-1">수정</button>
								</div>	
							</div>
						</form>
						<hr/>
					</c:forEach>
				
					
				</div>
			</div>
			
			<br/>
			
			
			<br/>
			<!-- 나의 작성글-->
			<div class="card card border-light mb-3">
				<div class="card-header">
					배송지 추가
				</div>
				
				<div class="card-body"><!-- card-body 시작 -->
					
					
				</div>
			</div>
			
		</div><!-- col-lg-8끝 -->		
	</div>
</div>