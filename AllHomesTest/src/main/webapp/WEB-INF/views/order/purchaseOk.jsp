<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.col-3, .col-lg-3, .col-xs-6 {
	text-align: center;
	margin-bottom: 10px;
}

.container {
	font-family: 'SCDream3';
}

#detail td {
	height: 150px;
	line-height: 150px;
}
</style>
<div class="container">
	<div class="col-lg-12">

		<div class="col-lg-12" style="text-align: center; margin-top: 120px;">
			<h1>
				<b>주문 완료!</b>
			</h1>
			<img
				src="<%=request.getContextPath()%>/resources/img/payment/box.png"
				style="width: 200px; margin-top: 30px; margin-bottom: 100px" />
		</div>

		<div class="card mb-3" style="border: 0px">
			<div class="card-header">주문 정보</div>
			<div class="card-body">
				<div class="col-lg-12" style="text-align: center">
					<div class="col-lg-10" style="display: inline-block">

						<div class="row mt-3 mb-3" style="text-align: right">
							
							<div class="col-lg-3">
								<h3>주문번호</h3>
							</div>
							<div class="col-lg-9">
								<h3>${pc_no}</h3>
							</div>
							<div class="col-lg-3">
								<h3>제품명</h3>
							</div>
							<div class="col-lg-9">
								<h3>${itemName}</h3>
							</div>
							<div class="col-lg-3">
								<h3>결제액</h3>
							</div>
							<div class="col-lg-9">
								<h3>${pVO.total_p+pVO.shipping_c}원</h3>
							</div>
						</div>

						<table class="table col-lg-12">
							<tr>
								<td>구매자 ID</td>
								<td>${vo.userid}</td>
							</tr>
							<tr>
								<td>수신자</td>
								<td>${aVO.receiver}</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${aVO.tel}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>[${aVO.zipcode}] ${aVO.addr} ${aVO.addrdetail}</td>
							</tr>
							<tr>
								<td>메모</td>
								<td>${pVO.memo}</td>
							</tr>
						</table>
						<br />
						<br />

					</div>
				</div>

				<div class="card mb-3" style="border: 0px">
					<div class="card-header">결제 상세</div>
					<div class="card-body">
						<div class="col-lg-12" style="text-align: center">
							<div class="col-lg-10" style="display: inline-block">

								<table class="table col-lg-12" id="detail">
									<thead>
										<tr>
											<th>IMAGE</th>
											<th>상품명</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${oList}">
											<tr />
											<input type="hidden" value="${vo.c_no}" />
											<td><img
												src="<%=request.getContextPath()%>/resources/upload/productMainImg/${vo.s_no}/${vo.main_img}"
												style="height: 150px;" /></td>
											<td>${vo.pd_name } [옵션:${vo.o_value}]</td>
											<td>${vo.num}개</td>
											<td>${vo.price * vo.num}원</td>
											<tr />
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- card 끝 -->
		</div>
	</div>
	</div>