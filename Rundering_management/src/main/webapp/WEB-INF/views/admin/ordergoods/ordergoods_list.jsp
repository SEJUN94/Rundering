<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryArticlesList" value="${dataMap.laundryArticlesList }" />
<c:set var="EACHList" value="${dataMap.EACHList }" />
<c:set var="CLCODEList" value="${dataMap.CLCODEList }" />

<head>
<title>Insert title here</title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>발주 등록 관리</h1>
				</div>
			</div>
		</div>
	</section>


	<div class="card ml-3 mr-3" style="height: 400px">
		<div class="card-header">
			<h2 style="height: 20px;" class="card-title">
				<b>발주 물품 리스트</b>
			</h2>
			<div class="card-tools">
				<div class="input-group input-group-sm" style="width: 300px;">
					
					<select class="form-control col-md-4" name="clcode" id="clcode" onchange="list_go(1);">
						<option value="">전체</option>
						<c:forEach items="${CLCODEList }" var="CLCODE">
						<option value="${CLCODE.comCode }" ${cri.searchType eq CLCODE.comCode ? 'selected' : '' }> ${CLCODE.comCodeNm} </option>
						</c:forEach>
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
									<th style="width: 100px;">물품명</th>
									<th style="width: 70px;">물품가격</th>
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
		</div>
	</div>
<div class="row ml-3 mr-3" id="removeTag">
		<div class="col-6" >
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title" style="padding-top: 6px;">
						<b>물품 등록</b>
					</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-primary btn-sm float-right"
								onclick="">
								 저장
							</button>
						</div>
				</div>
					<div class="card-body row" style="height: 260px;padding-top: 10px;">
							<div class="col-md-12 row">
								<div class="form-group col-12">
									<label>물품명</label>
									<input type="text" class="form-control" id="branchName" name="branchName" value="" >
								</div>
								
							</div>
							<div class="col-md-12 row">
								<div class="form-group col-5">
									<label>물품분류</label> 
									<select class="form-control " name="clcode" >
										<c:forEach items="${CLCODEList }" var="CLCODE">
										<option value="${CLCODE.comCode }"> ${CLCODE.comCodeNm} </option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-4">
										<label>물품가격</label> 
										<input type="text" class="form-control quantity" style="text-align: end;" id="branchLndrpcrymslmcoqy" name="branchLndrpcrymslmcoqy" value="" >
								</div>
								<div class="form-group col-3">
									<label>단위</label> 
										<select class="form-control "> 
											<c:forEach items="${EACHList}" var="EACH">
												<option value="${EACH.comCode} ">${EACH.comCodeNm} </option>
											</c:forEach>
										</select>
								</div>
								
							</div>
							<div class="col-md-12 row">
								<div class="form-group col-12">
									<label>비고</label> 
									<input type="text" class="form-control" id="add1" name="add1" value="" >
								</div>
								
							</div>
						</div>
		
			</div>
		</div>

		<div class="col-6">
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title" style="padding-top: 6px;">
						<b>이미지</b>
					</h3>
						<div class="card-tools fileInput p-0">
							<div class="inputRow" data-no="0">
								<label for="inputFile" data-no="0" class="btn btn-secondary btn-sm input-group-addon" onclick="justPressed(this)">파일선택</label>
								<input id="inputFileName" type="file" name="tempPicture" data-no="0" disabled="">
							</div>
						</div>
				</div>
					<div class="card-body" style="height: 260px;">
				
				</div>
			</div>
		
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