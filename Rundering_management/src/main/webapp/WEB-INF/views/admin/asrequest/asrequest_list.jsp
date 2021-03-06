<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="asRequestList" value="${dataMap.asRequestList }" />

<head>

<style>
th, td {
	text-align: center;
}

.no {
	width: 10%;
}

.boardtitle {
	width: 20%;
}

.object {
	width: 14%
}

.writer {
	width: 14%;
}

.branchName {
	width: 14%;
}

.date {
	width: 14%;
}

.yn {
	width: 14%;
}
</style>
</head>

<body>
<section class="content-header">
	   <div class="container-fluid">
	      <div class="row mb-2">
	         <div class="col-sm-6">
	            <h1>AS 요청</h1>
	         </div>
	      </div>
	   </div>
	</section>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card ">
					<div class="card-header">
						<h3 class="card-title"></h3>
						<div class="card-tools">
							<div class="input-group input-group-sm" style="width: 300px;">
								<select class="form-control col-md-4" name="searchType"
									id="searchType">
									<option value="tcwbk"
										${cri.searchType eq 'tcwbk' ? 'selected':'' }>전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
									<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>담당자</option>
									<option value="b" ${cri.searchType eq 'b' ? 'selected':'' }>지점</option>
									<option value="k" ${cri.searchType eq 'k' ? 'selected':'' }>확인여부</option>
								</select> <input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button" style="background-color: #59a5cb;border-color: #59a5cb;"
										onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="card-body p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="no">번호</th>
									<th class="boardtitle">제목</th>
									<th class="object">물품명</th>
									<th class="writer">요청자</th>
									<th class="branchName">지점</th>
									<th class="date">요청날짜</th>
									<th class="yn" style="text-align: center;height: 24px;padding-bottom: 8px;padding-top: 0px;">
                                    <div class="input-group input-group-sm">
										 <select class="form-control"  name="searchType2" id="searchType2" onchange="list_go2(1);">
											<option value="">확인여부</option>
                                             	<option value="ca" ${cri.searchType eq 'ca' ? 'selected':'' }>확인</option>
                                             	<option value="cb" ${cri.searchType eq 'cb' ? 'selected':'' }>미확인</option>
                                             	<option value="cd" ${cri.searchType eq 'cd' ? 'selected':'' }>조치완료</option>
                                         </select>
                                     </div>
                                	</th>
								</tr>
							</thead>
							<c:if test="${empty asRequestList }">
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${asRequestList }" var="asRequest" varStatus="status">
								<tr style='cursor: pointer;'
									onclick="OpenWindow('detail?from=list&asno=${asRequest.asno }','상세보기',900,700);">
									<td class="no">${(cri.page - 1) * cri.perPageNum + (status.index +1) }</td>
									<td class="boardtitle" style="text-align: left;">${asRequest.title }</td>
									<td class="object">${asRequest.objectname }</td>
									<td class="writer">${asRequest.employeeId }</td>
									<td class="branchName">${asRequest.branchCode }</td>
									<td class="date"><fmt:formatDate
											value="${asRequest.registDate }" pattern="yyyy-MM-dd" /></td>
									<td class="yn">
									<c:if test="${asRequest.checkyn eq '조치완료' }">
										<span class="badge badge-success">
										${asRequest.checkyn }
										</span>
									</c:if>
									<c:if test="${asRequest.checkyn eq '미확인' }">
										<span class="badge badge-danger">
										${asRequest.checkyn }
										</span>
									</c:if>
									<c:if test="${asRequest.checkyn eq '확인' }">
										<span class="badge badge-warning">
										${asRequest.checkyn }
										</span>
									</c:if>
									
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="float-right mt-3 mr-3 mb-3">
							<%-- <button class="btn btn-primary" type="button" id="registBtn"
									onclick="location.href='<%=request.getContextPath()%>/branch/asrequest/registForm'">
									요청하기</button> --%>
						</div>
					</div>
					<div class="card-footer" style="font-size: 1em">
						<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>