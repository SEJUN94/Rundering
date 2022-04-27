<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cri" value="${pageMaker.cri }" />

<body>

	<!-- 상세검색 카드 -->
	<div class="card ml-3 mr-3 mb-0">
		<form class="form-horizontal">
			<div class="card-body">
				<div class="form-group row m-0">
					<label for="orderstatus" class="col-sm-2 col-form-label">주문상태</label>
					<div class="col-sm-10 p-2" style="display: inline-flex;">
						<div class="form-check ">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거대기&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">세탁중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">세탁완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">배송중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">배송완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">취소&nbsp;&nbsp;</label>
						</div>
					</div>
				</div>
				<div class="form-group row m-0">
					<label for="orderperiod" class="col-sm-2 col-form-label">수거요청일</label>
					<div class="col-sm-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="far fa-calendar-alt"></i>
								</span>
							</div>
							<input type="text" id="dates" class="form-control">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0 card-secondary card-outline">
			<div class="card-header">
					<h3 class="card-title" style="font-size: 1.75rem;">세탁 주문</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 300px;margin-top: auto;">
							<select class="form-control col-md-4" name="searchType" id="searchType">
									<option>지점명</option>
									<option>주문자명</option>
									<option>배송연락처</option>
								</select> <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""> <span class="input-group-append">
									<button class="btn btn-primary" type="button" onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
						</div>
					</div>
				</div>

				<div class="card-body table-responsive p-0 mt-0">
					<table
						class="table table-hover text-nowrap" style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 230px;">주문일시</th>
								<th>주문번호</th>
								<th>수거요청일</th>
								<th>지역분류</th>
								<th>담당지점</th>
								<th>주문상태</th>
							</tr>   
						</thead>    
						<tbody>
							<c:forEach items="${laundryOrderList }" var="laundryOrder" >
								<tr onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do?orderNo=${laundryOrder.orderNo }', '주문 상세', 'width=800, height=900');"
									style="cursor: pointer;">
									<td><fmt:formatDate value="${laundryOrder.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${laundryOrder.orderNo }</td>
									<td><fmt:formatDate value="${laundryOrder.pickupRequestDate }" pattern="yyyy-MM-dd"/></td>
									<td>${areaCodeMap[laundryOrder.area]}</td>
									<c:if test="${!empty laundryOrder.branchCode }"> 
									<td>${branchNameMap[laundryOrder.branchCode]}</td>
									</c:if>
									<c:if test="${empty laundryOrder.branchCode }"> 
									<td>미할당</td>
									</c:if>
									<td>${orderCodeMap[laundryOrder.orderStatus]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
					</div>

				</div>

			</div>
		</div>
	</div>
	

	<script>
		//daterangepicker 설정
		moment.locale('ko'); //언어를 한국어로 설정함!
		  $('#dates').daterangepicker(
		    {
		      timePicker: false,
		      timePicker24Hour: true,
		      timePickerSeconds: true,
		      singleDatePicker: false,
		      locale :{ 
		        format: 'YYYY-MM-DD',
		        separator: '~',
		        applyLabel: "적용",
		        cancelLabel: "닫기"
		      },
		    });
	</script>

</body>



