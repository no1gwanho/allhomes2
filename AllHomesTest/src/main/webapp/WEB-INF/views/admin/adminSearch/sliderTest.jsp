<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<style>
#banner {
	background: #f4f4f4;
	padding: 50px 0;
}

.banner_inner {
	width: 1200px;
	margin: 0 auto;
}

.banner_inner h2 {
	font-size: 30px;
	color: #444;
	line-height: 1;
	text-align: Center;
}

#banner_list {
	position: relative;
	height: 370px;
	margin-top: 50px;
}

#banner_list:before {
	content: "";
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.5);
	z-index: 1;
}

#banner_list:after {
	content: "";
	position: absolute;
	top: 0;
	right: -100%;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.5);
	z-index: 2;
}

#banner .bx-viewport {
	overflow: visible !important;
}

.sec3_list li {
	transition: 0.5s all;
}

.sec3_list li span {
	display: block;
	position: relative;
	height: 200px;
	border-radius: 15px;
	overflow: hidden;
}

.sec3_list li span img {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	max-width: 100%;
	max-height: 100%;
	background-color: cadetblue;
}

.sec3_list li dl {
	height: 170px;
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

a.bx-prev {
	position: absolute;
	left: -70px;
	top: 50%;
	transform: translateY(-50%);
	width: 50px;
	height: 50px;
	background: url(슬라이드 이전버튼 이미지 주소) no-repeat;
	z-index: 100;
}

a.bx-next {
	position: absolute;
	right: -70px;
	top: 50%;
	transform: translateY(-50%);
	width: 50px;
	height: 50px;
	background: url(슬라이드 다음버튼 이미지 주소) no-repeat;
	z-index: 100;
}
</style>
<script>
	$(function(){
		
	
		$('.sec3_list').bxSlider({
			auto : true,
			pager : false,
			controls : true,
			autoControls : false,
			minSlides : 4,
			maxSlides : 4,
			moveSlides : 1,
			slideWidth : 285,
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
			<div id="banner">
				<div class="banner_inner">
					<div id="banner_list">
						<ul class="sec3_list">
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 1</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 2</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 3</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 4</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 5</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
							<li><span><img src="/myapp/resources/img/Sweet Morning.jpg" alt=""></span>
								<dl>
									<dt>배너슬라이드 6</dt>
									<dd>
										배너슬라이드입니다.<br>설명 및 내용 텍스트.
									</dd>
								</dl></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
