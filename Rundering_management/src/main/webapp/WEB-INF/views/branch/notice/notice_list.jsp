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
</style>
</head>
<body>
	<section class="content-header">
	   <div class="container-fluid">
	      <div class="row mb-2">
	         <div class="col-sm-6">
	            <h1>공지사항</h1>
	         </div>
	      </div>
	   </div>
	</section>
	<div class="row ml-3 mr-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h2 style="height: 20px;" class="card-title">
		            	<b></b>
		            </h2>
					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 300px;">
							<select class="form-control col-md-4" name="searchType"
								id="searchType">
								<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>전체</option>
								<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
								<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
							</select> <input class="form-control" type="text" name="keyword"
								placeholder="검색어를 입력하세요." value="" /> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button"
									onclick="list_go(1);" data-card-widget="search" style="background-color: #59a5cb;border-color: #59a5cb;">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>
					</div>
				</div>

				<div class="card-body p-0"  style="height: 540px">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr style="text-align: center;">
								<th class="noticeno" style="width:5%;"></th>
								<th class="title" style="width:50%;">제목</th>
								<th class="employeeId" style="width:10%;">작성자</th>
								<th class="registDate" style="width:20%;">작성일</th>
								<th class="">첨부파일</th>
								<th class="views" style="width:10%;">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty noticeList }">
								<tr>
									<td colspan="5" style="text-align: center;"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${noticeList }" var="notice" varStatus="status">
								<tr style='font-size: 1em; cursor: pointer;text-align: center;'
									onclick="OpenWindow('detail?from=list&noticeno=${notice.noticeno }','상세보기',800,700);">
									<td>${(cri.page - 1) * cri.perPageNum + (status.index +1) }</td>
									<td id="Title"
										style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										${notice.title }
										<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
										<fmt:parseNumber value="${notice.registDate.time / (1000*60*60*24)}" integerOnly="true" var="chgDttm" /><!-- 게시글 작성날짜를 숫자로 -->
										<c:if test="${today - chgDttm le 3}"><!-- 3일동안은 new 표시 -->
											&nbsp;&nbsp;<span class="badge bg-red">new</span>
										</c:if>
										
									</td>
									<td data-target="notice-employeeId">${notice.employeeId}</td>
									<td><fmt:formatDate value="${notice.registDate }"
											pattern="yyyy-MM-dd" /></td>
									<td>
										<c:if test="${!empty notice.atchFileNo }">
											<i class="nav-icon fas fa-file"></i>
										</c:if>
										<c:if test="${empty notice.atchFileNo }">
											<span>-</span>
										</c:if>
									</td>
									<td>${notice.views }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer" style="font-size:0.9em;">
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
			</div>
		</div>
	</div>
</body>



