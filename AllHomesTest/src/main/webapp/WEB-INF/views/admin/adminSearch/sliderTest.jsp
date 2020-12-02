<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<style>
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



</style>
<script>
	$(function(){
		$('.sec3_list').bxSlider({
			auto : false,
			pager : false,
			controls : true,
			autoControls : false,
			minSlides : 4,
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
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Member</h6>

				</div>
				<div class="card-body" style="overflow: hidden; height: 440px">
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
			</div>



			<!-- store -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Store</h6>

				</div>
				<div class="card-body" style="text-align: center">
					

				</div>
			</div>
		</div>
	</div>
</div>
