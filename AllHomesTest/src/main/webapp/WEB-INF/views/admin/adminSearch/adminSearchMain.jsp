<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.bxslider.css" type="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.bxslider.js"></script>
<style>
td{
	height:40px;
	line-height:40px;
}
.sec3_list li {
	transition: 0.5s all;
	text-align:center;
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
	//bxslider
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

	var mCount = ${mCount} //회원 조회 결과 개수 
	var hCount = ${hCount} //집들이 게시판 조회 결과 개수 
	var sCount =  ${sCount} //스토어 조회 결과 개수 
	var pCount =  ${pCount} //상품 결과 개수
	
	if(mCount==0){
		$("#memberDiv").replaceWith("<div class='col-lg-12' style='text-align:center;'><h5 style='padding-top:120px'>검색 결과가 존재하지 않습니다</h5></div>");
	}
	if(pCount==0){
		$("#productTable").replaceWith("<div style='text-align:center;height:150px;'><h5 style='padding-top:60px'>검색 결과가 존재하지 않습니다</h5></div>");
	}
	if(sCount==0){
		$("#storeTable").replaceWith("<div style='text-align:center;height:150px;'><h5 style='padding-top:60px'>검색 결과가 존재하지 않습니다</h5></div>");
	}
	if(hCount==0){
		$("#HBTable").replaceWith("<div style='text-align:center;height:150px;'><h5 style='padding-top:60px'>검색 결과가 존재하지 않습니다</h5></div>");
	}
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
				<div class="card-body" style="overflow:hidden;height:320px" >
					<div id="memberDiv">
						<ul class="sec3_list">
							<c:forEach var="mVo" items="${mList}">
								<li><a href="/myapp/adminMemberDetail?m_no=${mVo.m_no}"><span><img
										src="/myapp/resources/img/mypage/user_basic.png" alt=""></span>
									<dl>
										<dt>${mVo.userid}</dt>
										<dd>
											${mVo.username}<br>${mVo.regdate}
										</dd>
									</dl></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				</div><!-- card body 끝 -->
			
			<!-- product -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Product</h6>
				</div>
				<div class="card-body" style="text-align: center" >
					<table style="cursor:pointer;" class="table table-hover" id="productTable">
						<thead>
							<tr>
								<th>제품 번호</th>
								<th>제품명</th>
								<th>카테고리</th>
								<th>재고</th>
								<th>상태</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pVo" items="${pList}">
								<tr onclick="location.href='/myapp/productEdit?pd_no=${pVo.pd_no}'">
									<td>${pVo.pd_no}</td>
									<td>${pVo.pd_name}</td>
									<td>${pVo.sub_c}</td>
									<td>${pVo.stock}</td>
									<td>${pVo.status}</td>
									<td>521</td>
								</tr>
							</c:forEach>
						</tbody>	
					</table>
				</div>
			</div>
			
			
			
			<!-- store -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary"
						style="float: left">Store</h6>
				</div>
				<div class="card-body" style="text-align: center">
					<table style="cursor:pointer;" class="table table-hover" id="storeTable">
					<thead>
					<tr>
						<th>번호</th>
						<th>스토어명</th>
						<th>사업자등록번호</th>
						<th>프로필</th>
						<th>ID</th>
						<th>담당자 Tel</th>
						<th>입점일</th>
					</tr>
					</thead>
					<tbody>
					
					<c:forEach var="vo" items="${sList}">
					<tr onClick="location.href='/myapp/adminStoreDetail?s_no=${vo.s_no}'">
						
						<td>${vo.s_no}</td>
						<td>${vo.s_name}</td>
						<td>${vo.s_num}</td>
						<td>
							<img src="<c:url value='/storeImg/${vo.s_pic}'/>" style="width:50px;height:50px; border-radius:70%;"/>
						</td>
						<td>${vo.s_id}</td>
						<td>${vo.staff_t}</td>
						<td>${vo.openingdate}</td>
					</tr>
					</c:forEach>
					
					</tbody>	
				</table>

				</div>
			</div>
			
			
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 col-lg-6 font-weight-bold text-primary" style="float:left">HomeBoard</h6>
				</div>
				<div class="card-body" style="text-align: center" >
					<table style="cursor: pointer;" class="table table-hover" id="HBTable">
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

					
				</div>
				<!-- card-body끝 -->
			</div>
			
		</div>

	</div>
</div>