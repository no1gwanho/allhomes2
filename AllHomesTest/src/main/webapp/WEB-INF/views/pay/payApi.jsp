<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="veiwport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/etc/bootstrap.js"></script>
</head>
<body>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript">
import BootPay from "bootpay-js"</script>
<script>
BootPay.request({
    price: '${pVO.total_p}', //실제 결제되는 가격
    name: '${pVO.itemName}', //결제창에서 보여질 이름
    pg: 'danal',
    show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
    items: [
        {
            item_name: '나는 아이템', //상품명
            qty: 1, //수량
            unique: '123', //해당 상품을 구분짓는 primary key
            price: 1000, //상품 단가
            
        }
    ],
    
    user_info: {
        username: '${pVO.userid}',
        addr: ' ${pVO.addr}',
        phone: '${pVO.tel}'
    },
    method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
    order_id: '고유order_id_1234', //관리하시는 고유 주문번호를 입력해주세요
    params: {
      callback1: '그대로 콜백받을 변수 1',
      callback2: '그대로 콜백받을 변수 2',
      customvar1234: '변수명도 마음대로'
    },
}).error(function (data) {
    //결제 진행시 에러가 발생하면 수행됩니다.
    console.log(data);
}).cancel(function (data) {
    //결제가 취소되면 수행됩니다.
    console.log(data);
}).confirm(function (data) {
    //결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
    //주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
    console.log(data);
    if(somthing) { // 재고 수량 관리 로직 혹은 다른 처리
      this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
    } else {
      this.removeWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
    }
}).done(function (data) {
    //결제가 정상적으로 완료되면 수행됩니다
    //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
    console.log(data);
});
</script>
</body>
</html>