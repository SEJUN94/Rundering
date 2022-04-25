<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="faqList" value="${dataMap.faqList }" />

<head>
<style>
.outer {
	display: flex;
	justify-content: center;
}

th, td {
	text-align: center;
}

.no {
	width: 10%;
}

.category {
	width: 15%
}

.title {
	width: 22%;
}

.writer {
	width: 18%;
}

.date {
	width: 25%;
}

.yn {
	width: 10%;
}
</style>
</head>

<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>문의게시판</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">문의게시판</li>
						<li class="breadcrumb-item"><a href="#">Home</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">문의게시판</h3>
				<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 300px;">
						<select class="form-control col-md-4" name="searchType"
							id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>카테고리</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>제목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>질문자</option>
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

			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="no">번호</th>
							<th class="category">카테고리</th>
							<th class="title">제목</th>
							<th class="writer">작성자</th>
							<th class="date">문의일</th>
							<th class="yn">비밀글</th>
						</tr>
					</thead>
					<c:if test="${empty faqList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${faqList }" var="faq">
						<tr
							onclick="OpenWindow('detail?from=list&faqno=${faq.faqno }','상세보기',900,700);">
							<td class="no">${faq.faqno }</td>
							<td class="category">${faq.setbukdoorclcode }</td>
							<td class="title">${faq.question }</td>
							<td class="writer">${faq.writer }</td>
							<td class="date"><fmt:formatDate
									value="${faq.registDate }" pattern="yyyy-MM-dd" /></td>
							<td class="yn">${faq.secretyn }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="float-right mt-3 mr-3 mb-3">

					<button class="btn btn-primary" type="button" id="registBtn"
						onclick="location.href='<%=request.getContextPath()%>/question/registForm'">
						작성하기</button>
				</div>
			</div>
		</div>

		<div class="card-footer" style="font-size: 0.9em">
			<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
		</div>
	</div>
</body>