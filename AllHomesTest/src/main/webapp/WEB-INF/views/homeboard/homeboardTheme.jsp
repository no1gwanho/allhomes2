<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#homeboardTitle {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 20px;
}

.card-body {
	height: 200px;
	padding: 10px;
	flex: none;
	overflow: hidden;
}

.card-top {
	width: 320px;
	height: 207px;
}

.card-img-top {
	border-radius: 5%;
	width: 320px;
	height: 205px;
	overflow: hidden;
	border:0.2px solid #f2f2f2;
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

.card-title>a:link, .card-title>a:visited, .card-title>a:hover,
	.card-title>a:active {
	text-decoration: none;
}

.card-text {
	font-size: 16px;
}

.card-detail {
	font-size: 12px;
}

.card-body{
		height:150px;
	}

.nav {
	margin: 20px;
}

.btn-homes-nonselect {
  color: white;;
  background-color:#8f8d8d;
}


.btn-homes-nonselect:hover {
  color: white;
  background-color: #E98374;
}

.btn-homes{
	color: white;
	background-color: #E98374;
}

</style>

<script>
	$(function(){
		
		var hb_theme_no = $('#hb_theme_no').val();
		
		if(hb_theme_no == 0){
			$('#theme0').addClass("btn-homes");
		}else if(hb_theme_no==1){
			$('#theme1').addClass("btn-homes");
		}else if(hb_theme_no==2){
			$('#theme2').addClass("btn-homes");
		}else if(hb_theme_no==3){
			$('#theme3').addClass("btn-homes");
		}else if(hb_theme_no==4){
			$('#theme4').addClass("btn-homes");
		}else if(hb_theme_no==5){
			$('#theme5').addClass("btn-homes");
		}
		
		
		$('#theme0').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=0";	
		});
		$('#theme1').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=1";	
		});
		$('#theme2').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=2";	
		});
		$('#theme3').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=3";	
		});
		$('#theme4').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=4";	
		});
		$('#theme5').click(function(){
			location.href="/myapp/homeboardTheme?hb_theme_no=5";	
		});
		
		
		
	});

</script>

<div class="container">
	<h3 id="homeboardTitle">테마별 집들이</h3>

<!-- 탭메뉴  -->
	<div id="themeMenuBtn">
		<input type="hidden" id="hb_theme_no" value="${hb_theme_no }">
		<button type="button" class="btn btn-homes-nonselect" id="theme0">전체</button>
		<button type="button" class="btn btn-homes-nonselect" id="theme1">코지/내추럴</button>
		<button type="button" class="btn btn-homes-nonselect" id="theme2">러블리/로맨틱 </button>
		<button type="button" class="btn btn-homes-nonselect" id="theme3">모던</button>
		<button type="button" class="btn btn-homes-nonselect" id="theme4">빈티지/레트로</button>
		<button type="button" class="btn btn-homes-nonselect" id="theme5">한국/아시아</button>
	
	</div>

	<br/>
	<br/>
	
			<!-- 내용시작 -->
			<div class="row text-center">
			<c:forEach var="vo" items="${themeList}">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-img-top">
							<a href="/myapp/homeboardView?b_no=${vo.b_no }"><img src="<%=request.getContextPath()%>${vo.thumbnail }"/></a>
						</div>
						<div class="card-body">
							<div class="card-title">
								<a href="/myapp/homeboardView?b_no=${vo.b_no }">${vo.title }</a>
							</div>
							<a href="#" class="card-text">${vo.userid}</a>
							<p class="card-detail">스크랩: ${vo.scrap } | 조회: ${vo.hit }</p>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		

</div>