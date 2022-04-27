<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body>
	<div class="card card-outline card-outline-tabs card-success">

		<div class="card-header p-0 border-bottom-0"
			style="font-size: 1.4rem;">
			<ul class="nav nav-tabs justify-content-center"
				id="custom-tabs-four-tab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="custom-tabs-four-home-tab" data-toggle="pill"
					href="#custom-tabs-four-home" role="tab"
					aria-controls="custom-tabs-four-home" aria-selected="true">진행중
						배송 목록</a></li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-four-profile-tab" data-toggle="pill"
					href="#custom-tabs-four-profile" role="tab"
					aria-controls="custom-tabs-four-profile" aria-selected="false">완료된
						배송 목록</a></li>
			</ul>
		</div>
		<div class="card-body p-0">
			<table class="table table-striped" style="font-size: 1.2rem;">
				<thead>
					<tr>
						<th style="width: 10px"></th>
						<th>배송 주소지</th>
					</tr>
				</thead>
				<tbody>
					<tr onclick="location.href='<%=request.getContextPath()%>/fordelivery/deliverydetail'">
						<td>1</td>
						<td>중구 계룡로 820</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="card-footer clearfix">
			<ul class="pagination m-0 justify-content-center">
				<li class="page-item"><a class="page-link" href="#">«</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">»</a></li>
			</ul>
		</div>

	</div>

</body>