<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[type=checkbox]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[type=checkbox]").prop("checked",false);
        }
    })
})
</script>
<br/>
<div class="container">
<h2>장바구니</h2>
	<div class="row">
		<div class="col-md-7">
			<input type ="checkbox" id="checkAll" style="background-color:#ee8374;"/>&nbsp;모두 체크
		</div>
		<div class="col-md-2"><button class="btn btn" style="font-size:0.8em;background-color:#ee8374;color:#fff;border:0;">선택삭제</button></div>
	</div>
	<br/>
	<form method="post" action="/myapp/order?userid=${c.userid }">
		<c:forEach var="c" items="${list }">
			<div class="row" style="margin-top:15px;">
				<div class="col-3">
					<input type="checkbox" name="chk">
					<img style="maring-left:15px;width:150px; height:120px;" src="<%=request.getContextPath()%>/resources/upload/productMainImg/${c.s_no}/${c.main_img}"/>
				</div>
				<div class="col-9" style="margin-left:15px;text-align:center">
					<span style="font-size:0.8em;">상품명 : ${c.pd_name }<br/>
						<c:if test="${c.o_value == null }">
							옵션 : 없음
						</c:if>
						<c:if test="${c.o_value != null }">
							옵션 : ${c.o_value}	
						</c:if>	&nbsp;&nbsp;/&nbsp;&nbsp;
						수량 : ${c.num }개<br/>
					</span>
					<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">수정</button>&nbsp;&nbsp;
					<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;">삭제</button>
				</div>
			</div>
			<div class="row" style="border-bottom:1px solid #eee;padding:15px;">
				<div class="col-7">
					<span style="font-size:0.8em;">
						결제금액 : ${c.discount }원	&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
						배송비 : ${c.shipping_c }원
					</span>
				</div>
				<div class="col-5">
					<input type="submit" class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;" value="상품구매"/>
					<button class="btn btn" style="font-size:0.7em;background-color:#ee8374;color:#fff;border:0;margin-top:15px;">위시리스트</button>
				</div>
			</div>
		</c:forEach>
	</form>
</div>

<br/>