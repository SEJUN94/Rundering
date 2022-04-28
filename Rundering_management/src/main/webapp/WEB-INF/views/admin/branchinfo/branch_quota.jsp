<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set value="${dataMap.pageMaker }" var="pageMaker"></c:set>
<c:set value="${dataMap.pageMaker.cri }" var="cri"></c:set>
<c:set value="${dataMap.throughputList }" var="throughputList"></c:set>

<style>
</style>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<title>주문량</title>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>지점전체조회</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">지점관리</li>
						<li class="breadcrumb-item active">지점전체조회</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<div class="row ml-3 mr-3 p-0" style="height:425.55px;">
		<div class="card col-12 p-0">
			<div class="card-header">
				<div class="input-group input-group-sm float-right" style="width: 300px;">
					<select class="form-control col-md-4" name="searchType"
						id="searchType">
						<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>지점장</option>
						<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>지점명</option>
					</select> <input class="form-control" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value=""> <span
						class="input-group-append">
						<button class="btn btn-primary" type="button"
							onclick="list_go(1);" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div>
				<input type="date" class="float-right mr-3" onchange="" id="date">
			</div>
			<div class="card-body p-0">
				<table class="table table-striped projects"
					style="text-align: center;">
					<thead>
						<tr>
							<th style="width: 10%">지점장</th>
							<th style="width: 20%">지점</th>
							<th>주문량</th>
							<th style="width: 12%">세탁상세</th>
						</tr>
					</thead>
					<tbody style="font-size:0.9em;	">
						<c:if test="${empty throughputList }">
							<tr>
								<td colspan="5" style="text-align: center;"><strong>해당
										내용이 없습니다.</strong></td>
							</tr>
						</c:if>
						<c:forEach items="${throughputList }" var="throughput">
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/branchinfo/infodetail?branchCode=${throughput.branchCode } ','지점상세', 'width=800, height=800')"
								style="cursor: pointer;">
								<td>${throughput.name }</td>
								<td>${throughput.branchName }</td>
								<td class="project_progress"><c:if
										test="${throughput.quotaPercent gt 0 and throughput.quotaPercent le 60}">
										<div class="progress progress-sm">
											<div class="progress-bar bg-green" role="progressbar"
												aria-valuenow="${throughput.quotaPercent }"
												aria-valuemin="0" aria-valuemax="100"
												style="width: ${throughput.quotaPercent}%"></div>
										</div>
									</c:if> <c:if
										test="${throughput.quotaPercent gt 60 and throughput.quotaPercent le 80 }">
										<div class="progress progress-sm">
											<div class="progress-bar bg-warning" role="progressbar"
												aria-valuenow="${throughput.quotaPercent }"
												aria-valuemin="0" aria-valuemax="100"
												style="width: ${throughput.quotaPercent}%"></div>
										</div>
									</c:if> <c:if
										test="${throughput.quotaPercent gt 80 and throughput.quotaPercent le 101 }">
										<div class="progress progress-sm">
											<div class="progress-bar bg-red" role="progressbar"
												aria-valuenow="${throughput.quotaPercent }"
												aria-valuemin="0" aria-valuemax="100"
												style="width: ${throughput.quotaPercent}%"></div>
										</div>
									</c:if> <small> ${throughput.quotaPercent }%</small></td>
								<td>
									<button class="btn btn-warning btn-sm"
										onclick="">세탁상세</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/admin/employee/pagination.jsp" %>
			</div>
		</div>
	</div>
	<div class="row ml-3 mr-3 p-0" style="height: 280px; width: 98%">
		<div class="card p-0" style="width: 49%; font-size:0.9em;">
			<div class="card-header">
				<div>
					<h3 class="card-title" style="font-size:0.9em;">차트</h3>
				</div>
			</div>
			<div class="card-body">
				<div style="width: 100%;">
					<canvas id="canvas"></canvas>
				</div>
			</div>
		</div>
		<div style="width: 1%;"></div>

		<div style="width: 49%; font-size:0.9em;" class="card p-0">
			<div class="card-header">
				<div>
					<h3 class="card-title" style="font-size:0.9em;">표</h3>
				</div>
			</div>
			<div class="card-body" style="height:300px;">
				<table border="1" class="table table-sm">
					<thead>
						<tr>
							<th style="width:112px;">날짜</th>
							<th style="width:112px;">세탁가능량</th>
							<th style="width:112px;">할당세탁량</th>
							<th style="width:112px;">세탁량(%)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
						<tr>
							<td>2022-04-28</td>
							<td>500</td>
							<td>198</td>
							<td>39.8(%)</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script>
var CHARTEX = $('#canvas');
var barChartExample = new Chart(CHARTEX , {
    type: 'bar',
    data: {
        labels: [1, 2,3, 4, 5, 6, 7 ],
        datasets: [{
                label: "세탕량(%)",
                data: [15, 60, 56, 60, 6, 45, 1],
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
    },
    options: {
        responsive: true,
        legend: {
            position: 'bottom',
        },
        hover: {
            mode: 'label'
        },
        scales: {
            yAxes: [{
                    display: true,
                    ticks: {
                        beginAtZero: true,
                        steps: 20,
                        stepValue: 10,
                        max: 100
                    }
                }]
        },
        title: {
            display: true,
            text: '일별 세탁량'
        }
    }
});
</script>

<script>
var realDate = new Date();
var today = new Date().toLocaleDateString();
var yesterday = new Date(realDate.setDate(realDate.getDate() - 1)).toLocaleDateString();

document.querySelectorAll('table')[1].querySelectorAll('td')[0].innerText=today;
document.querySelectorAll('table')[1].querySelectorAll('td')[4].innerText=yesterday;


var t = document.getElementById('date');
t.addEventListener('change', function(){
	var today=String(t.value);
	alert(t.value)
});
</script>

</body>



