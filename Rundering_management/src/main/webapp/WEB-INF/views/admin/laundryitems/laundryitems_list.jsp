<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryItemsList" value="${dataMap.laundryItemsList }" />
<c:set var="codeMap" value="${dataMap.codeMap }" />

<title>세탁 품목 관리</title>

<body>
 
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0">
				<div class="card-header">
					<h3 class="card-title" style="font-size: 1.75rem;">세탁 품목</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 300px;">
							<select class="form-control col-md-4" name="searchType"
									id="searchType">
									<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>품목번호</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>품목명</option>
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
					<%-- <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="custom-tabs-three-home-tab" data-toggle="pill" href="#custom-tabs-three-home" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" style="border-color: gray;">전체</a></li>
						<c:forEach items="${codeMap }" var="code">
							<li class="nav-item"><a class="nav-link active" id="custom-tabs-three-home-tab" data-toggle="pill" href="#custom-tabs-three-home" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true">${code.value }</a></li>
								
						</c:forEach>
					</ul> --%>
				<div class="card-body table-responsive p-0 mt-0">
				<form role="form" class="form-horizontal" action="regist"
						method="post" name="registForm">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
							    <th style="width:150px;">분류</th>
								<th style="width:180px;">품목번호</th>
								<th style="width:180px;">품목명</th>
								<th style="width:150px;">세탁가격</th>
								<th style="width:70px;">수정</th>
								<th style="width:80px;">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty laundryItemsList }">
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${laundryItemsList }" var="laundryItems">
									<tr style='font-size: 0.85em;'>
										<td>${codeMap[laundryItems.laundryCategory] }</td>
										<td id="laundryItemsCode"
											style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											${laundryItems.laundryItemsCode }</td>
										<td>${laundryItems.itemsName}</td>
										<td>${laundryItems.price }</td>
										<td><button type="button" class="btn btn-block btn-warning btn-xs"
										onclick="window.open('<%=request.getContextPath()%>/admin/laundryitems/modifyForm?laundryItemsCode=${laundryItems.laundryItemsCode }','세탁품목수정', 'width=600, height=600')">수정</button></td>
										<td><button type="button" class="btn btn-block btn-danger btn-xs" onclick="remove_go('remove','${laundryItems.laundryItemsCode}');">삭제</button></td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
				</form>
					<div class="card-footer" >
						
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							<div class="float-right mb-3 mr-2">
							<button type="button" class="btn btn-primary"
							onclick="window.open('<%=request.getContextPath()%>/admin/laundryitems/regist','세탁품목등록', 'width=600, height=600')">
							물품등록</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>

function remove_go(url,laundryItemsCode){
	   if(confirm("삭제하시겠습니까?")){
	      alert("삭제되었습니다.")   
	      location.href=url+"?laundryItemsCode="+laundryItemsCode
	   }
		window.opener.location.reload();
	}



</script>

</body>
</html>