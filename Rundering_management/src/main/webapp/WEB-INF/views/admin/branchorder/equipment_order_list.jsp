<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="itemOrderList" value="${dataMap.itemOrderList }" />

<title>지점 발주 내역</title>

<body>
	<div style="height: 20px;"></div>
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0">
				<h3 class="m-3">지점 발주 내역</h3>
				<div class="card-body table-responsive p-0 mt-0">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
								<th>발주번호</th>
								<th>지점번호</th>
								<th>요청일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty itemOrderList }">
								<td colspan="4" style="text-align:center;"><strong>발주내역이 존재하지 않습니다.</strong></td>
							</c:if>
							<c:forEach items="${itemOrderList }" var="itemOrder">
								<tr
									onclick="window.open('<%=request.getContextPath()%>/admin/branchorder/detail?seq=${itemOrder.ordercode }', '발주 상세', 'width=700, height=900');"
									style="cursor: pointer;">
									<td>${itemOrder.ordercode }</td>
									<td>${itemOrder.branchCode }</td>
									<td>
										<fmt:formatDate value="${itemOrder.registDate }" pattern="	yy-MM-dd HH:mm" /> 
									</td>
									<td><span class="badge badge-warning">${itemOrder.itemOrderStatus }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>