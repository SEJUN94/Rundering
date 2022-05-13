<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<c:set var="laundryOrder" value="${dataMap.laundryOrder }" />
<c:set var="detailList" value="${dataMap.detailList }" />
<c:set var="avList" value="${dataMap.avList }" />
<c:set var="rvList" value="${dataMap.rvList }" />
<c:set var="loginUser" value="${loginUser }" />
<c:set var="pickUpNum" value="${dataMap.pickUpNum }" />
<c:set var="deliveryNum" value="${dataMap.deliveryNum }" />

<style>
.circle {
	width: 75px;
	height: 75px;
	border: 15px solid #82BBD8;
	border-radius: 50%;
	margin-right: 200px;
}

.stepper-wrapper {
	margin-top: auto;
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.stepper-item {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 1;
	@media
	(
	max-width
	:768px)
{
	font-size
	:
	12px;
}

}
.stepper-item::before {
	position: absolute;
	content: "";
	border-bottom: 2px solid #ccc;
	width: 100%;
	top: 20px;
	left: -50%;
	z-index: 2;
}

.stepper-item::after {
	position: absolute;
	content: "";
	border-bottom: 2px solid #ccc;
	width: 100%;
	top: 20px;
	left: 50%;
	z-index: 2;
}

.stepper-item .step-counter {
	position: relative;
	z-index: 5;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #ccc;
	margin-bottom: 6px;
}

.stepper-item.active {
	font-weight: bold;
}

.stepper-item.completed .step-counter {
	background-color: #26ff7b;
	color: white;
}

.stepper-item.completed::after {
	position: absolute;
	content: "";
	border-bottom: 2px solid #26ff7b;
	width: 100%;
	top: 20px;
	left: 50%;
	z-index: 3;
}

.stepper-item:first-child::before {
	content: none;
}

.stepper-item:last-child::after {
	content: none;
}
</style>
<div class="col-12" style="padding-top: 30px;">
	<div class="card">
		<div class="card-body mt-3 ml-3 p-0">
			<span style="font-size: 1.5em;">배송조회</span><span
				class="float-right pt-2 pr-3">${laundryOrder.add1}&nbsp;${laundryOrder.add2 }
			</span>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-12" style="padding-top: 10px;">
				<div class="stepper-wrapper">
					<div class="stepper-item completed">
						<div class="step-counter">
							<i class="fa-solid fa-1"></i>
						</div>
						<c:if test="${laundryOrder.orderStatus eq '01'}">
							<div class="step-name">
								<span style="font-size: 1.5em; font-weight: 500;">수거대기</span>
							</div>
						</c:if>
						<c:if test="${laundryOrder.orderStatus ne '01'}">
							<div class="step-name">수거대기</div>
						</c:if>
					</div>
					<c:if test="${laundryOrder.orderStatus == '02'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">수거중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '02'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">수거중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '02' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">수거중</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '03'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">수거완료</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '03'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">수거완료</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '03' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">수거완료</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '04'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">세탁대기</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '04'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">세탁대기</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '04' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">세탁대기</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '05'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">세탁중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '05'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">세탁중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '05' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">세탁중</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '06'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">세탁완료</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '06'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">세탁완료</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '06' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">세탁완료</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '07'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">배송중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '07'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">배송중</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '07' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">배송중</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '08'}">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">배송완료</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus >= '08' }">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">배송완료</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-12"
	style="width: 100%; min-height: 500px; max-height: 500px; margin: 10px auto; display: flex;">

	<div class="card-body col-6 p-0"
		style="min-height: 600px; max-height: 600px; flex: 1; width: 50%; box-sizing: border-box; padding-top: 1px;">
		<div class="card">
			<div class="card-header info-box m-0">

				<span class="info-box-icon bg-success elevation-1"><i
					class="fas fa-shopping-cart"></i></span>
				<div class="info-box-content">
					<span class="info-box-text" style="font-size: 1.5em;">주문 상세
						내역</span>
				</div>
			</div>

			<div class="card-body p-0">
				<ul class="products-list product-list-in-card pl-2 pr-2"
					style="height: 238px;">
					<c:forEach items="${detailList }" var="list">
						<li class="item">
							<div class="product-info">
								<span style="font-weight: 400; font-size: 1.2em;">${list.itemsName }
								</span> <span class="product-description float-right pt-1">${list.quantity }
									개</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<div class="card-footer clearfix" align="right">
				총 가격 :
				<fmt:formatNumber value="${laundryOrder.totalPrice}" pattern="#,###" />
				원
			</div>

		</div>
		<div class="col-md-12 p-0" style="box-sizing: border-box;">

			<div class="card">
				<div class="card-header">
					<h3 class="card-title">담당지점</h3>
					<c:if test="${empty laundryOrder.branchCode }">
					</c:if>
					<c:if test="${!empty laundryOrder.branchCode}">
						<p class="float-right pt-1">${laundryOrder.branchCode }</p>
					</c:if>
				</div>

				<div class="card-body p-0" style="height: 150px;">
					<div style="margin: 30px;">
						<c:if test="${pickUpNum != null}">
							<span style="font-size: 1.2em;">수거기사 연락처 : ${pickUpNum }</span>
						</c:if>
						<c:if test="${pickUpNum == null}">
							<span style="font-size: 1.2em;">수거기사 미정</span>
						</c:if>
					</div>
					<div style="margin: 30px;">
						<c:if test="${deliveryNum != null}">
							<span style="font-size: 1.2em;">배송기사 연락처 : ${deliveryNum }</span>
						</c:if>
						<c:if test="${deliveryNum == null }">
							<span style="font-size: 1.2em;">배송기사 미정</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6 pr-0"
		style="min-height: 450px; max-height: 450px; flex: 1; width: 50%; box-sizing: border-box;">

		<div class="col-md-12 p-0" style="box-sizing: border-box;">

			<div class="card">
				<div class="card-header">
					<h3 class="card-title">사진</h3>
				</div>

				<div class="card-body p-0"
					style="height: 150px; overflow: auto; overflow-x: hidden;">
					<c:if test="${not empty av.bizType eq '세탁주문' }">
						<div class="mt-2 mb-2 ml-3">세탁주문</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '세탁주문' }">
									<div class="orderPicture ml-2" id="pictureView"
										data-id="${av.atchFileNo }" data-aa="${av.atchFileSeq }"
										style="height: 100px; width: 100px;"></div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty av.bizType eq '수거완료사진' }">
						<div class="mt-2 mb-2 ml-3">수거완료</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '수거완료사진' }">
									<div class="orderPicture ml-2" id="pictureView"
										data-id="${av.atchFileNo }" data-aa="${av.atchFileSeq }"
										style="height: 100px; width: 100px;"></div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty av.bizType eq '배송완료사진' }">
						<div class="mt-2 mb-2 ml-3">배송완료사진</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '배송완료사진' }">
									<div class="orderPicture ml-2" id="pictureView"
										data-id="${av.atchFileNo }" data-aa="${av.atchFileSeq }"
										style="height: 100px; width: 100px;"></div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>

		<div
			class="card card-primary card-outline direct-chat direct-chat-primary col-12 p-0"
			style="box-sizing: border-box;">
			<div class="card-header">
				<h3 class="card-title">요청사항</h3>
			</div>

			<div class="card-body">
				<div class="direct-chat-messages" style="overflow: auto;">
					<c:if test="${not empty laundryOrder.requestDetails}">
						<div class="direct-chat-msg right">
							<div class="direct-chat-infos clearfix">
								<span class="direct-chat-timestamp float-left"> <fmt:formatDate
										value="${laundryOrder.orderDate}" pattern="yy-MM-dd HH:mm" />
								</span>
							</div>
							<div class="direct-chat-text">
								${laundryOrder.requestDetails}</div>
						</div>
					</c:if>
					<c:forEach items="${rvList }" var="list">
						<c:if test="${list.memberno != laundryOrder.memberNo }">
							<div class="direct-chat-msg">
								<div class="direct-chat-infos clearfix">
									<span class="direct-chat-name float-left">관리자</span> <span
										class="direct-chat-timestamp float-right"> <fmt:formatDate
											value="${list.registDate}" pattern="yy-MM-dd HH:mm" />
									</span>
								</div>
								<div class="direct-chat-text">${list.replyContent}</div>
							</div>
						</c:if>
						<c:if test="${list.memberno == laundryOrder.memberNo }">
							<div class="direct-chat-msg right">
								<div class="direct-chat-infos clearfix">
									<span class="direct-chat-timestamp float-left"> <fmt:formatDate
											value="${list.registDate}" pattern="yy-MM-dd HH:mm" />
									</span>
								</div>
								<div class="direct-chat-text">${list.replyContent}</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="card-footer">
				<form action="#" method="post">
					<div class="input-group">
						<input type="hidden" name="replyNo" id="replyNo"
							value="${laundryOrder.replyNo}"> <input type="text"
							name="reply" id="reply" placeholder="요청사항을 적어주세요"
							class="form-control"> <span class="input-group-append">
							<button onclick="insertReply();" class="btn btn-primary">전송</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 알림 sweetalert2 -->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>


