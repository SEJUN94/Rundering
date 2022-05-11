<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="laundryOrder" value="${dataMap.laundryOrder }" />
<c:set var="detailList" value="${dataMap.detailList }" />
<c:set var="loginUser" value="${loginUser }" />
  
<style>
    .circle {
        width: 75px;
        height: 75px;
        border: 15px solid #82BBD8;
        border-radius: 50%;
        margin-right:200px;
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
   
     @media (max-width: 768px) {
       font-size: 12px;
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
     color : white;
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

   	<div class="col-12" style="padding-top:30px;">
   		<div class="card">
   			<div class="card-body mt-3 ml-3 p-0" style="font-size:1.5em;">배송조회</div>
   			<hr>
			<div class="row">
				<div class="col-sm-12" style="padding-top: 10px;">
				      <div class="stepper-wrapper">
				        <div class="stepper-item completed">
				          <div class="step-counter">
				             <i class="fa-solid fa-1"></i>
				          </div>
				          <c:if test="${laundryOrder.orderStatus eq '01'}" >
				          <div class="step-name"><span style="font-size:1.5em;font-weight: 500;">수거대기</span></div>
				          </c:if>
				           <c:if test="${laundryOrder.orderStatus ne '01'}" >
				          <div class="step-name">수거대기</div>
				          </c:if>
				        </div>
				        <c:if test="${laundryOrder.orderStatus eq '02'}" >
				        <div class="stepper-item completed">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name"><span style="font-size:1.5em;font-weight: 500;">수거중</span></div>
				        </div>
				         </c:if>
				        <c:if test="${laundryOrder.orderStatus ne '02'}" >
				        <c:if test="${laundryOrder.orderStatus eq '01'}" >
				        <div id="" class="stepper-item second">
				        </c:if>
				        <c:if test="${laundryOrder.orderStatus ne '01'}" >
				        <div class="stepper-item completed">
				        </c:if>
						</c:if>
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">수거중</div>
				        </div>
				        <c:if test="${laundryOrder.orderStatus ne '01' }" >
				        <c:if test="${laundryOrder.orderStatus ne '02' }" >
				        <div class="stepper-item completed">
				        </c:if>
				        </c:if>
				        <c:if test="${laundryOrder.orderStatus eq '01' || laundryOrder.orderStatus eq '02' }" >
				        <div id="" class="stepper-item third">
				        </c:if>
				          <div class="step-counter">
				             <i class="fa-solid fa-3"></i>
				          </div>
				          <div class="step-name">수거완료</div>
				        </div>
				        <div id="" class="stepper-item fourth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁대기</div>
				        </div>
				        <div id="" class="stepper-item fifth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁중</div>
				        </div>
				        <div id="" class="stepper-item sixth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁완료</div>
				        </div>
				        <div id="" class="stepper-item seventh">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">배송중</div>
				        </div>
				        <div id="" class="stepper-item eighth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">배송완료</div>
				        </div>
				      </div>
				  </div>
			</div>
   		</div>
   	</div>
    <div class="col-12" style=" width: 100%;min-height:500px;max-height:500px; margin: 10px auto; display: flex;">

        <div class="card-body col-6 ml-1" style="min-height:600px;max-height:600px; flex:1;width:50%;box-sizing: border-box; padding-top:1px;">
            <div class="card">
                <div class="card-header info-box m-0">
                    
                        <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">주문 상세 내역</span>
                </div>
                </div>

                <div class="card-body p-0">
                    <ul class="products-list product-list-in-card pl-2 pr-2" style="height:455px;">
                      <c:forEach items="${detailList }" var="list">
                        <li class="item">
                            <div class="product-info">
                                <span style="font-weight:bold;">${list.itemsName }</strong>
                                <span class="product-description float-right">${list.quantity } 개</span>
                            </div>
                        </li>
				      </c:forEach>
                    </ul>
                </div>

                <div class="card-footer clearfix">
                	총 가격 :  <fmt:formatNumber value="${laundryOrder.totalPrice}" pattern="#,###"/> 원 
                </div>

            </div>
        </div>
        <div class="col-6" style="min-height: 450px; max-height:450px; flex:1;width:50%;box-sizing: border-box;">
            <div class="card card-primary card-outline direct-chat direct-chat-primary col-12 p-0"
                style="box-sizing: border-box;">
                <div class="card-header">
                    <h3 class="card-title">요청사항</h3>
                </div>

                <div class="card-body">

                    <div class="direct-chat-messages">
						<c:if test="${not empty laundryOrder.requestDetails}">
                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left">${loginUser.name }</span>
                                <span class="direct-chat-timestamp float-right"><fmt:formatDate value="${laundryOrder.orderDate}" pattern="yy-MM-dd HH:mm" /> </span>
                            </div>
                            <div class="direct-chat-text">
                                ${laundryOrder.requestDetails}
                            </div>

                        </div>
                        </c:if>


                        <div class="direct-chat-msg right">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-right">Rundering</span>
                                <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                            </div>

                            <div class="direct-chat-text">
                                신속 깨끗하게 처리해서 집 앞까지 확실히 가져다 드리겠습니다!
                            </div>

                        </div>

                    </div>
                    <div class="direct-chat-contacts">
                        <ul class="contacts-list">
                            <li>
                                <a href="#">
                                    <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg"
                                        alt="User Avatar">
                                    <div class="contacts-list-info">
                                        <span class="contacts-list-name">
                                            Count Dracula
                                            <small class="contacts-list-date float-right">2/28/2015</small>
                                        </span>
                                        <span class="contacts-list-msg">How have you been? I was...</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="card-footer">
                    <form action="#" method="post">
                        <div class="input-group">
                            <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                            <span class="input-group-append">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-12 p-0" style="box-sizing: border-box;">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">사진</h3>
                    </div>

                    <div class="card-body p-0">
                        <ul class="users-list clearfix" style="height:150px;">
                            <li>
                                <img src="dist/img/user1-128x128.jpg" alt="사진넣을곳">
                                <a class="users-list-name" href="#">사진</a>
                                <span class="users-list-date">Today</span>
                            </li>
                           
                        </ul>

                    </div>
                </div>

            </div>
        </div>
    </div>
    
