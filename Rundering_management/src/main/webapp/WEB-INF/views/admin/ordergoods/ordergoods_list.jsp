<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			<table class="table">
				<thead style="text-align: center;">
					<tr>
						<th style="width: 150px">물품 번호</th>
						<th style="width: 100px;">상품명</th>
						<th style="width: 250px">원가</th>
						<th style="width: 100px">등록일</th>
						<th style="width: 100px">수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty orderGoodsList }" >
						<tr>
							<td colspan="5">
								<strong>물품이 없습니다.</strong>
							</td>
						</tr>
					</c:if>	
					<c:forEach items="${orderGoodsList }" var="orderGoods">
						<tr>
							<td>${orderGoods.lndrwaterqlyCode }</td>
							<td id="boardTitle" style="text-align:center;">
							<a href="javascript:OpenWindow('detail?lndrwaterqlyCode=${orderGoods.lndrwaterqlyCode }&from=list','상세보기',800,700);">
								<span class="col-sm-12 ">
									${orderGoods.price }
								</span>								
							</a>
							</td>
							<td>${orderGoods.writer }</td>
							<td>
								<fmt:formatDate value="${orderGoods.registDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><span class="badge bg-red">${orderGoods.modifyDate }</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="card-footer clearfix">
				<button type="button" class="btn btn-primary btn-sm float-right"
					onclick="window.open('/runderingmanage/admin/ordergoods/regist', '팝업창 이름', 'width=700, height=700')">
					<i class="fas fa-plus"></i> Add item
				</button>
				<!-- <button type="button" class="btn btn-primary float-right" onclick="regist_go('asdf')"><i class="fas fa-plus"></i> Add item</button> -->
			</div>
		</div>

	</div>	
	<script>
		function regist_go(url) {
			alert("hello");

		}
	</script>
</body>

</html>