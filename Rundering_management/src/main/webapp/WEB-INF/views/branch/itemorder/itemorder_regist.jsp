<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>발주</h1>
			</div>
		</div>
	</div>
</section>


	<div>
		<div class="row ml-2 mr-2">
			<div class="col-6">
				<div class="card col-12" >
					<div class="card-header ">
						<h2 style="height: 20px;" class="card-title">
						<b>발주 물품</b>
						</h2>
								<div class="float-right ">
									<div class="input-group-sm selectWidth">
										<select class="form-control" name="searchType" id="searchType"
											onchange="list_go('1')">
											<option value="">전체</option>
											<c:forEach items="${dataMap.CLCODEList}" var="clcode">
												
												<option value="${clcode.comCode }">${clcode.comCodeNm }</option>
											</c:forEach>
										</select>
									</div>
								</div>
						
					</div>
					<div class="card-body p-0" style="height: 600px;display: block; overflow: auto;" >
						<table class="table table-hover ">
							<thead id="listBody">
								<tr>
									<th class="width20" style="text-align: center">물품명</th>
									<th class="width15" style="text-align: center">분류</th>
									<th class="width5" style="text-align: center">금액(원)</th>
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
				<div class="card   col-12" style="height: 717px;display: block;overflow: auto;">
					<div class="card-header">
						<h2 style="height: 20px;" class="card-title">
						<b>발주 신청</b> 
						</h2>
							<div class="float-right">
							<strong>합계 총금액</strong> 
							
							<input  style="width: 100px" class="input-sm  " id="totalPrice" name="content" type="text" disabled="disabled">
							<button type="button" class="btn btn-sm btn-primary" onclick="order_go()">발주</button>
							
						</div>
	
					</div>
					<div class="card-body p-0"  >
					<form action="regist" method="post" id="formOrder">
						<table class="table table-hover " >
							<thead>
								<tr style="text-align: center;">
									<th class="width25">물품명</th>
									<th class="width25">수량</th>
									<th class="width25">총금액(원)</th>
									<th class="width15" >취소</th>
								</tr>
							</thead>
								 <tbody id="tbody" >

								</tbody>
						</table>
								<input type="hidden" name="totalprice" id="hiddenTotalPrice">
							</form> 
					</div>
					
				</div>
	
			</div>
		</div>
	</div>


<form id="jobForm">	
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>

<script>

	

	function list_go(page){
		
		let searchType=event.target.value
		
		orderGoodsList("<%=request.getContextPath()%>/branch/itemorder/orderGoodsList?page="+page+"&searchType="+searchType)
		
		
	}
</script>

<script>



