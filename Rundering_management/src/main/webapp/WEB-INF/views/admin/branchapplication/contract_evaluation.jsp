<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="branchApplicationList" value="${dataMap.branchApplicationList }" />
<body>
${branchApplicationList }
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>지점 등록 관리</h1>
			</div>
		</div>
	</div>
</section>

<div class="row ml-3 mr-3">
	<div class="col-12">
		<div class="card">
			<div class="card-header">

				<div class="input-group input-group-sm">
					<h2 style="height: 20px;" class="card-title">
						<b>지점 신청 리스트</b>
					</h2>

					<div class="col-7"></div>
				</div>
				<div class="card-tools"></div>

			</div>

			<div class="card-body p-0">
				<table style="text-align: center;" class="table text-nowrap">
					<thead>
						<tr>
							<th class="width10">이름</th>
							<th class="WID">전화번호</th>
							<th>이메일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty branchApplicationList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
						<c:forEach items="${branchApplicationList }" var="branchApplication">
					
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<c:if test="${branchApplication.progress_status_code eq '01'} ">
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_request()">신청승인</button>
								</c:if>
								<c:if test="${branchApplication.progress_status_code eq '02'} ">
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_request()">신청승인</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_examine()">심사승인</button>
								</c:if>
								<c:if test="${branchApplication.progress_status_code eq '03'} ">
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_request()">신청승인</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_examine()">심사승인</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_voluntary()">수의계약</button>
								</c:if>
								<c:if test="${branchApplication.progress_status_code eq '04' }">
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_request()">신청승인</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_examine()">심사승인</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_voluntary()">수의계약</button>
									<button type="submit" class="btn btn-outline-danger btn-sm" onclick="branch_enrollment()">지점등록</button>
								</c:if>
								</td>
							</tr>
						</c:forEach>
							
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/admin/employee/pagination.jsp"%>
			</div>
		</div>
	</div>
</div>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<div id="handleTag">
	
	
</div>


<%@ include file="./request_js.jsp" %>
<%@ include file="./enrollment_js.jsp" %>
<%@ include file="./examine_js.jsp" %>
<%@ include file="./voluntary_js.jsp" %>
			
	<script>
	
	</script>	


</body>


