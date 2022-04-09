<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<body>
	<div class="row ml-2 mr-2">
		<div class="col-12">
			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">회원 목록</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm ">
							<div class="input-group-sm selectWidth">
								<select class="form-control " name="perPageNum" id="perPageNum"
									onchange="list_go();">
									<option value="10">정렬개수</option>
									<option value="20">20개씩</option>
									<option value="50">50개씩</option>
									<option value="100">100개씩</option>

								</select>
							</div>
							<div class="input-group-sm selectWidth">
								<select class="form-control " name="searchType" id="searchType">
									<option value="tcw">이름</option>
									<option value="t">가입일</option>
									<option value="t">마지막사용일</option>
								</select>
							</div>
							<span class="input-group-append">
								<button class="btn btn-primary" type="button"
									onclick="list_go(1);" data-card-widget="search">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="card-body" style="font-size: 0.9em">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th class="width10">이름</th>
								<th class="width10">아이디</th>
								<th class="width30">주소</th>
								<th class="width15">전화번호</th>
								<th class="width10">마지막 사용일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>백관우</td>
								<td>bgwbgw100</td>
								<td>대전광역시 유성구 노은동로 187 609동 402호</td>
								<td>01044542231</td>
								<td>2022-03-30</td>

							</tr>
							<tr>
								<td>백관우</td>
								<td>bgwbgw100</td>
								<td>대전광역시 유성구 노은동로 187 609동 402호</td>
								<td>01044542231</td>
								<td>2022-03-30</td>

							</tr>
							<tr>
								<td>백관우</td>
								<td>bgwbgw100</td>
								<td>대전광역시 유성구 노은동로 187 609동 402호</td>
								<td>01044542231</td>
								<td>2022-03-30</td>

							</tr>
							<tr>
								<td>백관우</td>
								<td>bgwbgw100</td>
								<td>대전광역시 유성구 노은동로 187 609동 402호</td>
								<td>01044542231</td>
								<td>2022-03-30</td>

							</tr>
							<tr>
								<td>백관우</td>
								<td>bgwbgw100</td>
								<td>대전광역시 유성구 노은동로 187 609동 402호</td>
								<td>01044542231</td>
								<td>2022-03-30</td>

							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer" style="font-size: 0.9em">
					<nav aria-label="Contacts Page Navigation">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-left"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-double-left"></i>
							</a></li>
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
</body>