function order_go(){	
	let count = document.querySelectorAll(".count")
	if(count.length==0){
		Swal.fire({
			icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title : '발주신청 목록이 없습니다.'
		});
		return;
	} 
	
	let price = document.querySelectorAll(".price");
	let quantity = document.querySelectorAll(".quantity");
	for(let i = 0 ; i < price.length; i++){
		if(price[i].innerText.trim()=="" || price[i].innerText==null){
			Swal.fire({
				icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '수량을 입력해주세요'
			});
			return 
		}
	}
	for(let i = 0 ; i < quantity.length; i++){
		if(quantity[i].value==""||quantity[i].value==null){
			Swal.fire({
				icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '수량을 입력해주세요'
			});
			return
		}
	}
	
	document.querySelector("#hiddenTotalPrice").value=document.querySelector("#totalPrice").value.replace(",","")
    let form= document.querySelector("#formOrder");
    form.submit();
}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="laundryArticlesList" >
<tbody id="removeBody">
{{#laundryArticlesList}}
		<tr>
			<td style="text-align: left;" class="{{articlesCode}} visibleImg" data-code="{{articlesCode}}" onclick="imgclick()"  >
			<img alt="" src="" onclick="imgclicknone()" class="articlesImg" data-fileno="{{atchFileNo}}" style="position: absolute;z-index:2; display:none;" width="300" height="300">
			{{articlesName}}
		</td>
			<td style="text-align: center;">
				{{articlesCodeMap clcode}}
			</td>
			<td style="text-align: right;">{{priceToString price}}</td>
			<td style="text-align: center; padding-top: 8px"><button type="button"	class="btn btn-primary btn-sm" onclick="getOrder()" data-each="{{getEach}}" >담기</button></td>
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
	<input type="hidden" name="price" class="inputPrice" value="{{price}}">
	<td>
		{{name}}
	</td>
	<td  style="text-align:center; padding-left:0px;padding-right:0px;"> 
		<input type="text" readonly="readonly" name="quantity" class="quantity" value="1" class="form-control" onkeyup="inputNumber()" style="width: 60px; height: 30px; text-align:right; display:inline">
		{{getEach}}
		<span class="btn-group-vertical modifySpan" style="width: 18px;">
				<button type="button" class="btn btn-sm btn-default p-0" style="height: 18px;" onclick="plusQuantity(this)">+</button>
				<button type="button" class="btn btn-sm btn-default p-0" style="height: 18px;" onclick="minusQuantity(this)">-</button>
		</span>
	</td>
	<td  style="text-align:right" class="price" data-price="{{price}}">{{priceToString price}}</td> 
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
function priceToString(price){
	 return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

// 이미지불러오기
function getImage(){
	let imgs = document.querySelectorAll(".articlesImg");
	for(img of imgs){
		let fileNo =img.dataset.fileno
		imgAjax(fileNo,img)
		//console.log(img)
	}
}
function imgAjax(atchFileNo,img){
	 $.ajax({
	        url:"<%=request.getContextPath()%>/branch/laundrysituatuion/getimgs",
	        type:"post",
	        data: {
	        	atchFileNo:atchFileNo
	        },
	        dataType:"json",
	        success:function(data){
	        	img.src="data:image/jpg;base64,"+data[0];
	        },
	        error:function(error){
			//alert('댓글이 등록을 실패했습니다.');
			//AjaxErrorSecurityRedirectHandler(error.status);
		}
	    })
}
function imgclick(){
	let imgTag=event.target.querySelectorAll(".articlesImg")[0]
	if(imgTag.style.display=="none"){
		imgTag.style.display='block'
		return;
	}
	imgTag.style.display='none';
}
function imgclicknone(){
	let imgTag=event.target.style.display='none';
	//console.log(imgTag)
}





function page_go(url){
	if(url==null||url.trim()==""){
		Swal.fire({
			icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title : '페이지가 없습니다.'
		});
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
			//console.log(dataMap)
			
			let source = $("#laundryArticlesList").html();
			let pageSource = $("#pagination-template").html();
			
			let pageTemplate = Handlebars.compile(pageSource); 
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker
			let cri=dataMap.pageMaker.cri 
			let	laundryArticlesList =dataMap.laundryArticlesList
			for(let i of laundryArticlesList){
				i.getEach=i.each;
			}
			
			//console.log(laundryArticlesList)
			
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
               },"articlesCodeMap":function(code){
            	   for(let i of dataMap.CLCODEList){
            		   if(i.comCode==code) {
            			   return i.comCodeNm
            		   }
            	   }
               },'priceToString':function(price){
            		 return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
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
				$("#removeBody").remove();
			}
			if(document.querySelector("#pageItem")!=null){
				document.querySelector("#pageItem").remove()
			}
			$("#cardfooter").append(pagehtml);
			$("#listBody").after(html);
			
			getImage();
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
//여기까지 물품리스트 뽑고 페이징처리



// 담기
function getOrder(){
	
	
	let code= event.target.parentNode.parentNode.children[0].dataset.code;
	let count = document.querySelectorAll("."+code);
	
	if(count.length>1){
		return
	}
	
	
	
	let dataCode = event.target.parentNode.parentNode.children[0].dataset.code;
	let getEach = event.target.dataset.each
	let price = event.target.parentNode.parentNode.children[2].innerText.replace(",","");
	let itemName=event.target.parentNode.parentNode.children[0].innerText;
	let source = $("#getOrder-tempalet").html();
	let template = Handlebars.compile(source); 

	//핸들바 템플릿에 바인딩할 데이터 
	let data = {
	    	code:dataCode,
	    	price:price,
	    	name:itemName,
	    	getEach:getEach
	}; 
	let html = template(data);
	$('#tbody').append(html);
	seeTotalPrice()

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
		event.target.value=1;
		//console.log(seeTotalPrice());
		return;
	}
	
    for (let i=0 ; i<event.target.value.length; i++){
    	
    	if(event.target.value[i]!="0"){
    		let price= event.target.parentNode.parentNode.querySelector(".price").dataset.price;
    		let eventInt=parseInt(event.target.value);
    		let priceInt=parseInt(price);
    		event.target.parentNode.parentNode.querySelector(".price").innerText=priceInt*eventInt;
    		event.target.parentNode.parentNode.querySelector(".inputPrice").value=priceInt*eventInt;
    		 //console.log(seeTotalPrice());
    		return;
    		
    	}
    	event.target.value= event.target.value.substr(i+1)
    	
    	let price= event.target.parentNode.parentNode.querySelector(".price").dataset.price;
    	let eventInt=parseInt(event.target.value);
		let priceInt=parseInt(price);	 
		event.target.parentNode.parentNode.querySelector(".price").innerText=priceInt*eventInt;
		event.target.parentNode.parentNode.querySelector(".inputPrice").value=priceInt*eventInt;
    	
		//console.log(seeTotalPrice());
    }
    
}
</script>
<script>
	function seeTotalPrice(){
		let priceList=document.querySelectorAll(".price");
		let sum = 0;
		for(let i = 0 ; i<priceList.length;i++){
			if(!isNaN(parseInt(priceList[i].innerText))) {
				let money= priceList[i].innerText;
				sum += parseInt(money.replace(",",""))
			}
		}
		document.querySelector("#totalPrice").value=priceToString(sum);	
	}
	
	function plusQuantity(){
		let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
		let intValue= parseInt(input.value)
		
		let result=intValue+1;
	
		if(result>100){
			 result=100;
		}
		input.setAttribute("value",result)
		//console.log(input)
		
		let sum= event.target.parentNode.parentNode.querySelectorAll('.quantity')[0].value*event.target.parentNode.parentNode.parentNode.querySelectorAll(".price")[0].dataset.price
		event.target.parentNode.parentNode.parentNode.querySelectorAll(".price")[0].innerText=priceToString(sum);
		event.target.parentNode.parentNode.parentNode.querySelectorAll(".inputPrice")[0].value=sum;
		seeTotalPrice()
	}
	function minusQuantity(){
		let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
		let intValue= parseInt(input.value)
		let result=intValue-1;
		
		if(result<1){
			result=1;
		}
		input.setAttribute("value",result)
		
		
		let sum= event.target.parentNode.parentNode.querySelectorAll('.quantity')[0].value*event.target.parentNode.parentNode.parentNode.querySelectorAll(".price")[0].dataset.price
		event.target.parentNode.parentNode.parentNode.querySelectorAll(".price")[0].innerText=priceToString(sum);
		event.target.parentNode.parentNode.parentNode.querySelectorAll(".inputPrice")[0].value=sum;
		//console.log(input)
		seeTotalPrice()
	}

</script>
	
	
	
	
</body>