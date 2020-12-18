<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트그리기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="/myapp/resources/vendor/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>
	<canvas id="pieChart"></canvas>
<script>

		var ctxP = document.getElementById("pieChart").getContext('2d');
		var myPieChart = new Chart(ctxP, {
		type: 'pie',
		data: {
		labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
		datasets: [{
		data: [300, 50, 100, 40, 120],
		backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
		hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
		}]
		},
		options: {
		responsive: true
		}
		});

</script>
	
	<script>
	//doughnut
	var ctxD = document.getElementById("doughnutChart").getContext('2d');
	var myLineChart = new Chart(ctxD, {
	type: 'doughnut',
	data: {
	labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
	datasets: [{
	data: [300, 50, 100, 40, 120],
	backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
	hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
	}]
	},
	options: {
	responsive: true
	}
	});
	</script>
</body>
</html>
