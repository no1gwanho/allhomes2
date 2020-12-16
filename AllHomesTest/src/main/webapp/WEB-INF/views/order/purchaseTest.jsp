<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP;
IMP.init('가맹점 식별 코드 a store identification code');
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'vbank',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});
</script>



<br/><br/>
${vo.c_no}<br/>
${vo.a_code}<br/>
${vo.m_no}<br/>
${vo.total_p}<br/>
${vo.memo}<br/>
${vo.shipping_c}<br/>
${vo.payment}<br/>
${name}<br/>
<c:forEach var="c" items="${String}">
${c}<br/>
</c:forEach>
<hr/>

${pVO.itemName}<br/>
${pVO.total_p}<br/>
${pVO.method}<br/>
<br/>
${pVO.pd_name}
${pVO.price}
${pVO.num}
<br/>

${pVO.addr}<br/>
${pVO.tel}<br/>
${pVO.userid}<br/>
<c:set var="num"/>
