<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<body>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">발주내역</h3>
						<div class="card-tools">

							<div class="input-group input-group-sm">

								<span class="input-group-append">

									<button class="btn btn-primary">확인</button>
								</span>
								<div class="input-group-sm selectWidth">
									<select class="form-control " name="searchType" id="searchType">
										<option value="tcw">승인대기</option>
										<option value="t">승인</option>
										<option value="t">반려</option>
										<option value="t">발주대기</option>
										<option value="t">발주</option>
										<option value="">미수령</option>
										<option value="">수령</option>
									</select>
								</div>
								<span class="input-group-append">
									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
`							</div>
						</div>
					</div>

					<div class="card-body">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="width20">발주번호</th>
									<th class="width15">총금액</th>
									<th class="width15">발주신청일</th>
									<th class="width15">상태</th>
									<th class="width15">수령일</th>
								</tr>
							</thead>

							<tbody>
								<tr
									 onclick="OpenWindow('/Rundering_management/branch/iteamorder/detail.do','상세',800,700);">
									<td>183</td>
									<td>100000원</td>
									<td>2022-03-21</td>
									<td><span class="tag tag-success">발주대기</span></td>
									<td>1</td>
								</tr>
								<tr>
									<td>184</td>
									<td>300000원</td>
									<td>2021-03-24</td>
									<td><span class="tag tag-success">승인대기</span></td>
									<td>2</td>
								</tr>
								<tr>
									<td>183</td>
									<td>100000원</td>
									<td>2022-03-21</td>
									<td><span class="tag tag-success">발주대기</span></td>
									<td>1</td>
								</tr>
								<tr>
									<td>184</td>
									<td>300000원</td>
									<td>2021-03-24</td>
									<td><span class="tag tag-success">승인대기</span></td>
									<td>2</td>
								</tr>
								<tr>
									<td>183</td>
									<td>100000원</td>
									<td>2022-03-21</td>
									<td><span class="tag tag-success">발주대기</span></td>
									<td>1</td>
								</tr>
								<tr>
									<td>184</td>
									<td>300000원</td>
									<td>2021-03-24</td>
									<td><span class="tag tag-success">승인대기</span></td>
									<td>2</td>
								</tr>
								<tr>
									<td>184</td>
									<td>300000원</td>
									<td>2021-03-24</td>
									<td><span class="tag tag-success">승인대기</span></td>
									<td>2</td>
								</tr>
								<tr>
									<td>184</td>
									<td>300000원</td>
									<td>2021-03-24</td>
									<td><span class="tag tag-success">승인대기</span></td>
									<td>2</td>
								</tr>
								<tr>
									<td>183</td>
									<td>100000원</td>
									<td>2022-03-21</td>
									<td><span class="tag tag-success">발주대기</span></td>
									<td>1</td>
								</tr>
								<tr>
									<td>183</td>
									<td>100000원</td>
									<td>2022-03-21</td>
									<td><span class="tag tag-success">발주대기</span></td>
									<td>1</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer"></div>
				</div>

			</div>
		</div>
	</div>
</body>
