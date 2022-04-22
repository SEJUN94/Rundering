<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>
	 <div style="width: 60%; margin-left: 20%;">
        <section class="content-header" style="border-bottom: 1px solid rgba(0,0,0,.125);">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>주문완료</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item active">주문완료</li>
                            <li class="breadcrumb-item"><a href="#">세탁주문</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>


        <div class="card-body mt-5 pt-5">
            <div class="row">
                <div class="col-4" style="text-align: end;">
                    <i class="far fa-check-circle pr-3 pt-3" style="font-size: 5rem;"></i>
                </div>
                <div class="col-8">
                    <h1 class="h4"><b>고객님의 주문이 완료되었습니다.</b></h1>
                    <h2 class="lead">주문정보는 주문내역을 통하여 확인 가능합니다.</h2>
                    <p class="text-muted mt-2"><b>주문번호 : </b> ${registeredLaundryOrder.orderNo} </p>
                    <p class="text-muted"><b>주문일시 : </b> <fmt:formatDate value="${registeredLaundryOrder.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    <p class="text-muted"><b>결제금액 : </b> <fmt:formatNumber type="number" maxFractionDigits="3" value="${registeredLaundryOrder.totalPrice}" />원</p>
                </div>

            </div>
	        <div class="mt-4" style="text-align: center;">
	            <div class="btn btn-outline-primary btn-lg btn-flat mr-2">
	                주문내역
	            </div>
	            <div class="btn btn-outline-secondary btn-lg btn-flat" onclick="location.href = '<%=request.getContextPath()%>/customercenter/faq';">
	                자주묻는질문
	            </div>
	        </div>
        </div>


    </div>
</body>