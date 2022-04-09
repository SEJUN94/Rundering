<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">고객 문의리스트</h3>
				<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 400px;">
						<input type="text" name="table_search"
							class="form-control float-right" placeholder="Search">
						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>카테고리</th>
							<th>Status</th>
							<th>Reason</th>
						</tr>
					</thead>
					<tbody>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/question/reply.do'" style="cursor:hand">
							<td>183</td>
							<td>John Doe</td>
							<td>11-7-2014</td>
							<td><span class="tag tag-success">Approved</span></td>
							<td>Bacon ipsum dolor sit amet salami venison chicken flank
								fatback doner.</td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/question/reply.do'" style="cursor:hand">
							<td>219</td>
							<td>Alexander Pierce</td>
							<td>11-7-2014</td>
							<td><span class="tag tag-warning">Pending</span></td>
							<td>Bacon ipsum dolor sit amet salami venison chicken flank
								fatback doner.</td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/question/reply.do'" style="cursor:hand">
							<td>657</td>
							<td>Bob Doe</td>
							<td>11-7-2014</td>
							<td><span class="tag tag-primary">Approved</span></td>
							<td>Bacon ipsum dolor sit amet salami venison chicken flank
								fatback doner.</td>
						</tr>
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/question/reply.do'" style="cursor:hand">
							<td>175</td>
							<td>Mike Doe</td>
							<td>11-7-2014</td>
							<td><span class="tag tag-danger">Denied</span></td>
							<td>Bacon ipsum dolor sit amet salami venison chicken flank
								fatback doner.</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		<div class="card-footer">
			<nav aria-label="Contacts Page Navigation" style="font-size: 0.8em;">
				<ul class="pagination justify-content-center m-0">
					<li class="page-item"><a class="page-link" href="#"> <i
							class="fas fa-angle-double-left"></i>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"> <i
							class="fas fa-angle-left"></i>
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
</body>
</html>