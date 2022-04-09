<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<body>
<div class="col-12">
		<h3 class="m-3">발주 상세 정보</h3>
		<div class="p-3 m-0 card-primary card-outline">
			<div class="row">
				<div class="col-12">
					<h4>
						주문일: 2022-03-29-15:30 | 주문번호: 18354654 <span class="float-right">유성지점
							<span class="badge bg-secondary">발주상태</span>
						</span>
					</h4>
				</div>
			</div>
			<div class="card-body p-0">
				<hr>
				<strong><i class="fas fa-user mr-1"></i> 지점장</strong>
				<p class="text-muted">구건회</p>
				<hr>
				<strong><i class="fas fa-mobile-alt mr-1"></i> 지점번호</strong>
				<p class="text-muted">010-1515-1111</p>
				<hr>
				<strong><i class="fas fa-map-marker-alt mr-1"></i> 지점주소</strong>
				<p class="text-muted m-0">30542</p>
				<p class="text-muted m-0">대전 중구 오류동 111-22</p>
				<p class="text-muted m-0">1층</p>
			</div>
			<br>
			<div class="row">
				<div class="col-12 table-responsive p-0">
					<table class="table table-striped m-0 card-primary card-outline">
						<thead>
							<tr>
								<th colspan="4">총 결제금액 : 90,000원</th>
							</tr>
							<tr>
								<th>세탁 품목</th>
								<th>개수</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>세제</td>
								<td>3</td>
								<td>40,000</td>
							</tr>
							<tr>
								<td>옷걸이</td>
								<td>1</td>
								<td>20,000</td>
							</tr>
							<tr>
								<td>바구니</td>
								<td>1</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>피죤</td>
								<td>1</td>
								<td>20,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="float-right mr-3">
			<button type="button" class="btn btn-danger btn-m" onclick="history.go(-1);">닫기</button>
		</div>
	</div>
</body>
