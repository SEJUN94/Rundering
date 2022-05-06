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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
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
	<div class="row ml-3 mr-3 p-0">
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
				<input type="date" class="float-right mr-3" onchange='changeDate(this)' id="todayDate" max="2022-05-05">
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
								onclick="branchTable('${throughput.branchCode }');"
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
										onclick="window.open('<%=request.getContextPath()%>/admin/branchinfo/infodetail?branchCode=${throughput.branchCode } ','지점상세', 'width=800, height=800')">세탁상세</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer" style="font-size:0.9em;">
				<%@ include file="/WEB-INF/views/admin/employee/pagination.jsp" %>
			</div>
		</div>
	</div>
	<div class="row ml-3 mr-3 p-0" style="height: 280px; width: 98%">
		<div class="card p-0" style="width: 49%; font-size:0.9em;">
			<div class="card-body">
				<div style="width: 100%;">
					<canvas id="canvas"></canvas>
				</div>
			</div>
		</div>
		<div style="width: 1%;"></div>

		<div style="width: 49%; font-size:0.9em;" class="card p-0">
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
						<c:forEach begin="1" end="7">
							<tr>
								<td class="week"></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
window.addEventListener('load', onloadWeek);
var now = null;
function onloadWeek(){
	now = moment(todayDate.value, "YYYY-MM-DD");
	for(var i=0; i<7; i++){
		document.querySelectorAll('tr .week')[i].innerHTML = now.format('YYYY-MM-DD');
		now.subtract(1, "days").format('YYYY-MM-DD');
	}
}

var todayDate = document.getElementById('todayDate')
todayDate.value = new Date().toISOString().substring(0, 10);
document.querySelector('#todayDate').setAttribute("max", todayDate.value);


function branchTable(branchCode){
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/branchinfo/sumdata',
		data : {
			'branchCode' : branchCode,
			'date' : now
		},
		type : 'post',
		success : function(ok) {
			onloadWeek();
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>
<script>

function changeDate(cDate){
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/branchinfo/datedata',
		data : {
			'date' : cDate.value
		},
		type : 'post',
		success : function(ok) {
			onloadWeek();
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

<script>

function changeTableData(branchCode){
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/branchinfo/sumdata',
		data : {
			'branchCode' : branchCode,
			'date' : cDate.value
		},
		type : 'post',
		success : function(ok) {
			onloadWeek();
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

<script>
$(data.branchList).each(function(i) {
	 if(data.branchList[i].branchCode == '000000'){
		 return;
	 }
	 //해당지점 현재 처리중인 주문량 / 지점의 세탁가능수량 * 100)
	  let excessCapacity = data.excessCapacityList.filter(branch => branch.branchCode == data.branchList[i].branchCode);
	  let processingRate = (data.branchList[i].branchLndrpcrymslmcoqy - excessCapacity[0].branchLndrpcrymslmcoqy)  / data.branchList[i].branchLndrpcrymslmcoqy * 100
	  let bgColor =  "bg-primary";
	  if(processingRate >= 90){  
		  bgColor = "bg-danger";
	  }else if(processingRate >= 70){
		  bgColor = "bg-warning";
	  }
		 let branchAdd = "<tr style='cursor: pointer;' onclick='selectbranch(this);'>"+
		 "<td>"+data.branchList[i].branchName+"</td>"+
		 "<td>"+(data.branchList[i].branchLndrpcrymslmcoqy - excessCapacity[0].branchLndrpcrymslmcoqy)+'/'+data.branchList[i].branchLndrpcrymslmcoqy+"</td>"+
		 "<td style='width: 90px;padding-top: 21px;'><div class='progress progress-xs'><div class='progress-bar "+bgColor+"' style='width: "+processingRate+"%'></div></div></td>"+
		 "<td style='width: 30px;padding-left: 0px;padding-right: 10px;text-align: center;'><span class='badge "+bgColor+"'>"+processingRate+"%</span><input type='radio' value='"+data.branchList[i].branchCode+"' name='branchradio'  style= 'display: none'/></td>"+
		 "</tr>"; 
		 
		$(".branchList>tbody").append(branchAdd);
	 
})


</script>



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
</body>



