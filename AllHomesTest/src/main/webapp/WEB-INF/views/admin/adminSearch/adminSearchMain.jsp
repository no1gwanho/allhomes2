<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<script>
	$(function(){
		$('.bxslider').bxSlider({
			auto:true,
			pager: false,
			controls: true,
			autoControls: false,
			minSlides: 1,
			moveSlides: 1,
			slideMargin: 0,
			autoHover:true,
			prevText:"",
			nextText:""			
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
				<div class="card-body" style="overflow:hidden;height:300px">
					<div class="bxslider">
						<ul>
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color: lightblue; float: left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color:lightblue;float:left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color: lightblue; float: left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
							
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color: lightblue; float: left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
							
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color: lightblue; float: left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
							
							<li>
								<div class="col-lg-3 mr-3"
									style="background-color: lightblue; float: left;">
									<img src="/myapp/resources/img/mypage/user_basic.png"
										style="width: 80%" /><br />
									<p>
										<span>seran11</span>
									</p>
									<p>
										<span>권세란</span>
									</p>
								</div>
							</li>
						</ul>
					</div>

				</div><!-- card body 끝 -->
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
			
			
			<!-- HomeBoard -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Homeboard</h6>

				</div>
				<div class="card-body" style="text-align: center">
					

				</div>
			</div>
			
		</div>

	</div>
</div>