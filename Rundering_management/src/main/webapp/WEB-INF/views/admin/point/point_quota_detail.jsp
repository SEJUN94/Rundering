<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row ml-3 mr-3">
		<div class="card col-12">


			<table class="table table-striped projects">
				<thead>
					<tr>
						<th style="width: 20%">지점장</th>
						<th style="width: 20%">지점</th>
						<th>주문량</th>
						<th style="width: 15%" class="text-center">지점상태</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>구건회</td>
						<td>유성구</td>
						<td class="project_progress">
							<div class="progress progress-sm">
								<div class="progress-bar bg-green" role="progressbar"
									aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
									style="width: 57%"></div>
							</div> <small> 57% Complete </small>
						</td>
						<td class="project-state"><span class="badge badge-success">원활</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<div class="card ml-3 mr-3">
		<div class="card-header">
			<h3 class="card-title">세탁기 상세 리스트</h3>
			
		</div>

		<div class="card-body p-0">
			<table class="table" style="font-size:0.9em;">
				<thead>
					<tr>
						<th style="width: 150px">세탁기 번호</th>
						<th style="width: 250px"></th>
						
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>20220330</td>
						<td>Update software</td>
						
						<td><span class="badge bg-danger">55%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Clean database</td>
						
						<td><span class="badge bg-warning">70%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Cron job running</td>
						
						<td><span class="badge bg-primary">30%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Fix and squish bugs</td>
						
						<td>빨래는 피존</td>
					</tr>
				</tbody>
			</table>
			<div class="card-footer clearfix">
				<button type="button" class="btn btn-primary float-right" onclick="window.open('/Rundering_management/admin/ordergoods/regist.do', '팝업창 이름', 'width=700, height=700')">
					<i class="fas fa-plus"></i> Add item
				</button>
				<!-- <button type="button" class="btn btn-primary float-right" onclick="regist_go('asdf')"><i class="fas fa-plus"></i> Add item</button> -->
			</div>
		</div>

	</div>
</body>
</html>