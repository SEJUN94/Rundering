<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
</style>
<head>
</head>
<title>주문량</title>
<body>

<div class="row">
	<div class="card col-12">
		<div class="card-header">
			<h3 class="card-title">세탁 주문량</h3>
		</div>
		<div class="card-body p-0">
			<table class="table table-striped projects">
				<thead>
					<tr>
						<th style="width: 20%">지점장</th>
						<th style="width: 20%">지점</th>
						<th>주문량</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty throughputList }">
						<tr>
							<td colspan="4" style="text-align:center;"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${throughputList }" var="throughput">
						<tr onclick="window.open('<%=request.getContextPath()%>/admin/branchinfo/quotadetail?throughputNo=${throughput.throughputNo }','세탁량상세보기','width=800, height=800')">
							<td></td>
							<td>${throughput.branchName }</td>
							<td class="project_progress">
								<c:if test="${throughput.quotaPercent gt 0 and throughput.quotaPercent le 60}">
								<div class="progress progress-sm"> 
									<div class="progress-bar bg-green" role="progressbar"
										aria-valuenow="${throughput.quotaPercent }" aria-valuemin="0" aria-valuemax="100"
										style="width: ${throughput.quotaPercent}%">
									</div>
								</div> 
								</c:if>
								<c:if test="${throughput.quotaPercent gt 60 and throughput.quotaPercent le 80 }">
									<div class="progress progress-sm"> 
										<div class="progress-bar bg-warning" role="progressbar"
											aria-valuenow="${throughput.quotaPercent }" aria-valuemin="0" aria-valuemax="100"
											style="width: ${throughput.quotaPercent}%">
										</div>
									</div>
								</c:if>
								<c:if test="${throughput.quotaPercent gt 80 and throughput.quotaPercent le 101 }">
									<div class="progress progress-sm"> 
										<div class="progress-bar bg-red" role="progressbar"
											aria-valuenow="${throughput.quotaPercent }" aria-valuemin="0" aria-valuemax="100"
											style="width: ${throughput.quotaPercent}%">
										</div>
									</div>
								</c:if>
								<small> ${throughput.quotaPercent }%</small>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>
</body>



