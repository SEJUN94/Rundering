<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryOrderList" value="${dataMap.laundryOrderList }" />
<c:set var="laundryCodeMap" value="${dataMap.laundryCodeMap }" />
<c:set var="orderCodeMap" value="${dataMap.orderCodeMap }" />
<body>
		<div class="row ml-2 mr-2">
			
			<div class="col-12">
			<div class="card-header" style="padding :10px;">
				<div class=" float-right">
							<div class="input-group input-group-sm float-right ">
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="searchType" id="searchType" onchange="list_go('1')">
										<c:forEach items="${orderCodeMap }" var="orderCode"  >
											<option  value="${orderCode.key }" ${cri.searchType eq orderCode.key ? 'selected':'' } >${orderCode.value }</option>
										</c:forEach>
									</select>
								</div>
								<div class="input-group-sm textWidth">
									<input class="form-control " type="text" name="keyword"
										placeholder="주문 번호를 입력하세요" value="">
								</div>
								<span class="input-group-append">

									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										상세보기 
									</button>
								</span>
						</div>
					</div>
					</div>
					
				<div class="card card-primary card-outline">
				<form action="modify" method="post" id="form">
					<div class="card-header">
						<h3 class="card-title">세탁 현황 관리</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="orderStatus" id="searchType">
								
											<c:forEach items="${laundryCodeMap }" var="laundryCode" >
											<option  value="${laundryCode.key }">${laundryCode.value }</option>
										</c:forEach>
									</select>
								</div>
								<span class="input-group-append ">

									<button class="btn btn-primary" type="button" onclick="statusChange()">
										상태변경
									</button>
								</span>
							</div>
						</div>
					</div>

				
				
				<table class="table table-hover text-nowrap">
				
					<thead>
						<tr>
							<th class="width10" style="text-align: center;" >주문번호</th>
							<th class="width10" style="text-align: center;">지역</th>
							<th class="width40" style="text-align: center;">요청사항</th>
							<th class="width10" style="text-align: center;">세탁물 상태</th>
							<th class="width10" style="text-align: center;">배송요청일</th>
							<th class="width5" style="text-align: center;" onclick="selectAll()" >전체선택</th>

						</tr>
					</thead>
			
					<tbody>
					<c:forEach items="${laundryOrderList }" var="laundryOrder">
		
						<tr class="mouseHover">
							<td class="orderno" style="text-align: center;">${laundryOrder.orderNo }</td>
							<td style="text-align: center;">${laundryOrder.area }</td>
							<td class="textCut textDetail" 
								data-text="${laundryOrder.requestDetails }">
								</td>
							<td style="text-align: center;">${orderCodeMap[laundryOrder.orderStatus] }</td>
							<td style="text-align: center;"><fmt:formatDate value="${laundryOrder.deliveryRequestDate }" pattern="yyyy-MM-dd"/></td>
							<td style="text-align: center;">
								<c:forEach items="${laundryCodeMap }" var="laundryCode">
									<c:if test="${laundryOrder.orderStatus eq  laundryCode.key}"> 
										<input type="checkbox" name="" class="select">
										<input type="hidden" value="${laundryOrder.orderNo }" name ="orderNo" class="inputHidden" >
									</c:if>
								</c:forEach>
							</td>
						
						</tr>
						
					</c:forEach>
					</tbody>
				</table>
				</form>

				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card ">
						<div class="card-header">
							<h3 class="card-title">요청사항</h3>
							<div class="float-right">
									<button type="button" class="btn btn-sm btn-primary"
										data-toggle="modal" data-target="#modal-lg" style ="width:  50px">답변</button>
								</div>
						</div>
						<div class="ml-2 mr-2">
							<div class="col-12 float-left">
								<div class="form-group">
									<label for="exampleInputBorder ml-2" id="requestText"
										class="mt-3"></label>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modal-lg" style="display: none;"
							aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">답변</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="request" id="replyForm">
					<textarea rows="5" class="form-control" name="replyContent" id="replyContent">
					
					</textarea>
						 
					</form>
					
					
				</div>
				<div class="modal-footer">
				
					<button type="button" class="btn btn-primary" onclick="fistRegistReply()">작성</button>
					<button type="button" class="btn btn-danger"data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
 window.onload=function(){ 
    let texts= document.querySelectorAll(".textCut");
    
    let textContent = document.querySelector("#requestText");
    for (let i of texts){
        if(i.dataset.text.length>20){
            i.innerHTML=i.dataset.text.substring(0,20)+"..."
        }else{
            i.innerHTML=i.dataset.text
        } 
    }
    let mouseHover = document.querySelectorAll(".mouseHover");
    for(let i of mouseHover){
        i.addEventListener("click",function(){
            textContent.innerHTML=event.target.parentElement.querySelectorAll(".textDetail")[0].dataset.text
            orderno=event.target.parentElement.querySelectorAll(".orderno")[0].innerText;
        	replyno= document.querySelector("#replyno")
        	replyno.setAttribute("value",orderno);
        	console.log(replyno)
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
    		alert("선택한 주문이 없습니다")
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
function firstRegistReply(){
    replyContent= document.querySelector("#replyContent");
    if(replyContent.value==null || replyContent.value.trim==null){
        return
    }
  
    
    $.ajax({
        url:"url:"<%=request.getContextPath()%>/branch/reply"",
        type:"post",
        data:,
        success:function(data){
            alert("댓글이 등록. \n 마지막 페이지로 이동합니다.");
            replyPage=data;
            getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+data);
            $('#newReplyText').val("");	
        }error:function(error){
		//alert('댓글이 등록을 실패했습니다.');
		AjaxErrorSecurityRedirectHandler(error.status);
	}
    })
}

</script>


</body>
