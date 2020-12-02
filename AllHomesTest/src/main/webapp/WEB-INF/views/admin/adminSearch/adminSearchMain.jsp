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