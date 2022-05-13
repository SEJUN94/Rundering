<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>세탁주문 상세</title>
<head>
<style>
.orderDetailListScroll thead, .orderDetailListScroll tbody {
	display: block;
}

.orderDetailListScroll th, .orderDetailListScroll td {
	width: 100%;
}

.orderDetailListScroll tbody {
	height: 295px;
	overflow-y: auto; /* Trigger vertical scroll    */
	overflow-x: hidden; /* Hide the horizontal scroll */
}

/* 스크롤바 설정*/
.orderDetailListScroll tbody::-webkit-scrollbar{
	/* 스크롤바 막대 너비 설정 */
	width: 6px;
}
/* 스크롤바 막대 설정*/
.orderDetailListScroll tbody::-webkit-scrollbar-thumb{
	/* 스크롤바 막대 높이 설정 */
	height: 17%;
	background-color: #d3d3d3;
	/* 스크롤바 둥글게 설정 */
	border-radius: 10px;
}
/* 스크롤바 뒷 배경 설정*/
.orderDetailListScroll tbody::-webkit-scrollbar-track {
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>

<body>
<div class="row" style="width: 100%">
	<div class="col-6 pl-3">
		<h3 class="m-3">세탁주문 상세</h3>
		<div class="p-3 m-0 card-secondary card-outline">
			<div class="row">
				<div class="col-12">
					<h5><c:if test="${!empty laundryOrder.branchCode }">
							${laundryOrder.branchCode }
						</c:if> 
						<c:if test="${empty laundryOrder.branchCode }">
							지점미할당
						</c:if> 
						<span class="float-right">
						<span class="badge bg-secondary">${orderCodeMap[laundryOrder.orderStatus]}</span>
						</span>
					</h5>
					<p class="m-0">
						주문번호: <span class="float-right"> ${laundryOrder.orderNo }</span>
					</p>
					<p class="m-0">
						주문일: <span class="float-right"> <fmt:formatDate value="${laundryOrder.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</p>
				</div>
			</div>
			<div class="card-body p-0">
				<hr class="mt-2 mb-2">
				<strong><i class="fas fa-user mr-1"></i> 주문자</strong>
				<p class="text-muted m-0">${laundryOrder.memberNo}</p>
				<hr class="mt-2 mb-2">
				<strong><i class="fas fa-mobile-alt mr-1"></i> 연락처</strong>
				<p class="text-muted m-0">${laundryOrder.contactNumber}</p>
				<hr class="mt-2 mb-2">
				<strong><i class="fas fa-map-marker-alt mr-1"></i> 주소지</strong>
				<p class="text-muted m-0">${laundryOrder.zip}</p>
				<p class="text-muted m-0">${laundryOrder.add1}</p>
				<p class="text-muted m-0">${laundryOrder.add2}</p>
				<hr class="mt-2 mb-2">
				<strong><i class="fas fa-pencil-alt mr-1"></i> 요청사항</strong>
				<c:if test="${!empty laundryOrder.requestDetails }">
				<p class="text-muted m-0">${laundryOrder.requestDetails}</p>
				</c:if>
				<c:if test="${empty laundryOrder.requestDetails }">
					<p class="text-muted m-0">-</p>
				</c:if>
			</div>
			<hr class="mt-2 mb-2">


			<div class="row invoice-info">
				<div class="col-sm-6 invoice-col">
					<strong>수거요청일자</strong><br>
					<p class="text-muted m-0"><fmt:formatDate value="${laundryOrder.pickupRequestDate }" pattern="yyyy-MM-dd"/></p>
					<hr class="mt-2 mb-2">
					<strong>수거완료일시</strong><br>
					<c:if test="${!empty laundryOrder.pickupDate }">
					<p class="text-muted mb-2"><fmt:formatDate value="${laundryOrder.pickupDate }" pattern="yyyy-MM-dd HH:mm"/></p>
					</c:if>
					<c:if test="${empty laundryOrder.pickupDate }">
					<p class="text-muted mb-2">-</p>
					</c:if>
				</div>

				<div class="col-sm-6 invoice-col">
					<strong>배송요청일자</strong><br>
					<p class="text-muted m-0"><fmt:formatDate value="${laundryOrder.deliveryRequestDate }" pattern="yyyy-MM-dd"/></p>
					<hr class="mt-2 mb-2">
					<strong>배송완료일시</strong><br>
					<c:if test="${!empty laundryOrder.deliveryDate }">
					<p class="text-muted mb-2"><fmt:formatDate value="${laundryOrder.deliveryDate }" pattern="yyyy-MM-dd HH:mm"/></p>
					</c:if>
					<c:if test="${empty laundryOrder.deliveryDate }">
					<p class="text-muted mb-2">-</p>
					</c:if>
				</div>


			</div>
			</div>
	
	<div class="card">
					<h4 class="m-3">주문관련문의</h4>
				<div class="card-body table-responsive p-0 card-secondary card-outline" style="min-height: 195px;">
					<table class="table table-head-fixed text-nowrap">
						<thead>
						<tr style="text-align: center;">
								<th class="width70 pl-3">문의제목</th>
								<th class="width15">문의일자</th>
								<th class="width15">답변여부</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty faqList }">
							<tr>
								<td colspan="3" style="text-align: center;"><strong>접수된 문의가 없습니다.</strong></td>
							</tr>
						</c:if>
						<c:forEach items="${faqList }" var="faq">
							<tr style='cursor: pointer;' onclick="OpenWindow('<%=request.getContextPath()%>/admin/question/detail?from=list&faqno=${faq.faqno }','상세보기',700,600);">
								<td class="pl-3">
									<c:if test="${fn:length(faq.question) > 11}">
									${fn:substring(faq.question,0,11) }..
									</c:if>
									<c:if test="${fn:length(faq.question) <= 11}">
									${faq.question}
									</c:if>
								</td>
								<td>${faq.registDate }</td>
								<td><c:if test="${empty faq.answer }">미답변</c:if><c:if test="${!empty faq.answer }">답변완료</c:if></td>
							</tr>
						</c:forEach> 
						</tbody>
					</table>
				</div>
			</div>
	
	</div>
	
	<div class="col-6">
		
		<div class="card">
		<div class="col-12 table-responsive p-0">
			<h4 class="m-3">세탁품목</h4>
					<table class="table table-striped m-0 card-secondary card-outline orderDetailListScroll">
						<thead>
							<tr>
								<th colspan="4" style="text-align: end;">총 결제금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryOrder.totalPrice}" />원</th>
							</tr>
							<tr style="text-align: center;">
								<th style="width: 232px;">세탁물</th>
								<th style="width: 60px;">개수</th>
								<th style="width: 130px;">가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${laundryOrderDetailList }" var="laundryOrderDetail" >
								<tr>
									<td style="width: 232px;">${laundryOrderDetail.itemsName}</td>
									<td style="text-align: end; width: 60px;">${laundryOrderDetail.quantity}</td>
									<td style="text-align: end;  width: 130px;" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryOrderDetail.price}" />원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
				
			<div class="card mt-1">
					<h4 class="m-3">담당지점</h4>
				<div class="card-body p-0 card-secondary card-outline" style="min-height: 280px;">
					<table class="table">
						<tbody>
							<c:if test="${empty branchDetail }">
								<tr>
									<td colspan="2" style="text-align: center;"><strong>할당된 지점이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:if test="${!empty branchDetail }">
							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점명</td>
								<td>${branchDetail.branchName }</td>
							</tr>

							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점 주소</td>
								<td>${branchDetail.add1 } ${branchDetail.add2 }</td>
							</tr>

							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점 연락처</td>
								<td>${branchDetail.branchContact }</td>
							</tr>

							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점장명</td>
								<td>${branchDetail.name }</td>
							</tr>

							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점장 연락처</td>
								<td>${branchDetail.phone }</td>
							</tr>

							<tr>
								<td style="background-color: #f7f5f5; width: 145px;">지점장 이메일</td>
								<td>${branchDetail.email }</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			
		</div>
		</div>
</body>
