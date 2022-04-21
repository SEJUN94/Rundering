<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryItemsList" value="${dataMap.laundryItemsList }" />
>>>>>>> refs/heads/suyoon_admin_laundryItem
    
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

				<div class="card-body table-responsive p-0 mt-0">
				<form role="form" class="form-horizontal" action="regist"
						method="post" name="registForm">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
<<<<<<< HEAD
								<th>품목번호</th>
								<th>품목명</th>
								<th>세탁가격</th>
								<th>비고</th>
=======
							    <th style="width:150px;">구분</th>
								<th style="width:180px;">품목번호</th>
								<th style="width:180px;">품목명</th>
								<th style="width:150px;">세탁가격</th>
								<th style="width:70px;">수정</th>
								<th style="width:80px;">삭제</th>
								
>>>>>>> refs/heads/suyoon_admin_laundryItem
							</tr>
						</thead>
						<tbody>
<<<<<<< HEAD
							<tr>
								<td>95183</td>
								<td>와이셔츠</td>
								<td>1,800원</td>
								<td></td>
							</tr>
							<tr>
								<td>95184</td>
								<td>교복셔츠</td>
								<td>1,800원</td>
								<td></td>
							</tr>
							<tr>
								<td>95185</td>
								<td>일반셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							<tr>
								<td>95186</td>
								<td>티셔츠</td>
								<td>3,000원</td>
								<td></td>
							</tr>
							
=======
							<c:if test="${empty laundryItemsList }">
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${laundryItemsList }" var="laundryItems">
									<tr style='font-size: 0.85em;'>
										<td>${laundryItems.laundryCategory }</td>
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
>>>>>>> refs/heads/suyoon_admin_laundryItem
						</tbody>
					</table>
				</form>

<<<<<<< HEAD
					<div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination justify-content-center m-0">
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-right"></i>
								</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-double-right"></i>
								</a></li>
							</ul>
						</nav>
=======
					<div class="card-footer" >
						
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							<div class="float-right mb-3 mr-2">
							<button type="button" class="btn btn-primary"
							onclick="window.open('<%=request.getContextPath()%>/admin/laundryitems/regist','세탁품목등록', 'width=600, height=600')">
							물품등록</button>
>>>>>>> refs/heads/suyoon_admin_laundryItem
					</div>

				</div>

			</div>
		</div>
	</div>
<<<<<<< HEAD

=======
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
>>>>>>> refs/heads/suyoon_admin_laundryItem

</body>
</html>