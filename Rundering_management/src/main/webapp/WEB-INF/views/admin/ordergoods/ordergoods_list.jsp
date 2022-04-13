<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="orderGoodsList" value="${dataMap.orderGoodsList }" />

<head>

<title>Insert title here</title>
</head>

<body>
	<div class="card ml-3 mr-3">
		<div class="card-header">
			<h3 class="card-title">발주물품 리스트</h3>
			<div class="card-tools">
				<ul class="pagination pagination-sm float-right">
					<li class="page-item"><a class="page-link" href="#">전체</a></li>
					<li class="page-item"><a class="page-link" href="#">세탁세제</a></li>
					<li class="page-item"><a class="page-link" href="#">세탁보조</a></li>
				</ul>
			</div>
		</div>
		<div class="card-body p-0">
			<table class="table" >
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
				<tbody style="text-align:center;">
					<c:if test="${empty orderGoodsList }" >
						<tr>
							<td colspan="5" style="text-align:center;">
								<strong>물품이 없습니다.</strong>
							</td>
						</tr>
					</c:if>	
					<c:forEach items="${orderGoodsList }" var="orderGoods">
						<tr>
							<td>${orderGoods.articlesCode }</td>
							<td>${orderGoods.articlesName }</td>
							<td style="text-align:center;">
								${orderGoods.price }							
							</td>
							<td>
								<fmt:formatDate value="${orderGoods.registDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<fmt:formatDate value="${orderGoods.modifyDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><button class="btn btn-warning btn-sm"
								 onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/detail?articlesCode=${orderGoods.articlesCode }&from=list ','발주물품등록', 'width=600, height=600')">상세</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="card-footer clearfix">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>	
				<button type="button" class="btn btn-primary btn-sm float-right"
					onclick="window.open('<%=request.getContextPath() %>/admin/ordergoods/registForm', '발주물품등록', 'width=600, height=600')">
					<i class="fas fa-plus"></i> Add item
				</button>
			</div>
		</div>
	</div>	
	<c:if test="${from eq 'regist' }" >
		<script>
			alert("등록되었습니다.");
			window.close();
			window.opener.location.reload();			
		</script>
	</c:if>
		<c:if test="${from eq 'modify' }" >
		<script>
			alert("수정되었습니다.");
			window.close();
			window.opener.location.reload();			
		</script>
	</c:if>
</body>

