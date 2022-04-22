<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</head>
<body>
	<div class="row ml-3 mr-3">
		<div class="card col-12">
			<table class="table table-striped projects">
				<thead>
					<tr>
						<th style="width: 20%">지점장</th>
						<th style="width: 20%">지점</th>
						<th>주문량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>${throughput.branchName }</td>
						<td class="project_progress">
							<div class="progress progress-sm">
								<div
									class="progress-bar
									<c:if test="${throughput.quotaPercent le 60}">
								 bg-green
								 	</c:if>
								 	<c:if test="${throughput.quotaPercent gt 60 and throughput.quotaPercent le 80 }">
								 bg-warning
								 	</c:if>
								 	<c:if test="${throughput.quotaPercent gt 80 and throughput.quotaPercent le 101 }">
								 bg-red
								 	</c:if>"
									role="progressbar" aria-valuenow="${throughput.quotaPercent }"
									aria-valuemin="0" aria-valuemax="100"
									style="width: ${throughput.quotaPercent}%"></div>
							</div> <small> ${throughput.quotaPercent }%</small>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div style="width:800px;height:500px" class="ml-3 mr-3">
		<canvas id="myChart" width="800" height="400"></canvas>
	</div>
<script>
    var f_click = function(){
        
        //처음 만들때 갯수에 맞추어야 함(현실도 그러함)
        var v_ranData = []; 
        for(var i=1; i<=8; i++){
            v_ranData.push(Math.ceil(Math.random()*100));
        }

       // myChart.data.datasets[0].data = [1,2,3,4,5,6,7,8];  // 쓰기도 가능한 가 확인
       myChart.data.datasets[0].data = v_ranData;  // 쓰기도 가능한 가 확인
       myChart.data.datasets[1] = v_anotherDataSet;
       myChart.data.labels=['R', 'B', 'Y', 'G', 'P', 'O','T','N'];
       setTimeout(f_click,500);
    }
    var ctx = document.getElementById('myChart').getContext('2d');
    //그래픽엔진 가져오기(openGL)  마이크로소프트는 directX를 가지고 있어용
    var myChart = new Chart(ctx, {
    type: 'line', // bar, line,doughnut, pie,radar등이 자주 쓰이는 차트
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'], // x축 값
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
</body>
</html>