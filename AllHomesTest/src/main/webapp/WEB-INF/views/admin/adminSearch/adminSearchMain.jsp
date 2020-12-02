<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<style>
.sec3_list li {
	transition: 0.5s all;
}

.sec3_list li span {
	margin-top:25px;
	display: block;
	position: relative;
	height: 100px;
	border-radius: 15px;
	overflow: hidden;
}

.sec3_list li span img {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 100px;
	height: 100px;
	background-color: cadetblue;
}

.sec3_list li dl {
	height: 130px;
	padding: 25px;
	background: #fff;
	transition: 0.5s all;
}

.sec3_list li dl dt {
	font-size: 20px;
	color: #444;
	line-height: 1;
	font-weight: bold;
}

.sec3_list li dl dt:after {
	content: "";
	display: block;
	width: 20px;
	height: 2px;
	background: red;
	margin-top: 10px;
}

.sec3_list li dl dd {
	font-size: 14px;
	color: #444;
	margin-top: 10px;
}

.sec3_list li:hover {
	transform: translateY(-20px);
}

.sec3_list li:hover dl {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, .15);
}
</style>

<script>
$(function(){
	$('.sec3_list').bxSlider({
		auto : false,
		pager : false,
		controls : true,
		autoControls : false,
		minSlides : 1,
		maxSlides : 20,
		moveSlides : 3,
		slideWidth : 302,
		slideMargin : 20,
		autoHover : true,
		prevText : "",
		nextText : ""
	});

});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
		
			<!-- member -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member</h6>

				</div>
				<div class="card-body" style="overflow:hidden;height:320px">
					<div id="banner_list">
						<ul class="sec3_list">
							<li><span><img
									src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 1</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img
									src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 2</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img
									src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 3</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img
									src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 4</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img
									src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 5</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img
									src="/http://localhost:9090/myapp/sliderTestmyapp/resources/img/Sweet Morning.jpg"
									alt=""></span>
								<dl>
									<dt>배너슬라이드 6</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
						</ul>
					</div>
				</div>
				</div><!-- card body 끝 -->
			
			
			<!-- store -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Store</h6>

				</div>
				<div class="card-body" style="text-align: center">
					

				</div>
			</div>
			
			
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary" style="float:left">HomeBoard</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor: pointer;" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>테마</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>스크랩</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${hList}">
								<tr onClick="location.href='/myapp/adminHomeBoardView?b_no=${vo.b_no}'">
									<td>${vo.b_no}</td>
									<td>${vo.title}</td>
									<td>${vo.theme}</td>
									<td>${vo.userid}</td>
									<td>${vo.writedate}</td>
									<td>${vo.hit}</td>
									<td>${vo.scrap}</td>
									<td><a href="#" class="btn alert-secondary btn-circle"> <i
											class="fas fa-trash"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- pagination -->
					<div style="display: inline-block">
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


				</div>
				<!-- card-body끝 -->
			</div>
			
		</div>

	</div>
</div>