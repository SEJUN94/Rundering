<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div>
		<div class="row ml-2 mr-2">
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 765px;display: block; overflow: auto;">
					<div class="card-header">
						<h3 class="card-title">물품리스트</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover ">
							<thead id="listBody">
								<tr>
									<th class="width20" style="text-align: center">물품명</th>
									<th class="width15" style="text-align: center">사진</th>
									<th class="width5" style="text-align: center">금액</th>
									<th class="width10" style="text-align: center;">담기</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="card-footer" id="cardfooter">
						
					</div>
	
				</div>
	
			</div>
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 670px;display: block;overflow: auto;">
					<div class="card-header">
						<h3 class="card-title">발주신청</h3>
	
					</div>
					<div class="card-body p-0" >
					<form action="regist" method="post" id="formOrder">
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
								<input type="hidden" name="totalprice" id="hiddenTotalPrice">
							</form> 
					</div>
					
				</div>
				<div class="card">
	
					<div class="card-body">
						<strong>합계 총금액</strong> 
						<button class="btn btn-primary float-right" style="margin-left: 10px" onclick="seeTotalPrice()">보기</button>
						<input  style="width: 100px" class="form-control float-right" id="totalPrice" name="content" type="text" disabled="disabled">
						
					</div>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-primary" onclick="order_go()">발주</button>
					<button type="button" class="btn btn-primary">리셋</button>
				</div>
	
			</div>
		</div>
	</div>

<script>
function order_go(){	
	let count = document.querySelectorAll(".count")
	if(count.length==0){
		alert("발주신청 목록이 없습니다")
		return;
	} 
	
	let price = document.querySelectorAll(".price");
	let quantity = document.querySelectorAll(".quantity");
	for(let i = 0 ; i < price.length; i++){
		if(price[i].innerText.trim()=="" || price[i].innerText==null){
			alert("수량을 입력해주세요");
			return 
		}
	}
	for(let i = 0 ; i < quantity.length; i++){
		if(quantity[i].value==""||quantity[i].value==null){
			alert("수량을 입력해주세요");
			return
		}
	}
	
	document.querySelector("#hiddenTotalPrice").value=document.querySelector("#totalPrice").value
    let form= document.querySelector("#formOrder");
    form.submit();
}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="laundryArticlesList" >
<tbody id="removeBody">
{{#laundryArticlesList}}
		<tr>
			<td style="text-align: left;" class="{{articlesCode}}" data-code="{{articlesCode}}" >{{articlesName}}</td>
			<td style="text-align: center;">사진</td>
			<td style="text-align: center;">{{price}}</td>
			<td style="text-align: center; padding-top: 8px"><button type="button"	class="btn btn-primary btn-sm" onclick="getOrder()" >담기</button></td>
		</tr>
{{/laundryArticlesList}}
</tbody>
</script>
<script type="text/x-handlebars-template" id="pagination-template" >
<nav aria-label="Navigation" id="pageItem">
<ul class="pagination justify-content-center m-0">
<li class="paginate_button page-item" onclick="numberChange(1)">
   <a href="javascript:page_go('{{pageurl 1}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item">
   <a href="javascript:page_go('{{#if prev}}{{pageurl prevPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>

</li>
{{url}}
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}}" onclick="numberChange({{this}})">
   <a href="javascript: page_go('{{pageurl this}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item" onclick="numberChange({{#if next}}{{nextPageNum}}{{/if}})" >
   <a href="javascript:page_go('{{#if next}}{{pageurl nextPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="numberChange({{realEndPage}})">
   <a href="javascript:page_go('{{pageurl realEndPage}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</ul>
</nav>
</script>

<script type="text/x-handlebars-template" id="getOrder-tempalet" >
 
<tr class="{{code}} count">
	<input type="hidden" name="code" value="{{code}}">
	<input type="hidden" name="price" class="inputPrice" value="">
	<td   >{{name}}</td>
	<td  style="text-align:center; padding-left:0px;padding-right:0px;"> 
		<input type="text" name="quantity" class="quantity" value="0" class="form-control" onkeyup="inputNumber()" style="width: 70px; height: 30px; text-align:right; display:inline">
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
let page= 1;


window.onload=function(){
	orderGoodsList("<%=request.getContextPath()%>/branch/itemorder/orderGoodsList?page="+page);
}   

function page_go(url){
	if(url==null||url.trim()==""){
		alert("페이지가 없습니다");
		return;
	}
	orderGoodsList(url);
} 
function numberChange(number){
	page=number;
}


function orderGoodsList(pageInfo){
	$.ajax({
		url : pageInfo,
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			
			
			let source = $("#laundryArticlesList").html();
			let pageSource = $("#pagination-template").html();
			
			let pageTemplate = Handlebars.compile(pageSource); 
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker
			let cri=dataMap.pageMaker.cri 
			let	laundryArticlesList =dataMap.laundryArticlesList
			
			let pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
		    for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		        pageNumArray[i]=pageMaker.startPage+i;
	    	}
		
			
			pageMaker.pageNum=pageNumArray;
   			pageMaker.prevPageNum=pageMaker.startPage-1;
            pageMaker.nextPageNum=pageMaker.endPage+1;
            
            Handlebars.registerHelper({
			   "signActive":function(pageNum){
				   	
					 if(pageNum == page) return 'active';
			   },
               "pageurl":function(pageNum){
            	   
            	   return "<%=request.getContextPath()%>/branch/itemorder/orderGoodsList?page="+pageNum;
               }
			});
            
			let data={
					pageMaker:pageMaker,
					cri:cri,
					laundryArticlesList:laundryArticlesList
			}
			
			let html = template(data);
			let pagehtml = pageTemplate(pageMaker);
			
			$("#listBody").innerHTML="";
			if($("#removeBody")!=null){
				$("#removeBody").remove()
			}
			if(document.querySelector("#pageItem")!=null){
				document.querySelector("#pageItem").remove()
			}
			$("#cardfooter").append(pagehtml)
			$("#listBody").after(html)
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
//여기까지 물품리스트 뽑고 페이징처


// 담기
function getOrder(){
	
	
	let code= event.target.parentNode.parentNode.children[0].dataset.code
	let count = document.querySelectorAll("."+code)
	
	if(count.length>1){
		return
	}
	
	
	
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