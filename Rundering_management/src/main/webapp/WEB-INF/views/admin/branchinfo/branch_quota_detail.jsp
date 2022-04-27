<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${dataMap.throughput }" var="throughput"/>
<c:set value="${dataMap.throughputList }" var="throughputList"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
	<div class="row ml-3 mr-3">
		<div class="card col-12">
			<table class="table table-striped projects">
				<thead>
					<tr>
						<th style="width: 20%">지점장</th>
						<th style="width: 20%" onclick="nada();">지점</th>
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
	<div class="card ml-3 mr-3">
		<div class="card-header">
			<div>	
				<h3 class="card-title">세탁량(%)</h3>
				<input type="week" name="week_year" id="weekBtn" style="float:right;" selected>
			</div>
		</div>
		<div class="card-body" class="ml-3 mr-3">
			<div style="width: 700px;">
				<canvas id="canvas"></canvas>
			</div>
		</div>
	
	</div>
	
	
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<form action="quotadetail" id="timeRequestForm">
   <input type="hidden" id="throughputNo" name="throughputNo" value="${throughput.throughputNo }">
   <input type="hidden" id="monday" name="monday">
   <input type="hidden" id="tuesday" name="tuesday">
   <input type="hidden" id="wednesday" name="wednesday">
   <input type="hidden" id="thursday" name="thursday">
   <input type="hidden" id="friday" name="friday">
   <input type="hidden" id="saturday" name="saturday">
   <input type="hidden" id="week" name="week">
</form>   
   
<script>
var monday=null;
   window.onload = function(){
      setTimeout(function() {
         setweekBtn();
         }, 100);
      $("#weekBtn").on("change",function(){
         calculatePeriod($(this).val());
         getLaundryQuotaInfo($(this).val());
      });
      
      printlessonTimeInfo();
   }
   
   function setweekBtn(){
      let weekBtn = $("#weekBtn").val().trim();
      if(!weekBtn){
         let today = moment();
         let today2 = moment();
         let year = today.isoWeekYear();
         let week = today.isoWeek();
         weekBtn = year + "-W" + week;
         $("#weekBtn").val(weekBtn);
      }
      calculatePeriod(weekBtn);
   }
   
   function calculatePeriod(week){
      let monday = moment(week).day(1);
      let sunday = moment(week).day(7);
      let monDate = monday.format("YYYY-MM-DD (ddd)");
      let sunDate = sunday.format("YYYY-MM-DD (ddd)");
      
      $("#startDate").text(monDate);
      $("#endDate").text(sunDate);
   }
   
   function getLaundryQuotaInfo(week){
      monday = moment(week).day(1).format("YYYYMMDD");
      let tuesday = moment(week).day(2).format("YYYYMMDD");
      let wednesday = moment(week).day(3).format("YYYYMMDD");
      let thursday = moment(week).day(4).format("YYYYMMDD");
      let friday = moment(week).day(5).format("YYYYMMDD");
      let saturday = moment(week).day(6).format("YYYYMMDD");
      let selectWeek = $("#weekBtn").val().trim();
      
      var timeRequestForm=$('#timeRequestForm');
      
      timeRequestForm.find("[name='monday']").val(monday);
      timeRequestForm.find("[name='tuesday']").val(tuesday);
      timeRequestForm.find("[name='wednesday']").val(wednesday);
      timeRequestForm.find("[name='thursday']").val(thursday);
      timeRequestForm.find("[name='friday']").val(friday);
      timeRequestForm.find("[name='saturday']").val(saturday);
      timeRequestForm.find("[name='week']").val(selectWeek);
      
      timeRequestForm.submit();
   }

var labels = [];
<c:forEach items="${throughputList }" var="throughputList">
	<c:if test="${throughputList.branchCode eq '060101'}">
		labels.push('<fmt:formatDate value="${throughputList.date }" pattern="yy/MM/dd"/>');
	</c:if>
</c:forEach>

var CHARTEX = $('#canvas');
    var barChartExample = new Chart(CHARTEX    , {
        type: 'bar',
        data: {
            labels: [monday, labels[5], labels[4], labels[3], labels[2], labels[1], labels[0]],
            datasets: [{
                    label: "세탕량(%)",
                    data: [15, 60, 56, 60, 6, 45, ${throughput.quotaPercent }],
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
</html>