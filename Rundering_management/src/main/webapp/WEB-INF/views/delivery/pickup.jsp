<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${dataMap.pickupList }" var="pickupList"></c:set>
<c:set value="${dataMap.pickupCompleteList }" var="pickupCompleteList"></c:set>


<body>
	<div class="card card-outline card-outline-tabs card-info">
		<div class="card-header p-0 border-bottom-0"
			style="font-size: 1.4rem;">
			<ul class="nav nav-tabs justify-content-center"
				id="custom-tabs-four-tab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="custom-tabs-four-home-tab" data-toggle="pill"
					href="#custom-tabs-four-home" role="tab"
					aria-controls="custom-tabs-four-home" aria-selected="true">진행중
						수거 목록</a></li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-four-profile-tab" data-toggle="pill"
					href="#custom-tabs-four-profile" role="tab"
					aria-controls="custom-tabs-four-profile" aria-selected="false">완료된
						수거 목록</a></li>
			</ul>
		</div>
		<div class="card-body p-0">
			<div class="tab-content" id="custom-tabs-four-tabContent">
				<div class="tab-pane fade active show" id="custom-tabs-four-home"
					role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
					<table class="table table-striped" style="font-size: 1.2rem;" id="inventory">
						<thead>
							<tr>
								<th>주문번호</th>
								<th id="deliveryAddr" style="cursor:pointer;">배송 주소지</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pickupList }">
								<tr>
									<td colspan="2" style="text-align: center;"><strong>수거할 세탁물이 없습니다</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${pickupList }" var="pickupList">
								<tr onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickupdetail?orderNo=${pickupList.orderNo }&orderStatus=02'">
									<td>${pickupList.orderNo }</td>
									<td class="addr">${pickupList.add1 }${pickupList.add2 }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="custom-tabs-four-profile"
						role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
					<table class="table table-striped" style="font-size: 1.2rem;">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>배송 주소지</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pickupCompleteList }">
								<tr>
									<td colspan="2" style="text-align: center;"><strong>수거완료된 세탁물이 없습니다</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${pickupCompleteList }" var="list">
								<tr onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickupdetail?orderNo=${list.orderNo }&orderStatus=03'">
									<td id="orderNo" name="">${list.orderNo }</td>
									<td>${list.add1 }${list.add2 }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div onclick="complete_all();"
						class="info-box bg-light" style="position: fixed;
							bottom: 0;">
						<div class="info-box-content" onclick="complete_all()">
							<span class="info-box-text text-center text-muted"
								style="font-size: 2rem;">지점 전달 완료</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>	
var a =document.querySelectorAll('tr').value;
console.log(a)

</script>


<!-- 알림 sweetalert2 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script>
	var data = [];
	var addr = document.querySelectorAll('tr .addr');
	var deliveryAddr = document.getElementById('deliveryAddr');
	var check=true;
	
	deliveryAddr.addEventListener('click', function(e){
		for(var i=0; addr.length>i; i++){
			var a = addr[i].innerHTML;
			
			data.push(a)
		}
		
		if(check==true){
			data.sort(function(a, b) {
				  const upperCaseA = a.toUpperCase();
				  const upperCaseB = b.toUpperCase();
				  
				  check==false
				  if(upperCaseA > upperCaseB) return 1;
				  if(upperCaseA < upperCaseB) return -1;
				  if(upperCaseA === upperCaseB) return 0;
				  console.log(check)
			});
		}else{
			data.sort(function(a, b) {
				  const upperCaseA = a.toUpperCase();
				  const upperCaseB = b.toUpperCase();
				  
				  check==true
				  
				  
				  if(upperCaseA < upperCaseB) return 1;
				  if(upperCaseA > upperCaseB) return -1;
				  if(upperCaseA === upperCaseB) return 0;
				  console.log(check)
			});
		}
	})
	
</script>
	
<script>
	function complete_all(){
		Swal.fire({
            title: '일괄처리 하시겠습니까?',
            text: '확인시 지점으로 전달 완료됩니다.',
            icon : 'warning' ,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true, // 버튼 순서 거꾸로
          }).then((result) => {
          if (result.isConfirmed) {
			$.ajax({
				url : '<%=request.getContextPath()%>/fordelivery/arrive/tobranch',
				data : {},
				type : 'post',
				success : function(ok) {
					if(ok.toUpperCase() == "OK"){
						Swal.fire({ 
							icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title: '취소 처리 되었습니다.',
						});
						setTimeout(function(){location.href='<%=request.getContextPath()%>/fordelivery/pickup';},1000);
					} else {
						Swal.fire({
							icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title: '시스템 오류로 반려 할 수 없습니다.'
						});
					}
				},
				error : function(error) {
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	})
}
</script>
</body>


