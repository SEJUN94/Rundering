<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />
    
<title>세탁 품목 관리</title>

<body>
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0">
				<div class="card-header">
					<h3 class="card-title" style="font-size: 1.75rem;">세탁 품목</h3>
					<div class="card-tools">
						<div class="input-group" style="width: 250px;">
							<input type="text" name="table_search"
								class="form-control float-right" placeholder="품목명">
							<div class="input-group-append">
								<button type="submit" class="btn btn-default">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>


				<div class="card-body table-responsive p-0 mt-0">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
							    <th class="category">구분</th>
								<th class="itemcode">품목번호</th>
								<th class="itemname">품목명</th>
								<th class="price">세탁가격</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty noticeList }">
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${noticeList }" var="notice">
									<tr style='font-size: 0.85em; cursor: pointer;'
										onclick="OpenWindow('detail?from=list&noticeno=${notice.noticeno }','상세보기',800,700);">
										<td>${notice.noticeno }</td>
										<td id="Title"
											style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											${notice.title }</td>
										<td data-target="notice-employeeId">${notice.employeeId}</td>
										<td><fmt:formatDate value="${notice.registDate }"
												pattern="yyyy-MM-dd" /></td>
										<td><span class="badge bg-red">${notice.views }</span></td>
									</tr>
								</c:forEach>
						</tbody>
					</table>


					<div class="card-footer" >
						
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							<div class="float-right mb-3 mr-2">
						<a	href="<%=request.getContextPath()%>/admin/notice/registform">
						
							<button type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#modal-lg">물품등록</button>
						</a>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>

</body>
</html>