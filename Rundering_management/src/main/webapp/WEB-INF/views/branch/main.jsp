<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="UTF-8">
</head>

<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

   <div class="row2 ml-3 mr-3">
      <div class="row">
         <div class="col-md-6" id="appendNotice">
            
         </div>
         <div class="col-md-6" id="appendOrder">
            
         </div>
      </div>
      <div class="row" style="margin-top: 8px;">
         <div class="col-md-6" id="append">
			<div class="card m-0" style="height: 398px;">
				<div class="card-header" style="height: 56px;">
					<h2 style="height: 20px;padding: 5px;font-size: 1.25rem;" class="card-title">
		            	<b>배송 지연 (7일)</b>
		            </h2>
				</div>

				<div class="card-body p-0"  >
         	    <canvas id="bar-chart" ></canvas>
         	    </div>
			</div>

         </div>
         <div class="col-md-6"id="appendChart" >
				

         </div>
      </div>
   </div>
 
      <script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	 <%@include file="./main/notice_list.jsp" %>
   <%@include file="./main/order_list.jsp" %>

<script type="text/x-handlebars-template" id="chart" >
<div class="card m-0" style="height: 398px;">
<div class="card-header" style="height: 56px;">
					<h2 style="height: 20px;padding: 5px;font-size: 1.25rem;" class="card-title">
		            	<b>주문량</b>
		            </h2>
				</div>

			<div class="card-body p-0" style="width:330px; height:330px; margin-left: 60px" id="canvasDiv" >
             <canvas id="pie-chart" ></canvas>
             </div>
</div>

</script>

<script>
function getBarChart(a,b,c,d,e,f,g,data1,data2,data3,data4,data5,data6,data7){
	new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    data: {
	      labels: [a, b, c, d, e,f,g],
	      datasets: [
	        {
	          label: "배송 지연 건수",
	          backgroundColor: ["#3e95cd", "#3e95cd","#3e95cd","#3e95cd","#3e95cd","#3e95cd","#3e95cd"],
	          data: [data1,data2,data3,data4,data5,data6,data7]
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '배송 지연'
	      }
	    }
	});
}

function timeSet(timeValue){
    var dateObj=new Date(timeValue);
    var year=dateObj.getFullYear();
    var month=dateObj.getMonth()+1;
    var date=dateObj.getDate();
    return year+"/"+month+"/"+date;
}

function getChart(){
	let result= event.target.value.split(",");
	console.log(result)
	document.querySelector("#pie-chart").remove()
	document.querySelector('#canvasDiv').innerHTML="<canvas id='pie-chart' ></canvas>"
	pieChart(parseInt(result[0]),parseInt(result[1]),result[2])
}


function pieChart(totalCount,count,branchName){
 console.log(event.target)
	new Chart(document.getElementById("pie-chart"), {
	    type: 'pie',
	    data: {
	      labels: ["가능세탁주문", "현재주문"],
	      datasets: [{
	        label: "Population (millions)",
	        backgroundColor: ["#82BBD8", "#8e5ea2"],
	        data: [(totalCount-count),count] 
	      }]
	    },
	    options: {
	      title: {
	        display: true,
	        text: branchName
	      }
	    }
	});

}

function goPage(url,menuCode){
	

	this.parent.document.querySelector('iframe[name="ifr"]').src=url;
	

	// HTML5 지원브라우저에서 사용 가능
	if (typeof (this.parent.history.pushState) == 'function') {
		//현재 주소를 가져온다.
		var renewURL = this.parent.location.href;
		//현재 주소 중 .부분이 있다면 날려버린다.
		renewURL = renewURL.substring(0, renewURL.indexOf(".") );

		if (menuCode != 'A000000') {
			renewURL += "?menuCode=" + menuCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		this.parent.history.pushState(menuCode, null, renewURL);
	} else {
		this.parent.location.hash = "#" + menuCode;
	}
	
} 




window.onload= function (){
	notice_list("<%=request.getContextPath()%>/branch/main/noticelist")
	order_list("<%=request.getContextPath()%>/branch/main/orderlist")
	$.ajax({
		url : "<%=request.getContextPath()%>/branch/main/chart",
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			console.log(dataMap)
			let branchList = dataMap.branchList;
			let source = $("#chart").html();
			
			let template = Handlebars.compile(source); 
			
			console.log(branchList)
		
			let data = {
				
			}
			let html = template(data);
			
			$("#appendChart").innerHTML="";
			$("#appendChart").append(html)
			
			pieChart(dataMap.branch.branchLndrpcrymslmcoqy,dataMap.count,dataMap.branch.branchName)
			
		
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
	$.ajax({
		url : "<%=request.getContextPath()%>/branch/main/orderdelay",
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			let dateList=dataMap.dateList
			let countList=dataMap.countList
			
			let a =timeSet(dateList[0])
			let b =timeSet(dateList[1])
			let c =timeSet(dateList[2])
			let d =timeSet(dateList[3])
			let e =timeSet(dateList[4])
			let f =timeSet(dateList[5])
			let g =timeSet(dateList[6])
			
			let data1=countList[0]
			let data2=countList[1]
			let data3=countList[2]
			let data4=countList[3]
			let data5=countList[4]
			let data6=countList[5]
			let data7=countList[6]
			
		
			getBarChart(g,f,e,d,c,b,a,data7,data6,data5,data4,data3,data2,data1)
			
			document.querySelector("#bar-chart").style.height="300px"
		
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

</script>


</body>
</html>