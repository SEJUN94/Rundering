<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
				<h1>재고 현황</h1>
			</div>
			<div class="col-sm-6 ">
				<h4 class="h4 float-right">
				
				<c:if test="${dataMap.status02 ne '0' }">
				발주대기 : ${dataMap.status02 }개
				</c:if>
				<c:if test="${dataMap.status02 eq '0' }">
				발주대기 : 0개
				</c:if> 
				/
				<c:if test="${dataMap.status03 ne '0' }">
				발주완료 : ${dataMap.status03 }개
				</c:if>
				<c:if test="${dataMap.status03 eq '0' }">
				발주완료 : 0개
				</c:if>  
				
				
				</h4>
			</div>
		</div>
	</div>
</section>
	<div class=" ml-3 mr-3 " id="appendOrder">
       		 
                
     </div>


    <div class="card-secondary  ml-3 mr-3 row">
    	<div class="col-6" style="padding-left: 0px;" id="appenRegist">
        
          </div>
     	<div class="col-6" style="padding-right: 0px;" id="appendOut">
        
        
        </div>
    	
    </div>
   
    <script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
    <%@ include file="./regist_list.jsp" %>
    <%@ include file="./out_list.jsp" %>
    <%@ include file="./order_list.jsp" %>
<script>


window.onload=function(){
	registList("<%=request.getContextPath()%>/branch/item/insertList?page="+page)
	out_List('<%=request.getContextPath()%>/branch/item/outlist?page='+out_page)
	order_List('<%=request.getContextPath()%>/branch/item/orderlist?page='+order_page)
	
}

function minusQuantity(){
	let input =event.target.parentNode.parentNode.querySelectorAll('.inputValue')[0]
	let intValue= parseInt(input.value)
	let result=intValue-1;
	if(result<0){
		result=0;
	}
	input.value=result;
}


</script>

</body>