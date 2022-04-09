<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<title>지점 발주 내역</title>

<body>
	<div style="height: 20px;"></div>
	<div class="row ml-3 mr-3">
		<div class="col-12 p-0">
			<div class="card m-0">
				<h3 class="m-3">지점 발주 내역</h3>

				<div class="card-body table-responsive p-0 mt-0">
					<table
						class="table table-hover text-nowrap card-secondary card-outline">
						<thead>
							<tr>
								<th>발주번호</th>
								<th>지점번호</th>
								<th>요청일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<tr
								onclick="window.open('<%=request.getContextPath()%>/admin/branchorder/detail.do', '발주 상세', 'width=700, height=900');"
								style="cursor: pointer;">
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-warning">승인대기</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-warning">발주대기</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-warning">미수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-danger">반려</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
							</tr>
							<tr>
								<td>183</td>
								<td>15324</td>
								<td>2022-03-29-15:30</td>
								<td><span class="badge badge-success">승인</span> <span
									class="badge badge-success">발주</span> <span
									class="badge badge-success">수령</span></td>
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


</body>