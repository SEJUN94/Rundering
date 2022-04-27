<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cri" value="${pageMaker.cri }" />

<body>

	<!-- 상세검색 카드 -->
	<div class="card ml-3 mr-3 mb-0">
		<form class="form-horizontal">
			<div class="card-body">
				<div class="form-group row m-0">
					<label for="orderstatus" class="col-sm-1 col-form-label">주문상태</label>
					<div class="col-sm-11 p-2 pl-4" style="display: inline-flex;">
						<c:forEach items="${orderCodeMap }" var="orderCode" >
							<div class="form-check ">
								<input class="form-check-input" type="checkbox" name="orderStatus" id="${orderCode.key}" onclick="list_go('1');" value="${orderCode.key}" <c:if test = "${fn:contains(cri.orderStatus, orderCode.key)}">checked</c:if>><label class="form-check-label" for="${orderCode.key}">${orderCode.value}&nbsp;&nbsp;</label>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="form-group row m-0">
					<label for="orderperiod" class="col-sm-1 col-form-label pr-0">수거요청일</label>
					<div class="col-sm-4 pl-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="far fa-calendar-alt"></i></span>
							</div>
							<input type="text" id="dates" class="form-control" name="pickupRequestDate" value="${cri.pickupRequestDate }">
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
								<c:if test="${empty laundryOrderList }" >
									<tr>
										<td colspan="7">
											<strong>해당하는 주문내역이 없습니다.</strong>
										</td>
									</tr>
								</c:if>			
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
						<%@ include file="/WEB-INF/views/admin/laundryorder/laundry_order_pagination.jsp" %>
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
		      autoUpdateInput: false,
		      locale :{ 
		        format: 'YYYY-MM-DD',
		        separator: '~',
		        applyLabel: "적용",
		        cancelLabel: "적용취소"
		      },
		    });
		  $('input[name="pickupRequestDate"]').on('apply.daterangepicker', function(ev, picker) {
		      $(this).val(picker.startDate.format('YYYY-MM-DD') + '~' + picker.endDate.format('YYYY-MM-DD'));
		      list_go('1');
		  });

		  $('input[name="pickupRequestDate"]').on('cancel.daterangepicker', function(ev, picker) {
		      $(this).val('');
		      list_go('1');
		  });
	</script>

</body>



