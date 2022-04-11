<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div class="card ml-3 mr-3">
		<div class="card-header">
			<h3 class="card-title">발주물품 리스트</h3>
			<div class="card-tools">
				<ul class="pagination pagination-sm float-right">
					<li class="page-item"><a class="page-link" href="#">«</a></li>
					<li class="page-item"><a class="page-link" href="#">세탁보조</a></li>
					<li class="page-item"><a class="page-link" href="#">세탁세제</a></li>
					<li class="page-item"><a class="page-link" href="#">12312</a></li>
					<li class="page-item"><a class="page-link" href="#">»</a></li>
				</ul>
			</div>
		</div>

		<div class="card-body p-0">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 100px">물품 번호</th>
						<th style="width:250px">물품명</th>
						<th>사진</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>20220330</td>
						<td>Update software</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/image/img.PNG" style="width:50px; height:50px;">
						</td>
						<td><span class="badge bg-danger">55%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Clean database</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/image/img.PNG" style="width:50px; height:50px;">
						</td>
						<td><span class="badge bg-warning">70%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Cron job running</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/image/img.PNG" style="width:50px; height:50px;">
						</td>
						<td><span class="badge bg-primary">30%</span></td>
					</tr>
					<tr>
						<td>20220330</td>
						<td>Fix and squish bugs</td>
						<td>
							<img src="<%=request.getContextPath()%>/resources/image/img.PNG" style="width:50px; height:50px;">
						</td>
						<td>빨래는 피존</td>
					</tr>
				</tbody>
			</table>
			<div class="card-footer clearfix">
				<button type="button" class="btn btn-primary float-right" onclick="window.open('<%=request.getContextPath()%>/admin/ordergoods/regist.do', '팝업창 이름', 'width=700, height=700')"><i class="fas fa-plus"></i> Add item</button>
				<!-- <button type="button" class="btn btn-primary float-right" onclick="regist_go('asdf')"><i class="fas fa-plus"></i> Add item</button> -->
			</div>
		</div>

	</div>
<script>
	function regist_go(url){
		alert("hello");
		
	}
</script>
</body>

</html>