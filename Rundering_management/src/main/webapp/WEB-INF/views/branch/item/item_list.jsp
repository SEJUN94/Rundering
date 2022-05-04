<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="itemList" value="${dataMap.itemList }"/>
<c:set var="clcodeList" value="${dataMap.CLCODEList }" />
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>지점 등록 관리</h1>
			</div>
		</div>
	</div>
</section>

    <div class="card card-secondary card-outline ml-3 mr-3">
        <div class="col-12 p-0">
                <div class="card-header">
                   <h2 style="height: 20px;" class="card-title">
						<b>재고 리스트</b>
					</h2>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" >
                            <select class="form-control" name="laundryItemsCode"
                                id="laundryItemsCode" onchange="list_go(1);">
                                <option value="asd">asdaadas</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0 mt-0" style="height: 305px;">
                    <table
                        class="table table-hover text-nowrap card-outline">
                        <thead>
                            <tr>
                                <th style="text-align: center;">물품이름</th>
                                <th style="text-align: center;height: 24px;padding-bottom: 8px;padding-top: 0px;">
                                    <div class="input-group input-group-sm" >
                                        <select class="form-control" style="width: 60px;" name="laundryItemsCode"  id="laundryItemsCode" onchange="list_go(1);">
                                           	 <c:forEach items="${clcodeList }" var="clcode">
                                           	 
                                             	<option value="${clcode.comCode}">${clcode.comCodeNm }</option>
                                             </c:forEach>
                                         </select>
                                     </div>
                                </th>
                                <th style="text-align: center;">물품량</th>
                                <th style="text-align: center;">자동 발주 개수</th>
                                <th style="text-align: center;">자동 발주 최소량</th>
                                <th style="text-align: center;">자동발주 사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                                    
                                   <c:forEach items="${itemList }" var="item">
                                    <tr>
                                        <td onclick="tdClick('${item.articlesCode}')">${item.articlesName} </td>
                                        <td>
                                        <c:forEach items="${clcodeList }" var="clcode">
                                        	<c:if test="${item.clcode eq clcode.comCode}">${clcode.comCodeNm }</c:if>   	 
                                        </c:forEach>
                                        </td>
                                        <td style="text-align: right;">${item.supplyCount }(${item.each})</td>
                                        <td style="text-align: right;padding-top: 10px;padding-bottom: 5px;">
                                            <span class="input-group-sm input-group-append float-right"   >
                                                <input type="text" class="" disabled value="${item.autoOrderCount }(${item.each})" style="width: 100px; text-align: right;">
                                                <button class="btn btn-sm btn-warning">수정</button>
                                            </span>
                                        </td>
                                        <td style="text-align: right;padding-top: 10px;padding-bottom: 5px;">
                                            <span class="input-group-sm input-group-append float-right "  >
                                                <input type="text" class="" disabled value="${item.autoOrderPoint }(${item.each})" style="width: 100px; text-align: right;">
                                                <button class="btn btn-sm btn-warning">수정</button>
                                            </span>
                                        </td>
                                        <c:if test="${item.autoOrderYn eq 'Y'}">
                                      	  	
                                      	  	<td style="text-align: center;">
                                      	  		<form action="autouse" method="post">
                                      	  			<input type="hidden" value="N" name="autoOrderYn">
                                      	  			<input type="hidden" value="${item.articlesCode }" name="articlesCode">
                                      	  			 <button class="btn btn-sm btn-warning">미사용</button>
                                      	  		</form> 
                                      	  	 </td>
                                       		
                                        </c:if>
                                          <c:if test="${item.autoOrderYn eq 'N'}">
                                      	  	<td style="text-align: center;"> 
                                      	  		<form action="autouse" method="post">
                                      	  			<input type="hidden" value="Y" name="autoOrderYn">
                                      	  			<input type="hidden" value="${item.articlesCode }" name="articlesCode">
                                      	  			<button class="btn btn-sm btn-primary">사용</button>
                                      	  		</form>
                                      	  	</td>
                                        </c:if>
                                    </tr>
                                   </c:forEach> 
                        </tbody>
                    </table>
                </div>
              <div class="card-footer" >
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
            </div>
    </div>
<div class="row ml-3 mr-3">
    <div class="card p-0 col-6 " style="height: 300px;">
        <div class="card-header">
            <strong> 입고목록 </strong>
                <div class="card-tools">
                    <div class="input-group input-group-sm" >
                        <select class="form-control" name="chartDay"
                            id="itemInsertDate" onchange="chartGo()">
                            <option value="1">1일</option>
                            <option value="30">30일</option>
                            <option value="90">90일</option>
                            <option value="365">365일</option>
                        </select>
                    </div>
                </div>
         </div>
         <div class="card-body " id="chartDiv">
    		<canvas id="canvas"></canvas>     
         </div>
    </div>
    <div class="card p-0 col-6" style="height: 300px;  ">
           <div class="card-header">
                <strong> 출고목록 </strong>
                <div class="card-tools">
                    <div class="input-group input-group-sm" >
                        <select class="form-control" name="laundryItemsCode"
                            id="laundryItemsCode" onchange="list_go(1);">
                            <option value="asd">월</option>
                        </select>
                    </div>
                </div>
            </div>
    </div>
</div>
<script>
let articlesCode= null;

function autoModify(){
	
}


function tdClick(code){
	articlesCode=code;
	chartGo();
}

	

function chartGo(){
	let chartDiv = document.querySelector("#chartDiv");
	document.querySelector("#canvas").remove();
	chartDiv.innerHTML=""
	chartDiv.innerHTML="<canvas id='canvas'></canvas>"
	

	let itemInsertDate= document.querySelector("#itemInsertDate").value;
	$.ajax({
		url : '<%=request.getContextPath()%>/branch/item/chart',
		type : 'get',
		data:{
			chartDay:itemInsertDate,
			articlesCode:articlesCode
		},
		dataType : "json",
		success : function(data) {
			console.log(data)
			
			let a= data[0].day;
			let b= data[1].day;
			let c= data[2].day;
			let d= data[3].day;
			let e= data[4].day;
			let f= data[5].day;
			let g= data[6].day;
			let sum1=data[0].sum;
			let sum2=data[1].sum;
			let sum3=data[2].sum;
			let sum4=data[3].sum;
			let sum5=data[4].sum;
			let sum6=data[5].sum;
			let sum7=data[6].sum;
			
			
			
			chartCanvas(g,f,e,d,c,b,a,sum7,sum6,sum5,sum4,sum3,sum2,sum1)
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
function chartCanvas(a,b,c,d,e,f,g,sum1,sum2,sum3,sum4,sum5,sum6,sum7){
	let CHARTEX = $('#canvas');
	let barChartExample = new Chart(CHARTEX , {
	    type: 'bar',
	    data: {
	        labels: [a,b, c,d, e, f, g ],
	        datasets: [{
	                label: "입고량",
	                data: [sum1, sum2, sum3, sum4, sum5, sum6, sum7],
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
	       
	    }
	});
}

</script>

</body>