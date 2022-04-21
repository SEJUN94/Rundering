<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="confirmedOrderDetailVOList" value="${dataMap.confirmedOrderDetailVOList }" />
<c:set var="totalPrice" value="${dataMap.totalPrice }" />
<c:set var="orderName" value="${dataMap.orderName }" />

<head>
<style>
.inputRow {
	padding: 11px;
	margin-left: 50px;
}
</style>
</head>

<body>
	<form role="form" action="<%=request.getContextPath()%>/order/completed" method="post">
		<div style="width: 60%; margin-left: 20%;">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>주문/결제</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item active">주문/결제</li>
								<li class="breadcrumb-item"><a href="#">세탁주문</a></li>
							</ol>
						</div>
					</div>
				</div>
			</section>
			<div class="card">
				<img
					src="<%=request.getContextPath()%>/resources/images/how_use.png" alt="how_use">
			</div>
			<div class="card mb-0" style="box-shadow: none;">
				<div class="card-header">
					<h3 class=""
						style="text-align: center; font-size: 1.3rem; font-weight: 400;">주문정보
						확인</h3>
				</div>
			</div>
			<div class="hiddenInput">
					<input type="hidden" name="contactNumber" value="${command.contactNumber}" >
					<input type="hidden" name="addressNo" value="${command.addressNo}" >
					<input type="hidden" name="zip" value="${command.zip}" >
					<input type="hidden" name="add1" value="${command.add1}" >
					<input type="hidden" name="add2" value="${command.add2}" >
					<input type="hidden" name="setDefaultAddr" value="${command.setDefaultAddr}" >
					<input type="hidden" name="pickupRequestDate" value="${command.pickupRequestDate}" >
					<input type="hidden" name="requestDetails" value="${command.requestDetails}" >
					<c:if test="${!empty command.laundryItemsCode }">
						<c:forEach items="${command.laundryItemsCode }" var="laundryItemsCode">
							<input type="hidden" name="laundryItemsCode" value="${laundryItemsCode}" >
						</c:forEach>
					</c:if>
					<input type="hidden" name="paymentNo" id="paymentNo" value="" >
					<input type="hidden" name="totalPrice" id="totalPrice" value="" >
			</div>
			<div class="col-8 mt-3" style="margin: auto;">
				<div class="card">
					<div class="card-body table-responsive p-0">
						<table class="table table-striped table-valign-middle">
							<thead>
								<tr style="text-align: center;">
									<th>품목명</th>
									<th>수량</th>
									<th style="width: 120px;">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty confirmedOrderDetailVOList }">
									<c:forEach items="${confirmedOrderDetailVOList }" var="orderDetail">
											<tr style="text-align: center;"">
												<td>${orderDetail.itemsName }</td>
												<td>${orderDetail.quantity }개</td>
												<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDetail.price }" />원</td>
											</tr>
									</c:forEach>
								</c:if>
							
								
							</tbody>
						</table>
					</div>
				</div>

			</div>
			
			<p class="mt-5 mb-3" style="text-align: center;">세탁물 보호를 위해 접수하신 세탁물의 상태 확인이 가능한 사진을 첨부 바랍니다.</p>
			
			
			<div class="form-group col-8" style="margin: auto;">								
								<div class="card">
									<div class="card-header" style="text-align: center;">
										<h5 style="display:inline;">사진첨부</h5>
										&nbsp;&nbsp;<button class="btn btn-xs btn-secondary"
										onclick="addFile_go();"	type="button" id="addFileBtn"><i class="fas fa-images"></i> Add File</button>
									</div>									
									<div class="card-footer fileInput p-0">
										<div class="inputRow" data-no="0"><input type="file" name="pictureFile" style="display: inline;"><button onclick="remove_go(0);" style="border:0; outline:0;" class="badge bg-red" type="button">X</button></div>
									</div>
								</div>
							</div>
			<p class="mt-4 mb-3" style="text-align: center;">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</p>

			<div class="col-lg-5 card" style="margin-left: 215px;">
				<div class="info-box mb-3">
					<span class="info-box-icon bg-success elevation-1">
					<i class="fas fa-credit-card"></i></span>
					<div class="info-box-content">
						<span class="info-box-text" style="margin: auto;">총 결제 금액</span> 
						<span class="info-box-number" style="margin: auto;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</span>
						<button type="button" id="check_module" class="btn btn-secondary">결제하기</button>
					</div>
				</div>
			</div>
			

		</div>
	</form>
	
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	
<script>

