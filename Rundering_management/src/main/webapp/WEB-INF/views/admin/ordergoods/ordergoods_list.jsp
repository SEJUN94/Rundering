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
	<div class="card card-primary card-tabs ml-3 mr-3">
		<div class="card-header p-0 pt-1">
			<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
				<li class="pt-2 px-3"><h3 class="card-title">구분</h3></li>
				<li class="nav-item"><a class="nav-link active"
					id="custom-tabs-two-home-tab" data-toggle="pill"
					href="#custom-tabs-two-home" role="tab"
					aria-controls="custom-tabs-two-home" aria-selected="true">전체</a></li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-profile-tab" data-toggle="pill"
					href="#custom-tabs-two-profile" role="tab"
					aria-controls="custom-tabs-two-profile" aria-selected="false">가루세제</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-messages-tab" data-toggle="pill"
					href="#custom-tabs-two-messages" role="tab"
					aria-controls="custom-tabs-two-messages" aria-selected="false">액체세제</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-hello-tab" data-toggle="pill"
					href="#custom-tabs-two-hello" role="tab"
					aria-controls="custom-tabs-two-hello" aria-selected="false">세탁비누</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-nice-tab" data-toggle="pill"
					href="#custom-tabs-two-nice" role="tab"
					aria-controls="custom-tabs-two-nice" aria-selected="false">섬유유연제</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-meet-tab" data-toggle="pill"
					href="#custom-tabs-two-meet" role="tab"
					aria-controls="custom-tabs-two-meet" aria-selected="false">세탁보조</a>
				</li>
			</ul>
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
								<c:if test="${!empty laundryArticlesList }">
									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<tr>
											<td>${laundryArticles.articlesCode }</td>
											<td>${laundryArticles.articlesName }</td>
											<td style="text-align: center;">${laundryArticles.price }</td>
											<td><fmt:formatDate value="${laundryArticles.registDate }"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${laundryArticles.modifyDate }"
													pattern="yyyy-MM-dd" /></td>
											<td><button class="btn btn-warning btn-sm"
													onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="custom-tabs-two-profile"
					role="tabpanel" aria-labelledby="custom-tabs-two-profile-tab">
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
							<tbody>
								<c:if test="${!empty laundryArticlesList }">

									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<c:if test="${laundryArticles.clcode eq 'B' }">
											<tr>
												<td>${laundryArticles.articlesCode }</td>
												<td>${laundryArticles.articlesName }</td>
												<td style="text-align: center;">${laundryArticles.price }</td>
												<td><fmt:formatDate value="${laundryArticles.registDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${laundryArticles.modifyDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn btn-warning btn-sm"
														onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
											</tr>
										</c:if>	
									</c:forEach>	
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="custom-tabs-two-messages"
					role="tabpanel" aria-labelledby="custom-tabs-two-messages-tab">
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
							<tbody>
								<c:if test="${!empty laundryArticlesList }">

									<c:forEach items="${laundryArticles }" var="laundryArticles">
										<c:if test="${laundryArticles.clcode eq 'C' }">
											<tr>
												<td>${laundryArticles.articlesCode }</td>
												<td>${laundryArticles.articlesName }</td>
												<td style="text-align: center;">${laundryArticles.price }</td>
												<td><fmt:formatDate value="${laundryArticles.registDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${laundryArticles.modifyDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn btn-warning btn-sm"
														onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
											</tr>
										</c:if>	
									</c:forEach>	
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="custom-tabs-two-hello"
					role="tabpanel" aria-labelledby="custom-tabs-two-hello-tab">
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
							<tbody>
								<c:if test="${!empty laundryArticlesList }">

									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<c:if test="${laundryArticles.clcode eq 'D' }">
											<tr>
												<td>${laundryArticles.articlesCode }</td>
												<td>${laundryArticles.articlesName }</td>
												<td style="text-align: center;">${laundryArticles.price }</td>
												<td><fmt:formatDate value="${laundryArticles.registDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${laundryArticles.modifyDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn btn-warning btn-sm"
														onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
											</tr>
										</c:if>	
									</c:forEach>	
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="custom-tabs-two-nice"
					role="tabpanel" aria-labelledby="custom-tabs-two-nice-tab">
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
							<tbody>
								<c:if test="${!empty laundryArticlesList }">
									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<c:if test="${laundryArticles.clcode eq 'E' }">
											<tr>
												<td>${laundryArticles.articlesCode }</td>
												<td>${laundryArticles.articlesName }</td>
												<td style="text-align: center;">${laundryArticles.price }</td>
												<td><fmt:formatDate value="${laundryArticles.registDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${laundryArticles.modifyDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn btn-warning btn-sm"
														onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
											</tr>
										</c:if>	
									</c:forEach>	
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="custom-tabs-two-meet"
					role="tabpanel" aria-labelledby="custom-tabs-two-meet-tab">
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
							<tbody>
								<c:if test="${!empty laundryArticlesList }">

									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<c:if test="${laundryArticles.clcode eq 'F' }">
											<tr>
												<td>${laundryArticles.articlesCode }</td>
												<td>${laundryArticles.articlesName }</td>
												<td style="text-align: center;">${laundryArticles.price }</td>
												<td><fmt:formatDate value="${laundryArticles.registDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${laundryArticles.modifyDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn btn-warning btn-sm"
														onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
											</tr>
										</c:if>	
									</c:forEach>	
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer clearfix">
			<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			<button type="button" class="btn btn-primary btn-sm float-right"
				onclick="window.open('<%=request.getContextPath()%>/admin/ordergoods/registForm', '발주물품등록', 'width=600, height=600')">
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

