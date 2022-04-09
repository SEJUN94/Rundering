<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>

	<!-- 상세검색 카드 -->
	<div class="card card-secondary card-outline ml-3 mr-3 mb-2">
		<form class="form-horizontal">
			<div class="card-body">
				<div class="form-group row m-0">
					<label for="searchcontents" class="col-sm-2 col-form-label">주문검색</label>
					<div class="col-sm-10">
						<select class="form-control"
							style="display: inline-block; width: auto;">
							<option>주문번호</option>
							<option>주문자명</option>
							<option>연락처</option>
							<option>배송지</option>
						</select> <input type="text" class="form-control" id="searchcontents"
							placeholder="검색어" style="display: inline-block; width: 50%;">
					</div>
				</div>
				<div class="form-group row m-0">
					<label for="orderstatus" class="col-sm-2 col-form-label">주문상태</label>
					<div class="col-sm-10 p-2" style="display: inline-flex;">
						<div class="form-check ">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거대기&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">수거완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">세탁중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">세탁완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">배송중&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">배송완료&nbsp;&nbsp;</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"> <label
								class="form-check-label">취소&nbsp;&nbsp;</label>
						</div>
					</div>
				</div>
				<div class="form-group row m-0">
					<label for="orderperiod" class="col-sm-2 col-form-label">주문일</label>
					<div class="col-sm-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="far fa-calendar-alt"></i>
								</span>
							</div>
							<input type="text" id="dates" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-center p-2">
				<button type="submit" class="btn btn-primary mr-2">검색</button>
				<button type="submit" class="btn btn-default">초기화</button>
			</div>
		</form>
	</div>
	
	
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0">
				<h3 class="m-3">세탁 주문</h3>

				<div class="card-body table-responsive p-0 mt-0">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
								<th>주문일</th>
								<th>주문번호</th>
								<th>세탁물</th>
								<th>주문자</th>
								<th>결제금액</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>수거완료</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개, 정장자켓 3개...</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>수거완료</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>배송중</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>수거중</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>수거완료</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>세탁중</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>세탁중</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>세탁중</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>수거완료</td>
							</tr>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do', '주문 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>2022-03-29-15:30</td>
								<td>18354654</td>
								<td>티셔츠 1개, 니트 2개</td>
								<td>구건회</td>
								<td>14,000원</td>
								<td>배송완료</td>
							</tr>
						
						</tbody>
					</table>


					<div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination justify-content-center m-0">
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-right"></i>
								</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="fas fa-angle-double-right"></i>
								</a></li>
							</ul>
						</nav>
					</div>

				</div>

			</div>
		</div>
	</div>
	

	<script>
		//daterangepicker 설정
		moment.locale('ko'); //언어를 한국어로 설정함!
		  $('#dates').daterangepicker(
		    {
		      timePicker: false,
		      timePicker24Hour: true,
		      timePickerSeconds: true,
		      singleDatePicker: false,
		      locale :{ 
		        format: 'YYYY-MM-DD',
		        separator: '~',
		        applyLabel: "적용",
		        cancelLabel: "닫기"
		      },
		    });
	</script>

</body>



