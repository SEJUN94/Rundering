<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>탈퇴 회원 리스트</title>
</head>
<body>
	<div class="row ml-3 mr-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">

					<div class="input-group input-group-sm">
						<h2 style="height: 10px;" class="card-title">탈퇴 회원 리스트</h2>

						<div class="col-7"></div>
						<select class="form-control col-md-2" name="searchType"
							id="searchType">
							<option value="w">이름</option>
							<option value="w">주소</option>
							<option value="w">이름+주소</option>
							<option value="w">배송중</option>
						</select> <input class="form-control col-md-2" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value=""><span
							class="input-group-append">
							<button class="btn btn-primary" type="button"
								onclick="list_go(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<div class="card-tools"></div>

				</div>

				<div class="card-body p-0">
					<table style="text-align: center;" class="table text-nowrap">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>탈퇴일</th>
								<th>상태변경</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>2022-03-27</td>
								<td><span class="badge bg-success">탈퇴취소</span></td>
							</tr>
							<tr>
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>2022-03-21</td>
								<td><span class="badge bg-success">탈퇴취소</span></td>
							</tr>
							<tr>
								<td>657</td>
								<td>Bob Doe</td>
								<td>2021-12-04</td>
								<td><span class="badge bg-success">탈퇴취소</span></td>
							</tr>
							<tr>
								<td>175</td>
								<td>Mike Doe</td>
								<td>2021-11-30</td>
								<td><span class="badge bg-success">탈퇴취소</span></td>
							</tr>
							<tr>
								<td>115</td>
								<td>Henry Doe</td>
								<td>2021-10-27</td>
								<td><span class="badge bg-success">탈퇴취소</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<%@ include file="/WEB-INF/include/pagination.jsp"%>
			</div>
		</div>
	</div>
</body>

