<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>

<style>
.no {
	width: 10%;
}

.boardtitle {
	width: 35%;
}

.writer {
	width: 20%;
}

.date {
	width: 25%;
}

.clicks {
	width: 10%;
}
</style>
</head>

<body>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">건의사항</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">



								<div class="input-group-sm selectWidth">
									<select class="form-control " name="searchType" id="searchType">
										<option value="tcw">전 체</option>
										<option value="t">제 목</option>
										<option value="w">작성자</option>
									</select>
								</div>
								<div class="input-group-sm textWidth">
									<input class="form-control" type="text" name="keyword"
										placeholder="검색어를 입력하세요." value="">
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
					<div class="card-body p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="no">번호</th>
									<th class="boardtitle">제목</th>
									<th class="date">작성날짜</th>
									<th class="clicks">조회수</th>
									<th class="yn">확인여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>180</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>확인</td>
								</tr>
								<tr>
									<td>181</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>미확인</td>
								</tr>
								<tr>
									<td>180</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>확인</td>
								</tr>
								<tr>
									<td>181</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>미확인</td>
								</tr>
								<tr>
									<td>180</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>확인</td>
								</tr>
								<tr>
									<td>181</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>미확인</td>
								</tr>
								<tr>
									<td>180</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>확인</td>
								</tr>
								<tr>
									<td>181</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>미확인</td>
								</tr>
								<tr>
									<td>180</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>확인</td>
								</tr>
								<tr>
									<td>181</td>
									<td>대우개선요구</td>
									<td>2022-03-14</td>
									<td><span class="tag tag-success">3</span></td>
									<td>미확인</td>
								</tr>
							</tbody>
						</table>
						<div class="float-right mt-3 mr-3 mb-3">

							<button class="btn btn-primary" type="button"
								onclick="detail_go('/Rundering_management/branch/board/suggest/regist.do','')">
								작성하기</button>
						</div>
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
	</div>

</body>