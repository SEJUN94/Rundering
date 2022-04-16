<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="orderGoodsList" value="${dataMap.orderGoodsList }" /> 
<body>
	<div >
		<div class="row ml-2 mr-2">
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 765px;">
					<div class="card-header">
						<h3 class="card-title">물품리스트</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover ">
							<thead>
								<tr>
									<th class="width20" style="text-align: center">물품명</th>
									<th class="width15" style="text-align: center">사진</th>
									<th class="width15" style="text-align: center">금액</th>
									<th class="width10" style="text-align: center;">담기</th>
								</tr>
							</thead>
	
							<tbody>
							<c:if test="${!empty orderGoodsList }">
									<c:forEach items="${orderGoodsList }" var="orderGoods">
										<tr>
											<td style="text-align: left;" data-code="orderGoods" >${orderGoods.articlesName }</td>
											<td style="text-align: center;">사진</td>
											<td style="text-align: center;">${orderGoods.price }</td>
											<td style="text-align: center; padding-top: 8px"><button type="button"
											class="btn btn-primary btn-sm getButton" >담기</button></td>
										</tr>
									</c:forEach>
								</c:if>
								<tr>
									
									
	
								</tr>
								
							</tbody>
							
						</table>
						
					</div>
					<div class="card-footer" >
						<%@ include file="/WEB-INF/views/branch/itemorder/pagination.jsp"%>
					</div>
	
				</div>
	
			</div>
	
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 670px;">
					<div class="card-header">
						<h3 class="card-title">발주신청</h3>
	
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="width20">물품명</th>
	
									<th class="width15">수량</th>
	
									<th class="width15">총금액</th>
									<th class="width10" style="text-align: center;">취소</th>
								</tr>
							</thead> 
							
							<tbody>
								<form action="">
									<tr>
										<td>세제</td>
										<td>
											<input type="text" name="content" class="form-control" style="width: 50px; height: 30px;">
										</td>
										<td>30000</td>
										<td style="text-align: center;">
											<button type="button" class="btn btn-tool itemRemove" style="color: black"><i class="fas fa-times"></i>
											</button>
										</td>
									</tr>
								</form>
							</tbody>
							
						</table>
					</div>
					
				</div>
				<div class="card">
	
					<div class="card-body">
						<strong>선택 합계금액</strong> <input 원="" style="width: 100px"
							class="form-control float-right" name="content" type="text">
					</div>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-primary">발주</button>
	
					<button type="button" class="btn btn-primary">리셋</button>
				</div>
	
			</div>
		</div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="reply-list-template" >
<tr>
	<input type="hidden" name="price" value="{{}}">
	<td>세제</td>
	<td>
		<input type="text" name="quantity" class="form-control" style="width: 50px; height: 30px; ">
	</td>
	<td>30000</td>
	<td style="text-align: center;">
	<button type="button" class="btn btn-tool itemRemove" style="color: black">
		<i class="fas fa-times"></i>
	</button>
	</td>
</tr>
</script>

	
	
	
	
</body>