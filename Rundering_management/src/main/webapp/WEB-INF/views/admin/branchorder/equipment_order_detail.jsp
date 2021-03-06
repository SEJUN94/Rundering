<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="itemOrder" value="${dataMap.itemOrder }" />
<c:set var="itemOrderDetail" value="${dataMap.itemOrderDetail }" />

<!DOCTYPE html>
<html>
<head>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<meta charset="UTF-8">
<title>발주내역 상세</title>
</head>
<body>
	<div class="col-12 p-0">

    <div class="p-3 m-0">
        <div class="row">
            <div class="col-12">
                <h4>
                    <i class="fas fa-globe"></i>${itemOrder.branchName }
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
                 <button type="button" class="btn bg-gradient-danger float-right"
                    style="margin-right: 5px;" onclick="CloseWindow();">닫기
                </button>
				<c:if test="${itemOrder.itemOrderStatus eq '01'}">
                <button type="button" class="btn btn-danger float-right" style="margin-right: 5px;"
                	onclick="fail();">
              			      반려
                </button>
 				 <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;"
 				 	onclick="success();">
             			       승인
                </button>
				</c:if>
				<c:if test="${itemOrder.itemOrderStatus eq '02'}">
                <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;"
                	onclick="orderSuccess();">
              			      발주완료
                </button>
				</c:if>
            </div>
        </div>
        <div class="row">
            <div class="col-12 table-responsive p-0">
                <table class="table table-striped m-0 card-secondary card-outline">
                    <thead>
                        <tr>
                            <th colspan="4">총 결제금액 : 90,000원</th>
                        </tr>
                        <tr>
                            <th>제품명</th>
                            <th>개수</th>
                            <th>제품번호</th>
                            <th>가격</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${itemOrderDetail }" var="itemOrderDetail">
	                       <tr>
	                           <td>${itemOrderDetail.articlesName }</td>
	                           <td>${itemOrderDetail.orderCount }</td>
	                           <td>${itemOrderDetail.articlesCode }</td>
	                          <td> 
	                          <fmt:formatNumber type="number" maxFractionDigits="3" value="${itemOrderDetail.price }" />
	                           		원
	                           </td>
	                       </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<form action="modifyStatus" method="post" role="success" name="modifyForm">
	<input type="hidden" value="${itemOrder.ordercode }" name="ordercode">
	<input type="hidden" value="02" name="itemOrderStatus">
</form>
<form action="modifyStatus" method="post" role="fail" name="modifyForm">
	<input type="hidden" value="${itemOrder.ordercode }" name="ordercode">
	<input type="hidden" value="05" name="itemOrderStatus">
</form>
<form action="modifyStatus" method="post" role="orderSuccess" name="modifyForm">
	<input type="hidden" value="${itemOrder.ordercode }" name="ordercode">
	<input type="hidden" value="03" name="itemOrderStatus">
</form>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

<script>
	function success() {
		Swal.fire({
            title: '승인하시겠습니까?',
            icon : 'warning' ,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true, // 버튼 순서 거꾸로
            
          }).then((result) => {
              if (result.isConfirmed) {
            	  Swal.fire({
						icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '승인되었습니다.'
					});
			$("form[role='success']").submit();
	    	}
		})
	}
	function orderSuccess(){
		Swal.fire({
            title: '발주하시겠습니까?',
            icon : 'warning' ,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true, // 버튼 순서 거꾸로
            
          }).then((result) => {
              if (result.isConfirmed) {
            	  Swal.fire({
						icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '발주 완료되었습니다.'
				});
			$("form[role='orderSuccess']").submit();
			}
		})
	}
	
	function fail() {
		Swal.fire({
            title: '반려하시겠습니까?',
            icon : 'warning' ,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true, // 버튼 순서 거꾸로
            
          }).then((result) => {
              if (result.isConfirmed) {
            	  Swal.fire({
						icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '반려되었습니다.'
				});
	        $("form[role='fail']").submit();
	    	}
		})
	}
</script>
</body>
</html>