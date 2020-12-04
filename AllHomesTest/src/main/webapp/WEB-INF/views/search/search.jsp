<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 가로 폭 기준 1400px -->	
    <!-- bootstrap 중복방지를 위해 처음 시작과 끝에 div class container를 넣어줌 -->
<style>
  
#inner{margin:20px 0 20px 0;}

.txtbtn{float:right;color:#ee8374;}

.reptitle{
	color:black;
}
.repcontent{
	color:black;
}
.repprofile{
	color:black;
}


.card-body {
	height: 150px;
	padding: 10px;
	flex: none;
	overflow: hidden;
}

.card-img-top {
	border-radius: 5%;
	width: 320px;
	height: 207px;
	overflow: hidden;
}

.card-img-top>a>img {
	width: 325px;
	text-align: center;
}

.card {
	border: none;
}

.card-title {
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.card-title-post{
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	color:black;
}

.card-title>a:link, .card-title>a:visited, .card-title>a:hover,
	.card-title>a:active {
	text-decoration: none;
}

.card-text {
	font-size: 12px;
	color:black;
}

.card-text-profile {
	font-size: 18px;
	color:black;
}

.card-detail {
	font-size: 8px;
}

.keyword{
	color:#ee8374;
}


#repbox{border:1px solid #E98374;}
</style>
<script src="https://kit.fontawesome.com/69f9d4fad2.js" crossorigin="anonymous"></script>
<script>
	$(function(){
		var pNum = ${pCount};
		var hNum = ${hCount};
		
		if(pNum==0){
			$("#storeDiv").replaceWith("<div style='width:1400px;text-align:center;height:70px;line-height:70px;color:#EE8374'><h6>검색 결과가 존재하지 않습니다</h6></div>");
		} 
		if(hNum==0){
			$("#HBDiv").replaceWith("<div style='width:1400px;text-align:center;height:70px;line-height:70px;color:#EE8374'><h6>검색 결과가 존재하지 않습니다</h6></div>");
		}
	});

</script>


<div class="container"><!-- ==============container오류 방지 div============== -->
  	
  	<div id="inner">
  		<h7>'${key}'에 대한 통합검색 결과 <span class="keyword">1421412개</span></h7>
  		<hr>
  		<h7>스토어 <span class="keyword">${pCount}</span></h7><a href="#" class=txtbtn>더보기</a>
  	</div>
	<div id="storeDiv">
		<div class="row">
				<c:forEach var="pVo" items="${pList}" end="3">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card h-100">
							<div class="card-img-top text-center">
								<a href="#"><img
									src="<c:url value='/productMainImg/${pVo.s_no}/${pVo.main_img}'/>"
									alt="글번호" /></a>
							</div>
							<div class="card-body">
								<a href="#" class="card-text">${pVo.s_name}</a><br /> <a href="#"
									class="card-text">${pVo.pd_name}</a><br /> <a href="#"
									class="card-title">${pVo.price}</a>
							</div>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	<hr />



	<!-- ==============================================================집들이================================================================== -->
  		
  		
  		
  		
  		
  <div id="inner">
  	<h7>집들이 <span class="keyword">${hCount}</span></h7><a href="#" class=txtbtn>더보기</a>
  	</div>

	<div id="HBDiv">
		<div class="row">
			<c:forEach var="vo" items="${hList}" end="3">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-img-top">
							<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img
								src="<%=request.getContextPath() %>${vo.thumbnail }" /></a>
						</div>
						<div class="card-body">
							<div class="card-title">
								<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
							</div>
							<a href="#" class="card-text">${vo.userid }</a>
							<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr />

	<div id="inner">
  	<h7>질문과 답변 <span class="keyword">1244</span></h7><a href="#" class=txtbtn>더보기</a>
  	</div>
  	
  	
   <!-- ==============================================================게시판 글 시작================================================================== -->
    
    
    <div id=repbox>
    	<div class="row">
		
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong >
					<a href="#" class="reptitle">
					<br/>
						<span class="keyword">커튼</span>교체할때
					</a>
					</strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#" class="repcontent"><span class="keyword">커튼</span>형 행거 색깔이 촌스러워서 <span class="keyword">커튼</span>을 바꾸려고 해요 인테리어 고수님들~ 행거에 달 커튼은 주로 어디서 구입하시나요?</a>
				</p>
				
				<p>
					<i class="fas fa-user-circle"></i><a href="#" class="repprofile">뚝딱이네집</a>
					&nbsp;&nbsp; 2020-10-24
					&nbsp;&nbsp; 댓글 : 8
					&nbsp;&nbsp; 조회 : 2961 
					&nbsp;&nbsp; 
				</p>
			</div>
		</div>
		
		<!-- 두번쨰 -->
		<!-- 게시판 글 시작 -->
	<hr>
		<div class="row">
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="#" class="reptitle">
					<br/>
					이중 <span class="keyword">커튼</span> 봉 어디서 구매하나요?</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#" class="repcontent"><span class="keyword">커튼</span>을 암막커튼 두개로 이중으로 달고 싶은데 이중 <span class="keyword">커튼</span> 봉은 어디서 구입할 수 있을까요?</a>
				</p>
				
				<p>
					<i class="fas fa-user-circle"></i> <a href="#" class="repprofile">호호마녀</a>
					&nbsp;&nbsp; 2020-10-24
					&nbsp;&nbsp; 댓글 : 8
					&nbsp;&nbsp; 조회 : 2961 
					&nbsp;&nbsp; 
				</p>
			</div>
		</div>
				
	<hr>
		<div class="row">
			
			<div class="col-lg-9">
				<!-- 제목 -->
				<h4>
					<strong><a href="#" class="reptitle">
					<br/>
					못 없이 <span class="keyword">커튼</span> 다는 법</a></strong>
				</h4>
				<!-- 본문내용 -->
				<p>
				<a href="#" class="repcontent">커튼 다록 싶은데 압축봉에 <span class="keyword">커튼</span> 링 달고 압축봉 설치한 다음 <span class="keyword">커튼</span> 다는 거 맞나요??</a>
				</p>
				<p>
					<i class="fas fa-user-circle"></i> <a href="#" class="repprofile">뚝딱이네집</a>
					&nbsp;&nbsp; 2020-10-24
					&nbsp;&nbsp; 댓글 : 8
					&nbsp;&nbsp; 조회 : 2961 
					&nbsp;&nbsp; 
				</p>
			</div>
		</div>
    </div>	
   <br/><br/>
     
   
   
</div><!-- ==============container오류 방지 div============== -->