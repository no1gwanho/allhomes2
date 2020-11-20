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
	price: '100', 
	application_id: "59a4d323396fa607cbe75de4",
	name: '블링블링 마스카라', 
	pg: 'inicis',
	method: 'card', 
	show_agree_window: 0, 
	items: [
		{
			item_name: '블링블링 마스카라', 
			qty: 1, 
			unique: '123', 
			price: 1000, 
			cat1: 'TOP', 
			cat2: '티셔츠', 
			cat3: '라운드 티', 
		}
	],
	user_info: {
		username: '사용자 이름',
		email: 'yoursoul4u@naver.com',
		addr: '사용자 주소',
		phone: '010-1234-4567'
	},
	order_id: '고유order_id_1234', 
	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	account_expire_at: '2020-10-25', 
	extra: {
	    start_at: '2019-05-10', 
	    end_at: '2022-05-10', 
        vbank_result: 1, 
        quota: '0,2,3',
		theme: 'purple', 
		custom_background: '#00a086', 
		custom_font_color: '#ffffff' 
	}
}).error(function (data) {
	console.log(data);
}).cancel(function (data) {
	console.log(data);
}).ready(function (data) {
	console.log(data);
}).confirm(function (data) {
	console.log(data);
	var enable = true; 
	if (enable) {
		BootPay.transactionConfirm(data); 
	} else {
		BootPay.removePaymentWindow(); 
	}
}).close(function (data) {
    console.log(data);
}).done(function (data) {
	console.log(data);
});
</script>
</body>
</html>