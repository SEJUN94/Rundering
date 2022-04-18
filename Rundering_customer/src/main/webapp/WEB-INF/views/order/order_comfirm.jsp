<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="confirmedOrderDetailVOList" value="${dataMap.confirmedOrderDetailVOList }" />
<c:set var="totalPrice" value="${dataMap.totalPrice }" />

<body>
	<form role="form" action="<%=request.getContextPath()%>/order/payment" method="post">
		<div style="width: 60%; margin-left: 20%;">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>주문/결제</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item active">주문/결제</li>
								<li class="breadcrumb-item"><a href="#">세탁주문</a></li>
							</ol>
						</div>
					</div>
				</div>
			</section>
			<div class="card mb-0" style="box-shadow: none;">
				<div class="card-header">
					<h3 class=""
						style="text-align: center; font-size: 1.3rem; font-weight: 400;">주문정보
						확인</h3>
				</div>
			</div>
			<div class="hiddenInput">
					<input type="hidden" name="contactNumber" value="${command.contactNumber}" >
					<input type="hidden" name="addressNo" value="${command.addressNo}" >
					<input type="hidden" name="zip" value="${command.zip}" >
					<input type="hidden" name="add1" value="${command.add1}" >
					<input type="hidden" name="add2" value="${command.add2}" >
					<input type="hidden" name="setDefaultAddr" value="${command.setDefaultAddr}" >
					<input type="hidden" name="pickupRequestDate" value="${command.pickupRequestDate}" >
					<input type="hidden" name="requestDetails" value="${command.requestDetails}" >
					<c:if test="${!empty command.laundryItemsCode }">
						<c:forEach items="${command.laundryItemsCode }" var="laundryItemsCode">
							<input type="hidden" name="laundryItemsCode" value="${laundryItemsCode}" >
						</c:forEach>
					</c:if>
			</div>
			<div class="col-lg-12 p-0">
				<div class="card">
					<div class="card-body table-responsive p-0">
						<table class="table table-striped table-valign-middle">
							<thead>
								<tr style="text-align: center;">
									<th>품목명</th>
									<th>수량</th>
									<th style="width: 120px;">금액</th>
									<th>사진첨부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty confirmedOrderDetailVOList }">
									<c:forEach items="${confirmedOrderDetailVOList }" var="orderDetail">
											<tr style="text-align: center;"">
												<td>${orderDetail.itemsName }</td>
												<td>${orderDetail.quantity }개</td>
												<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDetail.price }" />원</td>
												<td><a class="btn btn-app m-0"><i class="fas fa-save"></i> Save</a></td>
											</tr>
									</c:forEach>
								</c:if>
							
								
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<p class="mb-3" style="text-align: center;">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</p>

			<div class="col-lg-5 card" style="margin-left: 215px;">
				<div class="info-box mb-3">
					<span class="info-box-icon bg-success elevation-1">
					<i class="fas fa-shopping-cart"></i></span>
					<div class="info-box-content">
						<span class="info-box-text" style="margin: auto;">총 결제 금액</span> 
						<span class="info-box-number" style="margin: auto;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</span>
						<button type="button" class="btn btn-secondary">결제하기</button>
					</div>
				</div>
			</div>
			<div class="card">
				<img
					src="<%=request.getContextPath()%>/resources/images/how_use.png"
					alt="how_use">
			</div>

		</div>
	</form>
</body>