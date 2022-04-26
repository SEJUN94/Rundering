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
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>지점전체조회</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">지점관리</li>
					<li class="breadcrumb-item active">지점전체조회</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<div class="row ml-3 mr-3">
	<div class="card col-12">
		<div class="card-body p-0">
			<table class="table table-striped projects" style="text-align:center;">
				<thead>
					<tr>
						<th style="width: 10%">지점장</th>
						<th style="width: 20%">지점</th>
						<th>주문량</th>
						<th style="width: 12%">지점상세</th>
						<th style="width: 12%">세탁상세</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty throughputList }">
						<tr>
							<td colspan="5" style="text-align:center;"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${throughputList }" var="throughput">
						<tr>
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
							<td>
								<button class="btn btn-warning btn-sm" onclick="window.open('<%=request.getContextPath()%>/admin/branchinfo/infodetail?branchCode=${throughput.branchCode } ','지점상세', 'width=800, height=800')">지점상세</button>
							</td>
							<td>
								<button class="btn btn-warning btn-sm" onclick="window.open('<%=request.getContextPath()%>/admin/branchinfo/quotadetail?throughputNo=${throughput.throughputNo }','세탁량상세보기','width=800, height=800')">세탁상세</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>



