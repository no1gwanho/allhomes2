<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<div class="row">
		
		<div class="col-lg-3"><br/>
			<div class="card border-light mb-3 text-center"><!-- card시작 -->
				<div class="my-2"></div>
				<div style="float:right">
					<a href="" style="float:right">설정&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
					나의 쇼핑<a href="/myapp/mypageShopping" style="float:right;">더보기</a>
				</div>
				<div class="card-body"><!-- card-body 시작 -->
				
				
				<style>
					#myShopping{
						text-align:center;
					}
					#myShopping>div{
						float:left;
						text-align:center;
						border:1px solid lightblue;
						width:16%;
						margin:5px;
					}
					#myShopping hr{
						width:70%;
					}
				</style>
				
					<div class="col-lg-12" id="myShopping" class="center-block">
						<div><br/>입금 대기<hr>0건<br/><br/></div>
						<div><br/>결제완료<hr>0건<br/><br/></div>
						<div><br/>배송준비<hr>0건<br/><br/></div>
						<div><br/>배송중<hr>0건<br/><br/></div>
						<div><br/>구매확정<hr>0건<br/><br/></div>
					</div>
					
				</div>
			</div>
			
			<br/>
			<!-- 위시리스트 -->
			<div class="card card border-light mb-3">
				<div class="card-header">
					위시리스트<a href="/myapp/mypageWishlist" style="float:right;">더보기</a>
				</div>
				<div class="card-body"><!-- card-body 시작 -->
					<div style="width:100%;height:100px;text-align:center;line-height:100px;">
						아직 위시리스트에 담은 상품이 없습니다
					</div>
				</div><!-- card-body 끝 -->
			</div><!-- card끝 -->
			
			<br/>
			<!-- 스크랩 -->
			<div class="card card border-light mb-3">
				<div class="card-header">
					스크랩<a href="/myapp/mypageScrap" style="float:right;">더보기</a>
				</div>
				
				<style>
					
					#scrap>div>img{
						width:100%;
    					height:180px; 
   						background-position:center;
   						overflow:hidden;
					}
					#scrapImg>img:nth-child(2n+2){
						width:45px;
						height:45px;
					}
					#scrapImg{
						width:20%;
						margin-right:10px;
					}
					#scrap div{
						float:left;
						text-align:center;
					}
				</style>
				
				<div class="card-body"><!-- card-body 시작 -->
					<div id="scrap">
						<div id="scrapImg">
							<img src="/myapp/resources/img/main/ah01.jpg"/><br/>
							제목제목제목제목<br/>
							<img src="<%=request.getContextPath()%>/resources/img/mypage/user_basic.png"/>&nbsp;&nbsp;&nbsp;ID<br/>
							조회수:132 좋아요:32
						</div>
						
						<div id="scrapImg">
							<img src="/myapp/resources/img/main/ah02.jpg"/>
							<b>제목제목제목제목</b><br/>
							<img src="<%=request.getContextPath()%>/resources/img/mypage/user_basic.png"/>&nbsp;&nbsp;&nbsp;ID<br/>
							조회수:132 좋아요:32
						</div>
						
						<div id="scrapImg">
							<img src="/myapp/resources/img/main/ah03.jpg"/>
							<b>제목제목제목제목</b><br/>
							<img src="<%=request.getContextPath()%>/resources/img/mypage/user_basic.png"/>&nbsp;&nbsp;&nbsp;ID<br/>
							조회수:132 좋아요:32
						</div>
						
						<div id="scrapImg">
							<img src="/myapp/resources/img/main/ah04.jpg"/>
							<b>제목제목제목제목</b><br/>
							<img src="<%=request.getContextPath()%>/resources/img/mypage/user_basic.png"/>&nbsp;&nbsp;&nbsp;ID<br/>
							조회수:132 좋아요:32
						</div>
					</div>
				</div>
			</div>
			
			<br/>
			<!-- 나의 작성글-->
			<div class="card card border-light mb-3">
				<div class="card-header">
					나의 작성 글<a href="/myapp/mypageMyboard" style="float:right;">더보기</a>
				</div>
				
				<div class="card-body"><!-- card-body 시작 -->
					<div style="width:100%;height:100px;text-align:center;line-height:100px;">
							아직 작성한 글이 없습니다
					</div>
					
				
				</div>
			</div>
			
		</div><!-- col-lg-8끝 -->		
	</div>
</div>