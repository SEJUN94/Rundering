<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="itemOrderList" value="${dataMap.itemOrderList }" />
<c:set var="status01" value="${dataMap.status01 }" />
<c:set var="status02" value="${dataMap.status02 }" />

<title>지점 발주 내역</title>

<body>



<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<section class="content-header">
   <div class="container-fluid">
      <div class="row mb-2">
         <div class="col-sm-6">
            <h1>지점 발주</h1>
         </div>
         <div class="col-sm-6 ">
         	<h4 class="h4 float-right">
         		<c:if test="${status01 ne '0' }" var="aas">
					승인대기 : ${status01}개
				</c:if>
				<c:if test="${status01 eq '0' }" var="aas">
					승인대기 : 0개
				</c:if>
				/
				<c:if test="${status02 ne '0' }" var="aas">
					발주대기 : ${status02}개
				</c:if>
				<c:if test="${status02 eq '0' }" var="aas">
					발주대기 : 0개
				</c:if>
         	</h4>
         </div>
      </div>
   </div>
</section>

<div class="row ml-3 mr-3 row">
   <div class="col-6" id="appendOrder">
	</div>
	<div class="card card-default col-6" id="appenditem">
	
		
    </div>
</div>
	
	<%@ include file="./itemorder_list.jsp" %>
	<%@ include file="./item_list.jsp" %>
	
	<script>
	window.onload= function (){
		order_List('<%=request.getContextPath()%>/admin/branchorder/orderlist');
		item_List('<%=request.getContextPath()%>/admin/branchorder/itemlist');
	}
	 
	</script>
	
	
</body>