var dataNum = 1;

	function addFile_go(){
	   
	   if($('input[name="pictureFile"]').length >= 5){
	      alert("사진 첨부는 5개까지만 가능합니다.");
	      return;
	   }
	   
	   var div = $("<div>").addClass("inputRow").attr("data-no", dataNum);
	   var input = $("<input>").attr({"type":"file", "name":"pictureFile"}).css("display", "inline");
	   
	   div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0; outline:0;' class='badge bg-red' type='button'>X</button>");
	   
	   $('.fileInput').append(div);
	   dataNum++;
	}

	function remove_go(dataNum){
		if($('input[name="pictureFile"]').length == 1){
		      alert("사진 첨부는 필수입니다.");
		      return;
		   }
		$('div[data-no="'+dataNum+'"]').remove();
	}
	
	function regist_go(){
		//alert("regist btn click");
		
		var files = $('input[name="pictureFile"]');
		for(var file of files){
			console.log(file.name + " : "+ file.value);
			if(file.value == ""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}
		
		if($("input[name='title']").val()==""){ //form.title.value
			alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
		}
		
		$("form[role='form']").submit();
		
	}
	
</script> 

<script>
$('input[name="pictureFile"]').change(function(){
	
	let form = $('form');
	//let formData = new FormData(form);
	
	console.log(form);
	<%-- $.ajax({
		url: "<%=request.getContextPath()%>/order/picture",
		data:formData,
		type:'POST',
		processData:false,
		contentType:false,
		success:function(data){
			//업로드 확인변수 세팅
			$('input[name="checkUpload"]').val(1);
			//저장된 파일명 저장.
			$('input#oldFile').val(data); //변경시 삭제될 파일명
			$('form[role="form"] input[name="picture"]').val(data);
			alert("사진이 업로드 되었습니다.");
		},
		error:function(error){
			//alert("현재 사진 업로드가 불가합니다. \n관리자에게 연락바랍니다.");
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	}); --%>


});


	
</script>

    
	
	<script>
	
	$("#check_module").click(function () {
								IMP.init('imp22830422');   //아임포트 관리자계정
								//결제 시스템을 실행시키는 함수
								IMP.request_pay({
									pg: 'html5_inicis',
									pay_method: 'card',
									name: '${orderName}',
										
									amount: '${totalPrice}',   //테스트 완료 후 가격정보 넣기
									buyer_email: "${loginUser.email}",

									buyer_name: "${loginUser.name}"
								}, function (rsp) {
									if (rsp.success) {
										let msg = '결제가 완료되었습니다.';
										msg += rsp.buyer_name;
										msg += rsp.paid_amount;
										
										$('#paymentNo').val(rsp.merchant_uid);
										$('#totalPrice').val(rsp.paid_amount);

										// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
										// 결제내역을 사용자에게 보여주기 위해 필요함.
										$.ajax({
											url: "<%=request.getContextPath()%>/order/payment",
											type: "POST",
											data: JSON.stringify ({
												"memberNo": '${loginUser.memberNo}',
												"paymentNo": rsp.merchant_uid,
												"paymentType": rsp.pay_method,
												"paymentName": rsp.name,
												"paymentPrice": rsp.paid_amount
											}),
											contentType:'application/json',
											dataType: "json",
											success: function (result) {
												if (result.insertResult == "success") {
													$("form").submit();
													console.log(msg);
													
												} else {
													alert("DB입력실패");
													return false;
												}
											}
										});
									} else {
										let msg = '결제에 실패하였습니다.';
										msg += '\n에러내용 : ' + rsp.error_msg;
									}
									console.log(msg);
								});
							});
	</script>
</body>