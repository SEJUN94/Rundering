<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />

<head>
<style>
.no {
	width: 10%;
}

.boardtitle {
	width: 35%;
}

.writer {
	width: 20%;
}

.date {
	width: 25%;
}

.clicks {
	width: 10%;
}

#body {
	padding-left: 1%;
	padding-right: 1%;
}
</style>
</head>
<body>
	<div id="body">
		<div class="row">
			<div class="col-12">
				<div class="card card-secondary card-outline">
					<div class="card-header">
						<h3 class="card-title">공지사항</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm" style="width: 400px;">
								<select class="form-control col-md-4" name="searchType"
									id="searchType">
									<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
								</select> <input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<div class="card table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="noticeno">번호</th>
									<th class="title">제목</th>
									<th class="employeeId">작성자</th>
									<th class="registDate">작성일</th>
									<th class="views">조회수</th>
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
					</div>
					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
						<div class="float-right mb-3 mr-2">
							<a
								href="<%=request.getContextPath()%>/admin/notice/registform">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#modal-lg">공지등록</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>