<script>
async function getImg(){
	 for(var target of document.querySelectorAll('.orderPicture')){	
		 var atchFileNo = target.getAttribute('data-id');
		 var atchFileSeq = target.getAttribute('data-aa');
		 target.style.backgroundImage="url('<%=request.getContextPath()%>/mypage/getPicture?atchFileNo="+atchFileNo+"&atchFileSeq="+atchFileSeq+"')";
		 target.style.backgroundPosition="center";
		 target.style.backgroundRepeat="no-repeat";
		 target.style.backgroundSize="cover";
	}
}

getImg();

function insertReply(){
	
	event.preventDefault(); // 이벤트를 막아 페이지 리로드를 방지	
	
	 $.ajax({
         url : '<%=request.getContextPath()%>/mypage/reply',
         type : 'post',
         data : {
        	 'no' : $('#replyNo').val().toString(),
        	 'replyContent' : $('#reply').val()
         },
         success : function(ok){
            if(ok.toUpperCase() == "OK"){
            	Swal.fire({
					icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '전송 완료!',
				});
            	setTimeout("location.reload(true);",1000);
            } else {
            	Swal.fire({
					icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '전송 실패',
				});
            }
         },
         error : function() {
         	Swal.fire({
			icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title: '시스템 에러',
			});
         },
	});
}

</script>


