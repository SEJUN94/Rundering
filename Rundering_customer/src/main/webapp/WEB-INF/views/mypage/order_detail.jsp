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
			<span style="font-size: 1.5em;">????????????</span><span
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
								<span style="font-size: 1.5em; font-weight: 500;">????????????</span>
							</div>
						</c:if>
						<c:if test="${laundryOrder.orderStatus ne '01'}">
							<div class="step-name">????????????</div>
						</c:if>
					</div>
					<c:if test="${laundryOrder.orderStatus == '02'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '02'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '02' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">?????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '03'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '03'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '03' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">????????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '04'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '04'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '04' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">????????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '05'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '05'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '05' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">?????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '06'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '06'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">????????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '06' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">????????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus == '07'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus > '07'}">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name">?????????</div>
							</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '07' }">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">?????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus < '08'}">
						<div id="" class="stepper-item fourth">
							<div class="step-counter">
								<i class="fa-solid fa-2"></i>
							</div>
							<div class="step-name">????????????</div>
						</div>
					</c:if>
					<c:if test="${laundryOrder.orderStatus >= '08' }">
						<div class="stepper-item completed">
							<div id="" class="stepper-item fourth">
								<div class="step-counter">
									<i class="fa-solid fa-2"></i>
								</div>
								<div class="step-name"
									style="font-size: 1.5em; font-weight: 500;">????????????</div>
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
					<span class="info-box-text" style="font-size: 1.5em;">?????? ??????
						??????</span>
				</div>
			</div>

			<div class="card-body p-0">
				<ul class="products-list product-list-in-card pl-2 pr-2"
					style="height: 238px;">
					<c:forEach items="${detailList }" var="list">
						<li class="item">
							<div class="product-info">
								<span style="font-weight: 400; font-size: 1.2em;">${list.itemsName }</span>
								<span class="product-description float-right pt-1">${list.quantity } ???</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<div class="card-footer clearfix" align="right">
				??? ?????? :
				<fmt:formatNumber value="${laundryOrder.totalPrice}" pattern="#,###" />
				???
			</div>

		</div>
		<div class="col-md-12 p-0" style="box-sizing: border-box;">

			<div class="card">
				<div class="card-header">
					<h3 class="card-title">????????????</h3>
					<c:if test="${empty laundryOrder.branchCode }">
					</c:if>
					<c:if test="${!empty laundryOrder.branchCode}">
						<p class="float-right pt-1">${laundryOrder.branchCode }</p>
					</c:if>
				</div>

				<div class="card-body p-0" style="height: 150px;">
					<div style="margin: 30px;">
						<c:if test="${pickUpNum != null}">
							<span style="font-size: 1.2em;"><i class="fas fa-mobile-alt mr-1"></i>???????????? ????????? : ${pickUpNum }</span>
						</c:if>
						<c:if test="${pickUpNum == null}">
							<span style="font-size: 1.2em;"><i class="fas fa-mobile-alt mr-1"></i>???????????? ??????</span>
						</c:if>
					</div>
					<div style="margin: 30px;">
						<c:if test="${deliveryNum != null}">
						
							<span style="font-size: 1.2em;"><i class="fas fa-mobile-alt mr-1"></i>???????????? ????????? : ${deliveryNum }</span>
						</c:if>
						<c:if test="${deliveryNum == null }">
							<span style="font-size: 1.2em;"><i class="fas fa-mobile-alt mr-1"></i>???????????? ??????</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6 pr-0" style="min-height: 450px; max-height: 450px; flex: 1; width: 50%; box-sizing: border-box;">

		<div class="col-md-12 p-0" style="box-sizing: border-box;">

			<div class="card">
				<div class="card-header">
					<h3 class="card-title">??????</h3>
				</div>

				<div class="card-body p-0" style="height: 150px; overflow: auto; overflow-x: hidden;">
					<c:if test="${not empty av.bizType eq '????????????' }">
						<div class="mt-2 mb-2 ml-3">????????????</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '????????????' }">
									<div class="orderPicture ml-2" id="pictureView"
										data-id="${av.atchFileNo }" data-aa="${av.atchFileSeq }"
										style="height: 100px; width: 100px;"></div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty av.bizType eq '??????????????????' }">
						<div class="mt-2 mb-2 ml-3">????????????</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '??????????????????' }">
									<div class="orderPicture ml-2" id="pictureView"
										data-id="${av.atchFileNo }" data-aa="${av.atchFileSeq }"
										style="height: 100px; width: 100px;"></div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty av.bizType eq '??????????????????' }">
						<div class="mt-2 mb-2 ml-3">??????????????????</div>
						<div class="row pl-3">
							<c:forEach items="${avList }" var="av">
								<c:if test="${av.bizType eq '??????????????????' }">
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

		<div class="card card-primary card-outline direct-chat direct-chat-primary col-12 p-0"
			style="box-sizing: border-box;">
			<div class="card-header">
				<h3 class="card-title">????????????</h3>
			</div>

			<div class="card-body">
				<div class="direct-chat-messages" style="overflow: auto;">
					<c:if test="${not empty laundryOrder.requestDetails}">
						<div class="direct-chat-msg right">
							<div class="direct-chat-infos clearfix">
								<span class="direct-chat-timestamp float-left"> <fmt:formatDate
										value="${laundryOrder.orderDate}" pattern="yy-MM-dd HH:mm" />
								</span>
								<button type="button" id="modifyBtn" class="btn btn-sm btn-warning ml-1"
												style="padding: 2px; font-size: .8rem; line-height: 1.5;"
												data-toggle="modal" data-target="#reqmodify" onclick="reqModify('${laundryOrder.requestDetails}')">??????</button>
								<button type="button" id="modifyBtn" class="btn btn-sm btn-danger ml-1"
												style="padding: 2px; font-size: .8rem; line-height: 1.5;"
												onclick="reqRemove('${laundryOrder.orderNo}')">??????</button>
							</div>
							<div class="direct-chat-text">
								${laundryOrder.requestDetails}</div>
						</div>
					</c:if>
					<c:forEach items="${rvList }" var="list">
						<c:if test="${list.memberno != laundryOrder.memberNo }">
							<div class="direct-chat-msg">
								<div class="direct-chat-infos clearfix">
									<span class="direct-chat-name float-left">?????????</span> <span
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
									<button type="button" id="modifyBtn" class="btn btn-sm btn-warning ml-1"
												style="padding: 2px; font-size: .8rem; line-height: 1.5;"
												data-toggle="modal" data-target="#modify"
												onclick="replyModify('${list.replyno}','${list.replynoSeq }','${list.replyContent}')" >??????</button>
								<button type="button" id="modifyBtn" class="btn btn-sm btn-danger ml-1"
												style="padding: 2px; font-size: .8rem; line-height: 1.5;"
												onclick="replyRemove('${list.replyno}','${list.replynoSeq }')">??????</button>
								</div>
								<div class="direct-chat-text" id="content">${list.replyContent}</div>
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
							name="reply" id="reply" placeholder="??????????????? ???????????????"
							class="form-control"> <span class="input-group-append">
							<button onclick="insertReply();" class="btn btn-primary">??????</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modify" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">?????? ?????? ?????? ??????</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">??</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<label for="moq" style="margin:10px;">???????????? ??????</label> <input type="text" id="getContent" name='getContent' class="form-control" value="">
						</div>
					</div>
					<input type="hidden" id="replyno" value="">
					<input type="hidden" id="replyseq" value="">
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-replyno  onclick="modify_go()" id="insertBtn">??????</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
					</div>
				</div>
			</div>
		</div>
	<div class="modal fade" id="reqmodify" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">?????? ?????? ?????? ??????</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">??</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<label for="moq" style="margin:10px;">???????????? ??????</label> <input type="text" id="requestDetails" name='requestDetails' class="form-control" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-replyno  onclick="reqmodify_go('${laundryOrder.orderNo}')" id="insertBtn">??????</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- ?????? sweetalert2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>


