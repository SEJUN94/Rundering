<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style>

.laundryItemsListScroll thead, .laundryItemsListScroll tbody {
	display: block;
}
.laundryItemsListScroll th, .laundryItemsListScroll td {
	width: 100%
}
.laundryItemsListScroll tbody {
	max-height: 333px; /* Just for the demo          */
	overflow-y: auto; /* Trigger vertical scroll    */
	overflow-x: hidden; /* Hide the horizontal scroll */
}
/* 스크롤바 설정*/
.laundryItemsListScroll tbody::-webkit-scrollbar {
	/* 스크롤바 막대 너비 설정 */
	width: 6px;
}
/* 스크롤바 막대 설정*/
.laundryItemsListScroll tbody::-webkit-scrollbar-thumb {
	/* 스크롤바 막대 높이 설정 */
	height: 17%;
	background-color: #d3d3d3;
	/* 스크롤바 둥글게 설정 */
	border-radius: 10px;
}
/* 스크롤바 뒷 배경 설정*/
.laundryItemsListScroll tbody::-webkit-scrollbar-track {
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>

<title>세탁 주문접수</title>

<body>

	<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/order/comfirm" method="post">
	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 20%;">
	
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>세탁주문 상세</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item active">세탁주문 상세</li>
							<li class="breadcrumb-item"><a href="#">세탁주문</a></li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		
		<div class="card mb-0" style="box-shadow: none;">
			<div class="card-header">
				<h3 class="" style="text-align: center; font-size: 1.3rem; font-weight: 400;">세탁 정보 입력</h3>
			</div>

				<div class="hiddenInput">
					<input type="text" name="loginUser" value="${loginUser.memberNo}" style="display: none;">
					<input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="${command.contactNumber}" style="display: none;">
				</div>
				
				<div class="card-body col-6" style="margin: auto; margin-top: 25px;">
					
					<div class="input-group mb-3">
						<label>수거날짜 입력</label>
					</div>
					<div class="">
						<input type="date" class="form-control" name="pickupRequestDate"> <span class="sp"></span>
					</div>
					
					<div class="input-group mb-3" style="margin-top: 20px;">
						<label>요청사항</label>
					</div>
					<div class="input-group mb-3 ">
						<input type="text" class="form-control" name="requestDetails" placeholder="ex) 공동현관 비밀번호 #12345*">
					</div>
					
				</div>
		</div>

	</div>
	
	<div style="width: 70%; margin-left: 15%">
		<p class="mb-3" style="text-align: center;">세탁을 맡기실 품목을 선택해 주세요.</p>
		<div class="row">
					<div class="col-4">
						<div class="card">
							<div class="card-header justify-content-center" style="display: flex;">
								<h3 class="card-title">의류</h3>
							</div>
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap laundryItemsListScroll">
									<thead>
										<tr style="display: flex;text-align: center;">
											<th>품목명</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody class="">
										<c:forEach items="${clothingList }" var="laundryItems">
										<tr style="cursor:pointer;" onclick="displayAddItems('${laundryItems.itemsName}','<fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />','${laundryItems.laundryItemsCode}')">
											<td>${laundryItems.itemsName}</td>
											<td style="text-align: end;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />원</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-4 ">
						<div class="card">
							<div class="card-header justify-content-center" style="display: flex;">
								<h3 class="card-title">침구</h3>
							</div>
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap laundryItemsListScroll">
									<thead>
										<tr style="display: flex;text-align: center;">
											<th>품목명</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${beddingList }" var="laundryItems">
										<tr style="cursor:pointer;" onclick="displayAddItems('${laundryItems.itemsName}','<fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />','${laundryItems.laundryItemsCode}')">
											<td>${laundryItems.itemsName}</td>
											<td style="text-align: end;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />원</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-4 ">
						<div class="card">
							<div class="card-header justify-content-center" style="display: flex;">
								<h3 class="card-title">신발</h3>
							</div>
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap laundryItemsListScroll">
									<thead>
										<tr style="display: flex;text-align: center;">
											<th>품목명</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shoesList }" var="laundryItems">
										<tr style="cursor:pointer;" onclick="displayAddItems('${laundryItems.itemsName}','<fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />','${laundryItems.laundryItemsCode}')">
											<td>${laundryItems.itemsName}</td>
											<td style="text-align: end;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${laundryItems.price}" />원</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		<div style="width: 60%; display: flex; flex-direction: column; margin-left: 20%;">
		<div class="card" style="box-shadow: none;">
			<div class="card-header">
				<h3 class="" style="text-align: center; font-size: 1.3rem; font-weight: 400;">선택한 세탁품목</h3>
			</div>

			<div class="card-body p-0">
				<table class="table">
					<thead>
						<tr style="text-align: center;">
							<th style="width: 280px;">품목명</th>
							<th style="width: 100px;">가격</th>
							<th>수량</th>
							<th style="width: 100px;">합계</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody class="selectedItems">
					
					</tbody>
				</table>
			</div>

		</div>
		<button type="submit" style="margin-top: 20px; margin: auto;" class="btn btn-primary btn-block col-6 mt-4 mb-4" >주문하기</button>
		</div>


	</form>
	
	<script>
		
	// 선택한 품목 리스트에 추가
	function displayAddItems(itemsName,price,laundryItemsCode) {
		const trs = document.querySelectorAll(".selectedItems tr");
		if(trs) {
			for (let tr of trs) {
				const classes = tr.classList;
				if (classes.contains(laundryItemsCode)) {
					//품목 개수 추가해야함
					console.log(laundryItemsCode);
					return;
				} 
			}
		}
		 const container = document.querySelector(".selectedItems");
		 container.append(createTrNode(itemsName,price,laundryItemsCode));
		  
		 const hiddenInput = document.querySelector(".hiddenInput");
		 hiddenInput.append(createHiddenInputNode(laundryItemsCode,1));
	}
	
	// 선택한 품목 삭제
	function displayRemoveItems(laundryItemsCode){
		const items = document.querySelectorAll('.'+laundryItemsCode.className);
		console.log(items);
		for (let item of items) {
			console.log(item);
			item.remove();
		}
	}
	
	// 품목선택시 화면에 보여줄 tr태그 Node생성
	function createTrNode(itemsName,price,laundryItemsCode) {
    	let tr = document.createElement('tr');
    	let td1 = document.createElement('td');
    	let td2 = document.createElement('td');
    	let td3 = document.createElement('td');
    	let td4 = document.createElement('td');
    	let td5 = document.createElement('td');
    	
    	tr.setAttribute('class', itemsName+' '+laundryItemsCode);
    	tr.style.textAlign = 'center';
    	td1.innerHTML = itemsName;
    	tr.append(td1);
    	td2.style.textAlign= 'end';
    	td2.innerHTML = price+'원';
    	tr.append(td2);
    	td3.innerHTML = 1;
    	tr.append(td3);
    	td4.style.textAlign= 'end';
    	td4.innerHTML = price+'원';
    	tr.append(td4);
    	td5.innerHTML = `<button type="button" class="btn btn-outline-danger btn-sm" onclick="displayRemoveItems(${'${laundryItemsCode}'})">삭제</button>`;
    	tr.append(td5);
    	
    	return tr;
		}
	
	// 품목 코드,수량 넘겨줄 input태그 Node생성
	function createHiddenInputNode(laundryItemsCode,quantity) {
		let input = document.createElement('input');
		input.setAttribute('type', 'text');
		input.setAttribute('class', laundryItemsCode);
		input.setAttribute('name', laundryItemsCode);
		input.setAttribute('value', laundryItemsCode+','+quantity);
		input.style.display = 'none';
		return input;
		}
	</script>

</body>