<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="card ml-3 mr-3">
		<div class="card-header">
			<div>	
				<h3 class="card-title">세탁량(%)</h3>
				<input type="week" name="week_year" id="weekBtn" style="float:right;">
			</div>
		</div>
		<div class="card-body" class="ml-3 mr-3">
			<div style="width: 700px;">
				<canvas id="canvas"></canvas>
			</div>
		</div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<form action="/manager/lesson/listByClassRoom" id="timeRequestForm">
   <input type="hidden" id="monday" name="monday">
   <input type="hidden" id="tuesday" name="tuesday">
   <input type="hidden" id="wednesday" name="wednesday">
   <input type="hidden" id="thursday" name="thursday">
   <input type="hidden" id="friday" name="friday">
   <input type="hidden" id="saturday" name="saturday">
   <input type="hidden" id="week" name="week">
</form>   
   
<script>
   window.onload = function(){
      setTimeout(function() {
         setInputWeek();
         }, 100);
      
      $("#inputWeek").on("change",function(){
         calculatePeriod($(this).val());
         getClassRoomTimeInfo($(this).val());
      });
      
      printlessonTimeInfo();
   }
   
   function setInputWeek(){
      let inputWeek = $("#inputWeek").val().trim();
      if(!inputWeek){
         let today = moment();
         let today2 = moment();
         let year = today.isoWeekYear();
         let week = today.isoWeek();
         inputWeek = year + "-W" + week;
         $("#inputWeek").val(inputWeek);
      }
      calculatePeriod(inputWeek);
   }
   
   function calculatePeriod(week){
      let monday = moment(week).day(1);
      let sunday = moment(week).day(7);
      let monDate = monday.format("YYYY-MM-DD (ddd)");
      let sunDate = sunday.format("YYYY-MM-DD (ddd)");
      
      $("#startDate").text(monDate);
      $("#endDate").text(sunDate);
   }
   
   function getClassRoomTimeInfo(week){
      let monday = moment(week).day(1).format("YYYYMMDD");
      let tuesday = moment(week).day(2).format("YYYYMMDD");
      let wednesday = moment(week).day(3).format("YYYYMMDD");
      let thursday = moment(week).day(4).format("YYYYMMDD");
      let friday = moment(week).day(5).format("YYYYMMDD");
      let saturday = moment(week).day(6).format("YYYYMMDD");
      let selectWeek = $("#inputWeek").val().trim();
      
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
   
   function printlessonTimeInfo(){
      let mondayInfoArr = [];
      let tuesdayInfoArr = [];
      let wednesdayInfoArr = [];
      let thursdayInfoArr = [];
      let fridayInfoArr = [];
      let saturdayInfoArr = [];
      let byDayInfo = new Object();
      
      $(".monTimedataSource").each(function(){
         let mondayInfo = new Object();
         mondayInfo.lRoomId = $(this).attr("data-lRoomId");
         mondayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',mondayInfo.lRoomId+'/mon').replaceAll('화',mondayInfo.lRoomId+'/tue').replaceAll('수',mondayInfo.lRoomId+'/wed').replaceAll('목',mondayInfo.lRoomId+'/thu').replaceAll('금',mondayInfo.lRoomId+'/fri').replace('토',mondayInfo.lRoomId+'/sat');
         mondayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         mondayInfo.lessonId = $(this).attr("data-lessonId");
         mondayInfoArr.push(mondayInfo);
      });
      
      $(".tueTimedataSource").each(function(){
         let tuesdayInfo = new Object();
         tuesdayInfo.lRoomId = $(this).attr("data-lRoomId");
         tuesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',tuesdayInfo.lRoomId+'/mon').replaceAll('화',tuesdayInfo.lRoomId+'/tue').replaceAll('수',tuesdayInfo.lRoomId+'/wed').replaceAll('목',tuesdayInfo.lRoomId+'/thu').replaceAll('금',tuesdayInfo.lRoomId+'/fri').replace('토',tuesdayInfo.lRoomId+'/sat');
         tuesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         tuesdayInfo.lessonId = $(this).attr("data-lessonId");
         tuesdayInfoArr.push(tuesdayInfo);
      });
      
      $(".wedTimedataSource").each(function(){
         let wednesdayInfo = new Object();
         wednesdayInfo.lRoomId = $(this).attr("data-lRoomId");
         wednesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',wednesdayInfo.lRoomId+'/mon').replaceAll('화',wednesdayInfo.lRoomId+'/tue').replaceAll('수',wednesdayInfo.lRoomId+'/wed').replaceAll('목',wednesdayInfo.lRoomId+'/thu').replaceAll('금',wednesdayInfo.lRoomId+'/fri').replace('토',wednesdayInfo.lRoomId+'/sat');
         wednesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         wednesdayInfo.lessonId = $(this).attr("data-lessonId");
         wednesdayInfoArr.push(wednesdayInfo);
      });
      
      $(".thuTimedataSource").each(function(){
         let thursdayInfo = new Object();
         thursdayInfo.lRoomId = $(this).attr("data-lRoomId");
         thursdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',thursdayInfo.lRoomId+'/mon').replaceAll('화',thursdayInfo.lRoomId+'/tue').replaceAll('수',thursdayInfo.lRoomId+'/wed').replaceAll('목',thursdayInfo.lRoomId+'/thu').replaceAll('금',thursdayInfo.lRoomId+'/fri').replace('토',thursdayInfo.lRoomId+'/sat');
         thursdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         thursdayInfo.lessonId = $(this).attr("data-lessonId");
         thursdayInfoArr.push(thursdayInfo);
      });
      
      $(".friTimedataSource").each(function(){
         let fridayInfo = new Object();
         fridayInfo.lRoomId = $(this).attr("data-lRoomId");
         fridayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',fridayInfo.lRoomId+'/mon').replaceAll('화',fridayInfo.lRoomId+'/tue').replaceAll('수',fridayInfo.lRoomId+'/wed').replaceAll('목',fridayInfo.lRoomId+'/thu').replaceAll('금',fridayInfo.lRoomId+'/fri').replace('토',fridayInfo.lRoomId+'/sat');
         fridayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         fridayInfo.lessonId = $(this).attr("data-lessonId");
         fridayInfoArr.push(fridayInfo);
      });
      
      $(".satTimedataSource").each(function(){
         let saturdayInfo = new Object();
         saturdayInfo.lRoomId = $(this).attr("data-lRoomId");
         saturdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',saturdayInfo.lRoomId+'/mon').replaceAll('화',saturdayInfo.lRoomId+'/tue').replaceAll('수',saturdayInfo.lRoomId+'/wed').replaceAll('목',saturdayInfo.lRoomId+'/thu').replaceAll('금',saturdayInfo.lRoomId+'/fri').replace('토',saturdayInfo.lRoomId+'/sat');
         saturdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
         saturdayInfo.lessonId = $(this).attr("data-lessonId");
         saturdayInfoArr.push(saturdayInfo);
      });
      
      byDayInfo.monday = mondayInfoArr;
      byDayInfo.tuesday = tuesdayInfoArr;
      byDayInfo.wednesday = wednesdayInfoArr;
      byDayInfo.thursday = thursdayInfoArr;
      byDayInfo.friday = fridayInfoArr;
      byDayInfo.saturday = saturdayInfoArr;
      
      console.log(byDayInfo);
      
      $(".targetTd").each(function(){
         let tdId = $(this).attr("id");
//          byDayInfo.monday.forEach((currentElement, index, array) => {
//              console.log(`요소: ${currentElement}`);
//              console.log(`index: ${index}`);
//              console.log(array);
//          });
      });
      
   }
</script>   

<script>
    new Chart(document.getElementById("canvas").getContext("2d"), {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
                    label: "세탕량(%)",
                    data: [${throughput.quotaPercent }, 60, 56, 60, 6, 45, 15],
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