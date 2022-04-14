<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>휴먼 계정 리스트</title>
</head>
<div class="row ml-3 mr-3">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">휴먼 계정 리스트</h2>
				<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 150px;">
						<input type="text" name="table_search"
							class="form-control float-right" placeholder="Search">
						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap"
					style="text-align: center;">
					<thead>
						<tr> 
							<th>회원번호</th>
							<th>이름</th>
							<th>휴먼 시작일</th>
							<th>상태변경</th>
						</tr>
					</thead>
					<tbody>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/customer/dormantdetail.do'"> 
							<td>183</td>
							<td>John Doe</td>
							<td>2022-03-27</td>
							<td><span class="badge bg-success">휴먼해제</span></td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/customer/dormantdetail.do'"> 
							<td>219</td>
							<td>Alexander Pierce</td>
							<td>2022-03-21</td>
							<td><span class="badge bg-success">휴먼해제</span></td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/customer/dormantdetail.do'"> 
							<td>657</td>
							<td>Bob Doe</td>
							<td>2021-12-04</td>
							<td><span class="badge bg-success">휴먼해제</span></td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/customer/dormantdetail.do'"> 
							<td>175</td>
							<td>Mike Doe</td>
							<td>2021-11-30</td>
							<td><span class="badge bg-success">휴먼해제</span></td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/customer/dormantdetail.do'"> 
							<td>115</td>
							<td>Henry Doe</td>
							<td>2021-10-27</td>
							<td><span class="badge bg-success">휴먼해제</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/include/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
	function openwindow() {

	}
</script>
</body>

