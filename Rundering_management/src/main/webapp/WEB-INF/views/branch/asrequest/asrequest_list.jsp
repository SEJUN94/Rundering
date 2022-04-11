<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">AS요청 게시판</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">

								<div class="input-group-sm selectWidth">
									<select class="form-control" name="perPageNum" id="perPageNum"
										onchange="list_go();">
										<option value="10">정렬개수</option>
										<option value="20">20개씩</option>
										<option value="50">50개씩</option>
										<option value="100">100개씩</option>

									</select>
								</div>
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="searchType" id="searchType">
										<option value="tcw">전 체</option>
										<option value="t">제 목</option>
										<option value="w">작성자</option>
										<option value="c">내 용</option>
										<option value="tc">제목+내용</option>
										<option value="cw">작성자+내용</option>
										<option value="tcw">작성자+제목+내용</option>
									</select>
								</div>
								<div class="input-group-sm textWidth">
									<input class="form-control " type="text" name="keyword"
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


					<div class="card-body">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="width10">번호</th>
									<th class="width35">제목</th>
									<th class="width20">작성자</th>
									<th class="width25">작성일</th>
									<th class="width10">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr
									onclick="detail_go('/Rundering_management/branch/board/noticedetail.do','')">
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
								<tr>
									<td>183</td>
									<td>혼날예정</td>
									<td>고거냉</td>
									<td><span class="tag tag-success">2022-03-15</span></td>
									<td>10</td>
								</tr>
							</tbody>
						</table>
					</div>
					<%@ include file="/WEB-INF/include/pagination.jsp" %>
				</div>
			</div>
		</div>
	</div>
</body>
