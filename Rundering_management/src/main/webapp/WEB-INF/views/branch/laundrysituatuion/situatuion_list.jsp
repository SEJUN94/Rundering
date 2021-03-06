<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryOrderList" value="${dataMap.laundryOrderList }" />
<c:set var="laundryCodeMap" value="${dataMap.laundryCodeMap }" />
<c:set var="orderCodeMap" value="${dataMap.orderCodeMap }" />
<c:set var="detailMap" value="${dataMap.detailMap }"/>
<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
										


<body>

<c:if test="${ from eq 'notEquals' } ">
	<script>
	Swal.fire({
		icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
		title : '해당하는 세탁주문이 없습니다'
	});
			window.close();
			window.opener.location.reload();
	</script>
</c:if>
	<div class="row ml-2 mr-2 " id="body">

		<div class="col-12">

			<div class="card card-primary card-outline">
				<form action="modify" method="post" id="form">
					<div class="card-header pb-2">
					<h3 class="card-title" style="font-size: 1.4rem; font-weight: 450;">세탁 현황</h3>
						<button type="button" class="btn btn-outline-primary btn-sm ml-3" onclick="handOverToDeliveryEmployee()">배송기사인계</button>
						&nbsp;&nbsp;&nbsp;
						<c:if test="${dataMap.lastDate ne '0'}">
							지난 배송  : ${dataMap.lastDate }개
						</c:if>
						<c:if test="${dataMap.lastDate eq '0'}">
							지난 배송  : 0개
						</c:if>
						/
						<c:if test="${dataMap.todayDate ne '0'}">
							당일 배송  : ${dataMap.todayDate }개
						</c:if>
						<c:if test="${dataMap.todayDate eq '0'}">
							당일 배송  : 0개
						</c:if>
						<div class="card-tools pt-1">

							<div class="input-group input-group-sm">
								<div class="input-group-sm textWidth">
									<input class="form-control " type="text" name="keyword" id="orderNumberInput"
										placeholder="주문 번호를 입력하세요" value="">
								</div>
								<span class="input-group-append">
									<button class="btn btn-primary" type="button" style="background-color: #59a5cb;border-color: #59a5cb;"
										onclick="orderDetail_go()" data-card-widget="search">상세보기</button>
								</span>
							
								
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="orderStatus" id="searchType">

										<c:forEach items="${laundryCodeMap }" var="laundryCode">
											<option value="${laundryCode.key }">${laundryCode.value }</option>
										</c:forEach>
									</select>
								</div>
								<span class="input-group-append ">

									<button class="btn btn-primary" type="button" style="background-color: #59a5cb;border-color: #59a5cb;"
										onclick="statusChange()">상태변경</button>
								</span>
							</div>
						</div>
					</div>


				<div class="card-body table-responsive p-0 mt-0" style="height: 305px;overflow: auto;">
                
               
					<table class="table table-hover text-nowrap" >

						<thead>
							<tr>
								<th class="width10" style="text-align: center;">주문번호</th>
								<th class="width50 " style="text-align: center;" >세탁 물품</th>
								<th class="width10" style="text-align: center;">
								<div class="input-group-sm " style="width: 100px">
									<select class="form-control" name="searchType" id="searchType"
										onchange="list_go('1')">
										<option value="">세탁 상태</option>
										<c:forEach items="${orderCodeMap }" var="orderCode">
											<option value="${orderCode.key }"
												${cri.searchType eq orderCode.key ? 'selected':'' }>${orderCode.value }</option>
										</c:forEach>
									</select>
								</div>
								</th>
								<th class="width10" style="text-align: center;">배송요청일</th>
								<th class="width5" style="text-align: center;"	onclick="selectAll()">전체선택</th>
							</tr>
						</thead>
						
						<tbody >
						<c:if test="${empty laundryOrderList }">
							<tr>
								<td colspan="5" style="text-align: center;"><strong>해당 내용이 없습니다.</strong></td>
							</tr>
						</c:if>
						
							<c:forEach items="${laundryOrderList }" var="laundryOrder">
								
								<tr class="mouseHover">
									<td class="orderno" style="text-align: center;"
										data-orderdate="<fmt:formatDate
											value="${laundryOrder.orderDate }"
											pattern="yyyy-MM-dd" />" data-atchNo="${laundryOrder.atchFileNo }" data-replyno="${laundryOrder.replyNo }" data-memberno="${laundryOrder.memberNo }">${laundryOrder.orderNo }</td>
									<td class="textCut textDetail textlength"
										data-text="${laundryOrder.requestDetails }">
										<c:forEach items="${detailMap[laundryOrder.orderNo] }" var="orderDetail">
											${orderDetail.itemsName } : ${orderDetail.quantity }개 	
										</c:forEach>
										</td>
									<td style="text-align: center;">
									<fmt:parseNumber value="${laundryOrder.deliveryRequestDate.time  / (1000*60*60*24)}" integerOnly="true" var="chgDttm" />
									<c:if test="${ laundryOrder.orderStatus ne 08 }">
										<c:if test="${today - chgDttm <= 0}">
											<span class="badge badge-success">${orderCodeMap[laundryOrder.orderStatus]}</span>
										</c:if>
										<c:if test="${today - chgDttm == 1}">
											<span class="badge badge-warning">${orderCodeMap[laundryOrder.orderStatus]}</span>
										</c:if>
										<c:if test="${today - chgDttm >= 2}">
											<span class="badge badge-danger">${orderCodeMap[laundryOrder.orderStatus]}</span>
										</c:if>
										
									</c:if>
									<c:if test="${ laundryOrder.orderStatus eq 08 }">
										<span class="badge badge-success">${orderCodeMap[laundryOrder.orderStatus]}</span>
									</c:if>
																			
									
									</td>
									<td style="text-align: center;"><fmt:formatDate
											value="${laundryOrder.deliveryRequestDate }"
											pattern="yyyy-MM-dd" /></td>
									<td style="text-align: center;"><c:forEach
											items="${laundryCodeMap }" var="laundryCode">
											<c:if test="${laundryOrder.orderStatus eq  laundryCode.key}">
												<input type="checkbox" name="" class="select">
												<input type="hidden" value="${laundryOrder.orderNo }"
													name="orderNo" class="inputHidden">
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					 </div>
				</form>
				<c:if test="${!empty laundryOrderList }">
					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
					</div>
				</c:if>
				<c:if test="${empty laundryOrderList }">
					<div class="card-footer" style="height: 62px;">
					</div>
				</c:if>
			</div>

			<div class="row">
				<div class="col-12 col-sm-5">
					<div class="card card-tabs" style="height: 350px">
						<div class="card-header p-0 border-bottom-0">
							<div class="float-left"
								style="margin-top: 10px; margin-left: 10px">이미지</div>
							<div class="float-right " id="imgtag"></div>
						</div>
						<div class="card-body imgsrc" style="padding: 0px" id="hrefimg">
							<img alt="" src="" id="imgsrc" class="col-12"
								style="height: 100%; display: none;">
						</div>
					</div>
				</div>

				<div class="col-12 col-sm-7 card" id="reply" style="height: 350px; overflow: auto; ">
					<section class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="timeline" style="margin:0px;height: 10px;margin-bottom: 30px; margin-top: 8px">
											<div style="margin-right:0px">
											
												<i class="fas fa-user bg-yellow " ></i>
												
												<div class="timeline-item" style="margin-right:0px;">
													<span class="time" style="padding:0px"><i class="fas fa-clock requestDisplay" style="visibility:hidden;"></i><span id="requestDate"></span>
														<button type="button" class="btn btn-sm btn-primary requestDisplay" data-toggle="modal" data-target="#modal-lg" style="visibility:hidden;">
													답변
													</button>
													</span>
													<p id="requestText">요청사항 </p>
													
												</div>
						  				 </div>
									</div>
							 </div>
		 				 </div>
						</div>
					</section>
					<div id="replyTag">
					</div> 
				</div>
			</div>
		</div>

		<div class="modal fade" id="modal-lg" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">작성</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="request" id="replyForm">
							<input type="text" class="form-control" name="replyContent"	id="replyContent" >
							</input> 
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="registBtn" data-replyno onclick="registReply()">작성</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="modal-modify" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">수정</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="request" id="replyForm">
							<input type="text" class="form-control" name="replyContent"	id="replyModifyContent" >
							</input> 
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="modifyBtn" data-replyno onclick="replyModify()">작성</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		</div>
		<c:if test="${empty laundryOrderList }">
			<form id="jobForm">	
				<input type='hidden' name="page" value="" />
				<input type='hidden' name="searchType" value="" />
				<input type='hidden' name="customerSort" value="" />
				<input type='hidden' name="keyword" value="" />
			</form>
		
	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>
		
		
					<script>
						function list_go(page,url){
							if(!url) url="list";
							
							var jobForm=$('#jobForm');
							
							jobForm.find("[name='page']").val(page);
							jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
							jobForm.find("[name='customerSort']").val($('select[name="customerSort"]').val());
							jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
						
							jobForm.attr({
								action:url,
								method:'get'
							}).submit();
						}
					</script>
			</c:if>
		
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
		<%@include file="./reply.jsp" %>
		
		<script type="text/x-handlebars-template" id="fileImage-template" >
		<ul class="nav nav-tabs" id="custom-tabs-four-tab">
			{{#count}}
			<li class="nav-item">
				<a class="nav-link" style="border: 1px solid #dee2e6;" href="#" onclick="changeSrc()">
					{{this}} 
				</a>
			</li>
			{{/count}}
		</ul>	
	</script>
	
<script>
	let imgList =null;
	function orderDetail_go(){
		 let orderNumber=document.querySelector("#orderNumberInput").value;
 	 	OpenWindow('<%=request.getContextPath()%>/branch/laundrysituatuion/orderdetail?orderNo='+orderNumber, '세탁주문상세', 600, 750) 
	}
	
	
	
	// 이미지 src 속성변경하여 이미지 바꾸깅~~
	function changeSrc(){
		let targetText=event.target.innerText-1;
		document.querySelector("#imgsrc").src="data:image/jpg;base64,"+imgList[targetText];
	}
	
	// 이미지 불러오기 
	function getImages(atchFileNo){ 
		    $.ajax({
		        url:"<%=request.getContextPath()%>/branch/laundrysituatuion/getimgs",
		        type:"post",
		        data: {
		        	atchFileNo:atchFileNo
		        },
		        dataType:"json",
		        success:function(data){
 		        	let source = $("#fileImage-template").html(); 
		        	let template = Handlebars.compile(source);
					imgList= new Array();
					let count = 0;
					let countArray = new Array();
					for(let i of data){
						imgList.push(i);
						count +=1;
						countArray.push(count);
					}
					let handleData= {
							count:countArray
					};
		        	let html = template(handleData);
		        	if($('#custom-tabs-four-tab')!=null){
		        		$('#custom-tabs-four-tab').remove();
		        	}
		        	
		        	$('#imgtag').append(html);
		        	document.querySelector("#imgsrc").src="data:image/jpg;base64,"+imgList[0];
		        	document.querySelector("#imgsrc").style.display="flex";
		        },
		        error:function(error){
				//alert('댓글이 등록을 실패했습니다.');
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		    })
	}
	</script>


	<script>
function text(){
	
	let texts =document.querySelectorAll(".textlength");
	for(let i of texts){
		let text =i.innerText
		let text1=text.substr(text.indexOf('개')+1)
			if(text1.indexOf('개')>-1){
				let text2 =text1.substr(text1.indexOf('개')+1)
				if(text2.indexOf('개')>-1){
					let text3 =text2.substr(text2.indexOf('개')+1)
					if(text3.indexOf('개')>-1){
						i.innerText=text.substr(0,text.indexOf('개')+text1.indexOf('개')+text2.indexOf('개')+3)+"...외";
					}
					
				}
			}
		
		}
	}
	

	
	
 window.onload=function(){ 
	 text()
	 
    let texts= document.querySelectorAll(".textCut");
    
    let textContent = document.querySelector("#requestText");
    //console.log(textContent)
    for (let i of texts){
        if(i.dataset.text.length>20){
            i.innerHTML=i.innerText.substring(0,20)+"..."
        }else{
            i.innerHTML=i.innerText;
        } 
    }
    let mouseHover = document.querySelectorAll(".mouseHover");
    for(let i of mouseHover){
        i.addEventListener("click",function(){
            let textDetail =event.target.parentElement.querySelectorAll(".textDetail")[0].dataset.text;
            let see= document.querySelectorAll(".requestDisplay");
            for(let i of see){
            	i.style.visibility="visible";
            	//console.log(i)
            }
            if(textDetail==null||textDetail.trim()==""){
            	document.querySelector("#requestText").innerText="요청사항이없습니다";
            }else{
            	textContent.innerText=textDetail;
            }
            
            let orderno=event.target.parentElement.querySelectorAll(".orderno")[0].innerText;
            let orderDate=event.target.parentElement.querySelectorAll(".orderno")[0].dataset.orderdate;
            let atchFileNo=event.target.parentElement.querySelectorAll(".orderno")[0].dataset.atchno
            let replyNo=event.target.parentElement.querySelectorAll(".orderno")[0].dataset.replyno
            let memberNo=event.target.parentElement.querySelectorAll(".orderno")[0].dataset.memberno
          
            getImages(atchFileNo);
            document.querySelector("#requestDate").innerText=orderDate;
           	document.querySelector("#registBtn").dataset.replyno=replyNo
           	document.querySelector("#registBtn").dataset.memberno=memberNo
           	replyList(replyNo,memberNo)
        	//replyno= document.querySelector("#replyno")
        	//replyno.setAttribute("value",orderno);
        })
    }
    let inputHiddens=document.querySelectorAll(".inputHidden")
    for(let i of inputHiddens){
    	i.setAttribute("disabled",true) 
    }
   
 }
</script>

<script>
	function statusChange(){
		let form=document.querySelector("#form");
		let selects =document.querySelectorAll(".select");
		let flag =false;
    	for(i of selects){
    		if(i.checked==true){
    			for(k of i.parentNode.parentNode.querySelectorAll(".inputHidden")){
    				k.removeAttribute("disabled") 
    				flag=true;
    			}
    		}
    	}
    	if(flag==false){
    		Swal.fire({
				icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '선택한 주문이 없습니다.'
			});
    		return;
    	}
    	
		form.submit();
	
	}
	function selectAll() {
		let selects =document.querySelectorAll(".select");
    	for(i of selects){
    		i.checked=true
    	}
	}
</script>

<script>
	// 지점할당 스케줄링 메소드 연결
		function handOverToDeliveryEmployee(){
			Swal.fire({
	            title: '현재까지 세탁완료된 주문건을 배송기사에게 인계하시겠습니까?',
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
			 			url: "<%=request.getContextPath()%>/admin/laundryorder/handOverToDeliveryEmployee",
			 			type:'POST',
			 			success:function(data){
			 				if(data.assignedOrderCnt == 0){
			 					Swal.fire({
									icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
									title : '현재 배송기사 미배정된 세탁완료 주문건이 없습니다.'
								});
			 				}else if(data.numberOfDeliveryEmployees == 0){
			 					Swal.fire({
									icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
									title : '현재 세탁주문 배송기사 인계가 불가합니다.',
									text : '관리자에게 연락바랍니다.'
								});
			 				}else{
			 					Swal.fire({
									icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
									text : data.numberOfDeliveryEmployees+'명의 배송기사에게 총'+data.assignedOrderCnt+'개의 주문이 분배되었습니다.'
								});
				 				window.location.reload();
			 				}
			 			},
			 			error:function(error){
			 				Swal.fire({
								icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
								title: '현재 세탁주문 배송기사 인계가 불가합니다.',
								text: '관리자에게 연락바랍니다.' 
							});
			 			}
			 		});
		        } else {
			    	return;
		        }
	          })
		}
		dataMap.put("assignedOrderCnt",assignedOrderCnt);
		dataMap.put("remainAllAreaOrder",remainAllAreaOrder);
	</script>

</body>
