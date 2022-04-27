<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryArticlesList" value="${dataMap.laundryArticlesList }" />
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="card card-primary card-outline ml-3 mr-3">
		<div class="card-header">
			<h3 class="card-title">발주물품관리</h3>
			<div class="card-tools">
				<div class="input-group input-group-sm" style="width: 300px;">
					<select class="form-control col-md-4" name="clcode" id="clcode" onchange="list_go(1);">
						<option value="">전체</option>
						<option value="B" ${cri.clcode eq 'B' ? 'selected' : '' }>가루세제</option>
						<option value="C" ${cri.clcode eq 'C' ? 'selected' : '' }>액체세제</option>
						<option value="D" ${cri.clcode eq 'D' ? 'selected' : '' }>세탁비누</option>
						<option value="E" ${cri.clcode eq 'E' ? 'selected' : '' }>섬유유연제</option>
						<option value="F" ${cri.clcode eq 'F' ? 'selected' : '' }>세탁보조</option>
					</select>
					<input class="form-control" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value=""> 
					<span class="input-group-append">
						<button class="btn btn-primary" type="button"
							onclick="list_go(1);" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div>
		<div class="card-body p-0">
			<div class="tab-content" id="custom-tabs-two-tabContent">
				<div class="tab-pane fade show active" id="custom-tabs-two-home"
					role="tabpanel" aria-labelledby="custom-tabs-two-home-tab">
					<div class="card-body table-responsive p-0">
						<table class="table table-head-fixed text-nowrap">
							<thead style="text-align: center;">
								<tr>
									<th style="width: 70px">물품코드</th>
									<th style="width: 100px;">상품명</th>
									<th style="width: 70px;">단가</th>
									<th style="width: 100px">등록일</th>
									<th style="width: 100px">수정일</th>
									<th style="width: 50px;">상세</th>
								</tr>
							</thead>
							<tbody style="text-align: center;">
								<c:if test="${empty laundryArticlesList }">
									<tr>
										<td colspan="5" style="text-align: center;"><strong>물품이
												없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${laundryArticlesList }" var="laundryArticles">
									<tr>
										<td>${laundryArticles.articlesCode }</td>
										<td>${laundryArticles.articlesName }</td>
										<td style="text-align: center;">${laundryArticles.price }</td>
										<td><fmt:formatDate
												value="${laundryArticles.registDate }" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate
												value="${laundryArticles.modifyDate }" pattern="yyyy-MM-dd" /></td>
										<td><button class="btn btn-warning btn-sm"
												onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${laundryArticles.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer clearfix">
			<%@ include file="/WEB-INF/views/admin/ordergoods/pagination.jsp"%>
			<button type="button" class="btn btn-primary btn-sm float-right"
				onclick="window.open('<%=request.getContextPath()%>/admin/ordergoods/registForm', '발주물품등록', 'width=600, height=800')">
				<i class="fas fa-plus"></i> Add item
			</button>
		</div>
	</div>
	<c:if test="${from eq 'regist' }">
		<script>
			alert("등록되었습니다.");
			window.close();
			window.opener.location.reload();
		</script>
	</c:if>
</body>