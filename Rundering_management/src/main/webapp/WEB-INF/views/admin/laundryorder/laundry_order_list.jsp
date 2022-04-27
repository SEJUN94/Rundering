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
								<input class="form-check-input" type="checkbox" name="orderStatus" id="${orderCode.key}" onclick="list_go('1');" value="${orderCode.key}" ${fn:contains(cri.orderStatus, orderCode.key) ? 'checked' : ''} ><label class="form-check-label" for="${orderCode.key}">${orderCode.value}&nbsp;&nbsp;</label>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="form-group row m-0">
					<label for="dates" class="col-sm-1 col-form-label pr-0">수거요청일</label>
					<div class="col-sm-4 pl-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="far fa-calendar-alt"></i></span>
							</div>
							<input type="text" id="dates" class="form-control" name="pickupRequestDate" value="${cri.pickupRequestDate }">
						</div>
					</div>
					<label for="branchCode" class="col-sm-1 col-form-label ml-3" style="text-align: end;">담당지점</label>
					<div class="col-sm-2">
						<select class="form-control" name="branchCode" id="branchCode" style="width: auto;" onchange="list_go('1')">
								<option value="">전체</option>
								<option value="notAssigned" ${cri.branchCode eq 'notAssigned' ? 'selected':'' }>미할당</option>
								<c:forEach items="${branchNameMap }" var="branchCode">
									<c:if test="${branchCode.key ne '000000'}">
									<option value="${branchCode.key }"
										${cri.branchCode eq branchCode.key ? 'selected':'' }>${branchCode.value }</option>
									</c:if>
								</c:forEach>
						</select>
					</div>
					<label for="area" class="col-sm-1 col-form-label ml-5" style="text-align: end;">지역분류</label>
					<div class="col-sm-2">
						<select class="form-control" name="area" id="area" style="width: auto;" onchange="list_go('1')">
								<option value="">전체</option>
								<c:forEach items="${areaCodeMap }" var="areaCode">
										<option value="${areaCode.key }"
											${cri.area eq areaCode.key ? 'selected':'' }>${areaCode.value }</option>
								</c:forEach>
						</select>
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
					<span class="text-muted" style="display: inline-block;margin-top: 6px;padding-left: 15px;">검색결과 <fmt:formatNumber type="number" maxFractionDigits="3" value="${pageMaker.totalCount }" />개</span>
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



