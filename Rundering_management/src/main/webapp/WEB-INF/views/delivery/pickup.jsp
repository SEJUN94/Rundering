<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${dataMap.pickupList }" var="pickupList"></c:set>
<c:set value="${dataMap.pickupCompleteList }" var="pickupCompleteList"></c:set>


<!DOCTYPE html>
<body>
	<div class="card card-outline card-outline-tabs card-info">
		<div class="card-header p-0 border-bottom-0"
			style="font-size: 1.4rem;">
			<ul class="nav nav-tabs justify-content-center"
				id="custom-tabs-four-tab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="custom-tabs-four-home-tab" data-toggle="pill"
					href="#custom-tabs-four-home" role="tab"
					aria-controls="custom-tabs-four-home" aria-selected="true">진행중
						수거 목록</a></li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-four-profile-tab" data-toggle="pill"
					href="#custom-tabs-four-profile" role="tab"
					aria-controls="custom-tabs-four-profile" aria-selected="false">완료된
						수거 목록</a></li>
			</ul>
		</div>
		<div class="card-body p-0">
			<div class="tab-content" id="custom-tabs-four-tabContent">
				<div class="tab-pane fade active show" id="custom-tabs-four-home"
					role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
					<table class="table table-striped" style="font-size: 1.2rem;">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>배송 주소지</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pickupList }">
								<tr>
									<td colspan="2" style="text-align: center;"><strong>수거할 세탁물이 없습니다</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${pickupList }" var="pickupList">
								<tr onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickupdetail?orderNo=${pickupList.orderNo }&orderStatus=01'">
									<td>${pickupList.orderNo }</td>
									<td>${pickupList.add1 }${pickupList.add2 }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="custom-tabs-four-profile"
					role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
					<table class="table table-striped" style="font-size: 1.2rem;">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>배송 주소지</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pickupCompleteList }">
								<tr>
									<td colspan="2" style="text-align: center;"><strong>수거완료된 세탁물이 없습니다</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${pickupCompleteList }" var="list">
								<tr onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickupdetail?orderNo=${list.orderNo }&orderStatus=03'">
									<td id="orderNo" name="">${list.orderNo }</td>
									<td>${list.add1 }${list.add2 }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>


