<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="itemOrderList" value="${dataMap.itemOrderList }" />
<c:set var="comCode" value="${dataMap.comCodeMap }"/>
<c:set var="totalPrice" value="${dataMap.totalPriceMap}"/>

<body>
<c:if test="${from eq 'remove' }">
	<script>
		alert("취소되었습니다.");
		window.close();
		window.opener.location.reload();
	</script>
</c:if>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">발주내역</h3>
						<div class="card-tools">

							<div class="input-group input-group-sm">

								<span class="input-group-append">

									<button class="btn btn-primary">확인</button>
								</span>
								<div class="input-group-sm selectWidth">
									<select class="form-control " name="searchType" id="searchType">
										<option value="a">미승인</option>
										<option value="b">승인</option>
										
										<option value="c">미수령</option>
										<option value="d">수령</option>
									</select>
								</div>
								<span class="input-group-append">
									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
`							</div>
						</div>
					</div>

					<div class="card-body">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr style="text-align: center;">
									<th class="width25">발주번호</th>
									<th class="width30">총 가격</th>
									<th class="width25">발주신청일</th>
									<th class="width20">상태</th>
								</tr>
							</thead>
							
							
							
							<tbody>
							<c:if test="${empty itemOrderList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>				
					<c:forEach items="${itemOrderList }" var="itemOrder">
						<tr style='cursor:pointer;' onclick="OpenWindow('detail.do?ordercode=${itemOrder.ordercode }','상세보기',800,700);">
							<td>${itemOrder.ordercode }</td>
							<td style="text-align: right;">${totalPrice[itemOrder.ordercode] }</td>
							<td style="text-align: center;"><fmt:formatDate value="${itemOrder.registDate }" pattern="yyyy-MM-dd"/></td>			
							<td style="text-align: center;">${comCode[itemOrder.itemOrderStatus] }<td>		
						</tr>
					</c:forEach>
								
							</tbody>
						</table>
					</div>
					<div class="card-footer"></div>
				</div>

			</div>
		</div>
	</div>
</body>
