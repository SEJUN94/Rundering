<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>

<c:if test="${from eq 'modify' }">
	<script>
	window.opener.location.reload();
	</script>
</c:if>

<div class="col-12 p-0">
		<div class="p-3 m-0 ">
			<div class="row">
				<div class="col-12">
				<h4>
					   <i class="fas fa-globe"></i>발주상세
					<c:if test="${itemOrder.itemOrderStatus eq '01'}">
	                    <span class="badge bg-warning">
	                    	승인대기
	                    </span>
	                </c:if>
	                <c:if test="${itemOrder.itemOrderStatus eq '02'}">
	                    <span class="badge bg-warning">
	                    	발주대기
	                    </span>
	                </c:if>
	                <c:if test="${itemOrder.itemOrderStatus eq '03'}">
	                    <span class="badge bg-success">
	                    	발주완료
	                    </span>
	                </c:if>
	                <c:if test="${itemOrder.itemOrderStatus eq '04'}">
	                    <span class="badge bg-warning">
	                    	미수령
	                    </span>
	                </c:if>
	                <c:if test="${itemOrder.itemOrderStatus eq '05'}">
	                    <span class="badge bg-danger">
	                    	반려
	                    </span>
	                </c:if>
	                 <c:if test="${itemOrder.itemOrderStatus eq '06'}">
	                    <span class="badge bg-success">
	                    	수령
	                    </span>
	                </c:if>
	                
                    <small class="float-right">
                    	발주번호: ${itemOrder.ordercode }
                    </small>
                </h4>
				</div> 
			</div>
			<div class="row no-print p-2" >
	            <div class="col-12" style="padding-left: 0px">
	     			 
	     			 
	     			 <p class="h4" style="display: inline; width: 300px; ">	
	     			 	발주일시 : <fmt:formatDate value="${itemOrder.registDate }" pattern="yy-MM-dd HH:mm"/> /
	     			 	
	     			 	수령일시 : <c:if test="${empty itemOrder.receiptDate}">-</c:if>
	     			 	<fmt:formatDate value="${itemOrder.receiptDate }" pattern="yy-MM-dd HH:mm"/>
	     			 </p>
	                 <button type="button" class="btn bg-gradient-secondary float-right"
	                    style="margin-right: 5px;" onclick="CloseWindow();">닫기
	                </button>
					
	            </div>
	        </div>
			
			<div class="row">
				<div class="col-12 table-responsive p-0  card-secondary card-outline" style="height: 500px;overflow: auto;border-top: 3px solid #59a5cb;">
					<table class="table table-striped m-0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "> 
						<thead>
							<tr>
								<th>물품명</th>
								<th>세탁 품목</th>
								<th>개수</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${itemOrderDetailList }" var="itemOrderDetail">
							<tr>
								<td>${articlesMap[itemOrderDetail.articlesCode] }</td>
								<td>${itemOrderDetail.articlesCode} </td>
								<td class="count">${itemOrderDetail.orderCount }</td>
								<td class="price">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${itemOrderDetail.price }" />
										원
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="2">합계</td>
								<td>총 개수:<p id="totalCount"></p></td>
								<td>총 가격:<p id="totalPrice"></p></td>
							</tr>
						</tbody>
						
					</table>
					
				</div>
			</div>
		</div>
		<div class="float-right mr-3">
			<c:if test="${comCodeMap[itemOrder.itemOrderStatus] eq '승인대기' }">
			<button type="button" class="btn btn-danger btn-m" onclick="ItemOrderRemove('${itemOrder.ordercode}')">취소</button>
			</c:if> 
			<c:if test="${comCodeMap[itemOrder.itemOrderStatus] eq '발주완료' }">
				<button type="button" class="btn btn-primary btn-m" onclick="ItemOrderUpdate('${itemOrder.ordercode}')">수령</button>
				<button type="button" class="btn btn-primary btn-m" onclick="ItemNotReciveUpdate('${itemOrder.ordercode}')">미수령</button>
			</c:if>
			<c:if test="${comCodeMap[itemOrder.itemOrderStatus] eq '미수령' }">
				<button type="button" class="btn btn-primary btn-m" onclick="ItemOrderUpdate('${itemOrder.ordercode}')">수령</button>
			</c:if>
		</div>
	</div>
	<div id="formTag"></div>
	

	
<script>
window.onload=function(){
	let count = document.querySelectorAll(".count");
	let price = document.querySelectorAll(".price");
	let countSum=0;
	let priceSum=0;
	for(let i = 0 ; i <count.length;i++){
	   countSum += parseInt(count[i].innerText);
	   priceSum += parseInt(price[i].innerText)
	}
	let totalCount = document.querySelector("#totalCount");
	let totalPrice = document.querySelector("#totalPrice");
	totalCount.innerText=countSum;
	totalPrice.innerText=priceToString(priceSum);
}
function priceToString(price){
	 return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 }
</script>
<script>
function ItemOrderRemove(ordercode){
	let tag= document.querySelector("#formTag") 	
	let form = document.createElement("form");
    form.action="remove"
    form.method="post"
    let input = document.createElement("input")
    input.name="ordercode"
    input.setAttribute("value",ordercode)
    form.append(input);
    //console.log(form)
     tag.append(form);
    form.submit();
} 
function ItemOrderUpdate(ordercode){
	let tag= document.querySelector("#formTag")
	let form = document.createElement("form");
    form.action="modify"
    form.method="post"
    let input = document.createElement("input")
    input.name="ordercode"
    input.setAttribute("value",ordercode)
    form.append(input);
    tag.append(form);
    form.submit();

	
}
function ItemNotReciveUpdate(ordercode){
	let tag= document.querySelector("#formTag")
	let form = document.createElement("form");
    form.action="notreceived"
    form.method="post"
    let input = document.createElement("input")
    input.name="ordercode"
    input.setAttribute("value",ordercode)
    form.append(input);
    tag.append(form);
    form.submit();

	
}
</script>
	
</body>