<script>

var con = document.querySelector('#getContent');
var replyno = document.querySelector('#replyno');
var replyseq = document.querySelector('#replyseq');
var req =  document.querySelector('#requestDetails');

function replyModify(replyno,replynoSeq,content){
 	console.log(replyno)
// 	console.log(replynoSeq)
// 	console.log(content)
	
	replyno.value = replyno;
	replyseq.value = replynoSeq;
	con.value = content;
}


function reqModify(content){
 	console.log(content)

	req.value = content;
}

function reqmodify_go(orderNo){
	console.log($('#requestDetails').val())
	$.ajax({
        url : '<%=request.getContextPath()%>/mypage/modifyReq',
        type : 'post',
        data : {
         'orderNo' : orderNo,
       	 'requestDetails' : $('#requestDetails').val()
        },
        success : function(ok){
           	if(ok.toUpperCase() == "OK"){
           		Swal.fire({
					icon: 'success', // ???????????? ????????? ????????? ?????? ?????????.
					title: '???????????? ?????? ??????!',
				});
           	setTimeout("location.reload(true);",1000);
           } else {
           	Swal.fire({
					icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????!',
				});
           }
        },
        error : function() {
        	Swal.fire({
			icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
			title: '????????? ??????',
			});
        },
	});
}


