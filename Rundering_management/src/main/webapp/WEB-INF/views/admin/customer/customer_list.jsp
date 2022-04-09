<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">회원리스트</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
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
								<th>회원번호</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>010-0000-0000</td>
								<td><span class="tag tag-success">aaa@naver.com</span></td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank</td>
							</tr>
							<tr>
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>010-0000-0000</td>
								<td><span class="tag tag-warning">aaa@naver.com</span></td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank</td>
							</tr>
							<tr>
								<td>657</td>
								<td>Bob Doe</td>
								<td>010-0000-0000</td>
								<td><span class="tag tag-primary">aaa@naver.com</span></td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank</td>
							</tr>
							<tr>
								<td>175</td>
								<td>Mike Doe</td>
								<td>010-0000-0000</td>
								<td><span class="tag tag-danger">aaa@naver.com</span></td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank</td>
							</tr>
							<tr>
								<td>115</td>
								<td>Henry Doe</td>
								<td>010-0000-0000</td>
								<td><span class="tag tag-danger">aaa@naver.com</span></td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>
</body>
</html>