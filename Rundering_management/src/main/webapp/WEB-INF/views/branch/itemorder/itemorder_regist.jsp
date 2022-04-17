<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<body>
	<div>
		<div class="row ml-2 mr-2">
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 765px;">
					<div class="card-header">
						<h3 class="card-title">물품리스트</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover ">
							<thead>
								<tr>
									<th class="width20" style="text-align: center">물품명</th>
									<th class="width15" style="text-align: center">사진</th>
									<th class="width15" style="text-align: center">금액</th>
									<th class="width10" style="text-align: center;">담기</th>
								</tr>
							</thead>
	
							<tbody id="listBody">
							
							</tbody>
							
						</table>
						
					</div>
					<div class="card-footer" >
						<%@ include file="/WEB-INF/views/branch/itemorder/pagination.jsp"%>
					</div>
	
				</div>
	
			</div>
	<table></table>
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 670px;display: block;overflow: auto;">
					<div class="card-header">
						<h3 class="card-title">발주신청</h3>
	
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover " >
							<thead>
								<tr style="text-align: center;">
									<th class="width30">물품명</th>
	
									<th class="width20">수량</th>
	
									<th class="width25">총금액</th>
									<th class="width15" >취소</th>
								</tr>
							</thead>
							 <tbody id="tbody">
								
							</tbody>
						</table>
					</div>
					
				</div>
				<div class="card">
	
					<div class="card-body">
						<strong>합계 총금액</strong> 
						<button class="btn btn-primary float-right" style="margin-left: 10px" onclick="seeTotalPrice()">보기</button>
						
						<input  style="width: 100px" class="form-control float-right" id="totalPrice" name="content" type="text">
						
					</div>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-primary" onclick="orderGoodsList()">발주</button>
	
					<button type="button" class="btn btn-primary">리셋</button>
				</div>
	
			</div>
		</div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="laundryArticlesList" >
{{#laundryArticlesList}}
		<tr>
			<td style="text-align: left;" data-code="{{articlesCode}}" >{{articlesName}}</td>
			<td style="text-align: center;">사진</td>
			<td style="text-align: center;">{{price}}</td>
			<td style="text-align: center; padding-top: 8px"><button type="button"	class="btn btn-primary btn-sm" onclick="getOrder()" >담기</button></td>
		</tr>
{{/laundryArticlesList}}
</script>

<script type="text/x-handlebars-template" id="getOrder-tempalet" >

<tr>
	<input type="hidden" name="code" value="{{code}}">
	<input type="hidden" name="price" class="inputPrice" value="">
	<td  >{{name}}</td>
	<td  style="text-align:center; padding-left:0px;padding-right:0px;"> 
		<input type="text" name="quantity" value="0" class="form-control" onkeyup="inputNumber()" style="width: 70px; height: 30px; text-align:right; display:inline">
	</td>
	<td  style="text-align:right" class="price" data-price="{{price}}"></td> 
	<td  style="text-align:center;">
		<button type="button" style="color: black" class="btn btn-tool" onclick="itemRemove()" style="color: black">
			<i class="fas fa-times xbutton"></i>
		</button>
	</td>
</tr>

</script>

<script>
window.onload=function(){
	orderGoodsList();
}


function orderGoodsList(){
	$.ajax({
		url : "<%=request.getContextPath()%>/branch/itemorder/orderGoodsList",
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			let source = $("#laundryArticlesList").html();
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker
			let cri=dataMap.pageMaker.cri 
			let	laundryArticlesList =dataMap.laundryArticlesList
			console.log(laundryArticlesList)
			let data={
					pageMaker:pageMaker,
					cri:cri,
					laundryArticlesList:laundryArticlesList
			}
			let html = template(data);
			$("#listBody").innerHTML="";
			$("#listBody").append(html)
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


function getOrder(){
	
	let dataCode = event.target.parentNode.parentNode.children[0].dataset.code;
	let price = event.target.parentNode.parentNode.children[2].innerText
	let itemName=event.target.parentNode.parentNode.children[0].innerText
	let source = $("#getOrder-tempalet").html();
	let template = Handlebars.compile(source); 

	//핸들바 템플릿에 바인딩할 데이터 
	let data = {
	    	code:dataCode,
	    	price:price,
	    	name:itemName
	}; 
	let html = template(data);
	$('#tbody').append(html);

}

</script>
 
<script>

function itemRemove(){
	
	if(event.target.type!="button"){
		event.target.parentNode.parentNode.parentNode.remove();
	}
    event.target.parentNode.parentNode.remove();
  
}

</script>

<script>


function inputNumber(){
	
	let regex =/[^0-9]/g;
	let inputValue = event.target.value;
	event.target.value=inputValue.replace(regex,'');
	
	if( event.target.value.trim==""||event.target.value==null){
		event.target.value=0;
		return;
	}
	
    for (let i=0 ; i<event.target.value.length; i++){
    	
    	if(event.target.value[i]!="0"){
    		let price= event.target.parentNode.parentNode.querySelector(".price").dataset.price;
    		let eventInt=parseInt(event.target.value);
    		let priceInt=parseInt(price);
    		event.target.parentNode.parentNode.querySelector(".price").innerText=priceInt*eventInt;
    		event.target.parentNode.parentNode.querySelector(".inputPrice").value=priceInt*eventInt;
    		return;
    	}
    	event.target.value= event.target.value.substr(i+1)
    	
    	let price= event.target.parentNode.parentNode.querySelector(".price").dataset.price;
    	let eventInt=parseInt(event.target.value);
		let priceInt=parseInt(price);	 
		event.target.parentNode.parentNode.querySelector(".price").innerText=priceInt*eventInt;
		event.target.parentNode.parentNode.querySelector(".inputPrice").value=priceInt*eventInt;
    	
    	
    }
    
}
</script>
<script>
	function seeTotalPrice(){
		let priceList=document.querySelectorAll(".price");
		let sum = 0;
		for(let i = 0 ; i<priceList.length;i++){
			if(!isNaN(parseInt(priceList[i].innerText))) {
				sum += parseInt(priceList[i].innerText)
			}
		}
		document.querySelector("#totalPrice").value=sum;
	
	}

</script>
	
	
	
	
</body>