function modify_go(){
	console.log($('#replyNo').val())
	console.log(replyseq.value)
	console.log(con.value)
	
	$.ajax({
        url : '<%=request.getContextPath()%>/mypage/modifyReply',
        type : 'post',
        data : {
       	 'replyno' : $('#replyNo').val(),
       	 'replynoSeq' : replyseq.value,
       	 'replyContent' : con.value
        },
        success : function(ok){
           	if(ok.toUpperCase() == "OK"){
           		Swal.fire({
					icon: 'success', // ???????????? ????????? ????????? ?????? ?????????.
					title: '???????????? ?????? ??????!',
				});
           	setTimeout("location.reload(true);",1000);
           } else {
           	Swal.fire({
					icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????!',
				});
           }
        },
        error : function() {
        	Swal.fire({
			icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
			title: '????????? ??????',
			});
        },
	});
}

function reqRemove(orderNo){
	 $.ajax({
         url : '<%=request.getContextPath()%>/mypage/reqRemove',
         type : 'post',
         data : {
        	 'orderNo' : orderNo
         },
         success : function(ok){
            if(ok.toUpperCase() == "OK"){
            	Swal.fire({
					icon: 'success', // ???????????? ????????? ????????? ?????? ?????????.
					title: '???????????? ?????? ??????!',
				});
            	setTimeout("location.reload(true);",1000);
            } else {
            	Swal.fire({
					icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????',
				});
            }
         },
         error : function() {
         	Swal.fire({
			icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
			title: '????????? ??????',
			});
         },
	});
}

function replyRemove(replyno,replynoSeq){
	
	 $.ajax({
         url : '<%=request.getContextPath()%>/mypage/removeReply',
         type : 'post',
         data : {
        	 replyno : replyno,
        	 replynoSeq : replynoSeq
         },
         success : function(ok){
            if(ok.toUpperCase() == "OK"){
            	Swal.fire({
					icon: 'success', // ???????????? ????????? ????????? ?????? ?????????.
					title: '???????????? ?????? ??????!',
				});
            	setTimeout("location.reload(true);",1000);
            } else {
            	Swal.fire({
					icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????',
				});
            }
         },
         error : function() {
         	Swal.fire({
			icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
			title: '????????? ??????',
			});
         },
	});
}



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
	
	event.preventDefault(); // ???????????? ?????? ????????? ???????????? ??????	
	
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
					icon: 'success', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????!',
				});
            	setTimeout("location.reload(true);",1000);
            } else {
            	Swal.fire({
					icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
					title: '?????? ??????',
				});
            }
         },
         error : function() {
         	Swal.fire({
			icon: 'error', // ???????????? ????????? ????????? ?????? ?????????.
			title: '????????? ??????',
			});
         },
	});
}

</script>


