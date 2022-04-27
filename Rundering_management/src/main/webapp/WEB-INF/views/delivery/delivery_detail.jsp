<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${dataMap.delivery }" var="delivery"></c:set>
<c:set value="${dataMap.orderList }" var="orderList"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8s">
<title>배송 상세정보</title>
</head>
<body>
	<div class="card">
		<div class="card-header" style="">
			<h3 class="card-title p-1" style="font-size: 1.4rem;">배송 상세정보</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool p-3"
					title="Remove" style="">
					<i class="fas fa-times" style="font-size: 1.7rem;"></i>
				</button>
			</div>
		</div>
		
		<div class="card-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">
					<div class="col-12 col-sm-4">
						<div class="custom-file" style="padding: 1.5rem;">
							<input type="file" class="custom-file-input"
								id="exampleInputFile"> <label class="custom-file-label"
								for="exampleInputFile">사진을 첨부해주세요.</label>
						</div>
						<div class="info-box bg-light" onclick="delivery_complete();">
							<div class="info-box-content">
								<span class="info-box-text text-center text-muted"
									style="font-size: 2rem;">배송완료</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-12 col-lg-4 order-1 order-md-2">
					<div class="text-muted">
						<p class="text-lg p-2">
							배송 요청일 <b class="d-block"><fmt:formatDate value="${delivery.deliveryRequestDate }" pattern="yyyy-MM-dd" /></b>
						</p>
						<p class="text-lg p-2">
							주소지 <b class="d-block">${delivery.add1 }</b> <b class="d-block">${delivery.add2 }</b>
						</p>
						<p class="text-lg p-2">
							배송 세탁물 
							<c:forEach items="${orderList }" var="order">
								<b class="d-block">${order.itemsName } ${order.quantity }개</b> 
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	function delivery_complete(){
		if(confirm("배송완료하시겠습니까?")){
			alert("배송완료되었습니다.")
		}
	}
</script>

</body>
</html>