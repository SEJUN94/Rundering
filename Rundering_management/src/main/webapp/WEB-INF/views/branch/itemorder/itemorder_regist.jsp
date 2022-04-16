<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="laundryArticlesList" value="${dataMap.laundryArticlesList }" /> 
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
							<c:if test="${!empty laundryArticlesList }">
									<c:forEach items="${laundryArticlesList }" var="laundryArticles">
										<tr>
											<td style="text-align: left;" data-code="${ laundryArticles.articlesCode}" >${laundryArticles.articlesName }</td>
											<td style="text-align: center;">사진</td>
											<td style="text-align: center;">${laundryArticles.price }</td>
											<td style="text-align: center; padding-top: 8px"><button type="button"
											class="btn btn-primary btn-sm" onclick="getOrder()" >담기</button></td>
										</tr>
										
									
									
									</c:forEach>
								</c:if>
							</tbody>
							
						</table>
						
					</div>
					<div class="card-footer" >
						<%@ include file="/WEB-INF/views/branch/itemorder/pagination.jsp"%>
					</div>
	
				</div>
	
			</div>
	<table></table>
			<div class="col-6">
				<div class="card card-primary card-outline col-12" style="height: 670px;display: block;overflow: auto;">
					<div class="card-header">
						<h3 class="card-title">발주신청</h3>
	
					</div>
					<div class="card-body p-0" >
						<table class="table table-hover text-nowrap" >
							 <tbody id="tbody">
								<tr style="text-align: center;">
									<th class="width20">물품명</th>
	
									<th class="width15">수량</th>
	
									<th class="width15">총금액</th>
									<th class="width10" >취소</th>
								</tr>
						
								
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
<script type="text/x-handlebars-template" id="getOrder-tempalet" >
<tr>
	<input type="hidden" name="code" value="{{code}}">
	<input type="hidden" name="price" class="price" value="{{price}}">
	<td  >세제</td>
	<td  style="text-align:center;"> 
		<input type="text" name="quantity" class="form-control" style="width: 80px; height: 30px; text-align:center; ">
	</td>
	<td  style="text-align:right">30000</td>
	<td  style="text-align:center;">
		<button type="button" style="color: black" class="btn btn-tool itemRemove" style="color: black">
			<i class="fas fa-times"></i>
		</button>
	</td>
</tr>
</script>

<script>
function getOrder(){
	let dataCode =event.target.parentNode.parentNode.children[0].dataset.code;
	let price = event.target.parentNode.parentNode.children[2].innerText
	
	let source = $("#getOrder-tempalet").html();
	let template = Handlebars.compile(source); 

	//핸들바 템플릿에 바인딩할 데이터
	let data = {
	    	code:dataCode,
	    	price:price
	}; 
	let html = template(data);
	$('#tbody').append(html);

}


</script>

	
	
	
	
</body>