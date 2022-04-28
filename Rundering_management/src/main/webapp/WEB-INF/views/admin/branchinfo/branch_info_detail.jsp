<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<h2 class="pl-3 m-3">지점상세정보<button type="button" id="sendBtn" class="btn btn-secondary btn-m float-right"
		onclick="CloseWindow();">목록</button></h2>
	<div class="row col-12 m-0">
		<div class="card col-6">
			<div class="card-header">
				<h3 class="card-title">지점장 정보</h3>
			</div>
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputName">이름</label> <input type="text"
						class="form-control" id="exampleInputName" placeholder="이름"
						value="${branchDetail.name }" name="name" readonly>
				</div>
				<div class="form-group">
					<label for="exampleInputPhone">전화번호</label> <input type="text"
						class="form-control" id="exampleInputPhone" placeholder="전화번호"
						value="${branchDetail.phone }" name="phone" disabled value="">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">E-mail</label> <input type="email"
						class="form-control" id="exampleInputEmail1" placeholder="이메일"
						value="${branchDetail.email }" name="email" disabled>
				</div>
				<div class="form-group">
					<label for="exampleInputAddress">주소</label> <input type="text"
						class="form-control" id="exampleInputAddress" placeholder="주소"
						value="${branchDetail.addr }" name="addr" disabled>
				</div>
			<br><hr>
			<table>
				<thead>
					<tr style="text-align: center;">
						<th colspan="2">계약서</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 280px;">심사내역서</td>
						<td><a class="btn p-0" href="상대경로/test.pdf" download=""><button
									type="button" class="btn btn-default">file.pdf</button></a>

						</td>
					</tr>
					<tr>
						<td>수의계약서</td>
						<td><a class="btn p-0" href="상대경로/test.pdf" download=""><button
									type="button" class="btn btn-default">file.pdf</button></a>

						</td>
					</tr>
					<tr>
						<td>임대차계약서</td>
						<td><a class="btn p-0" href="상대경로/test.pdf" download=""><button
									type="button" class="btn btn-default">file.pdf</button></a>

						</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>

		<div class="card col-6">
			<div class="card-header">
				<h3 class="card-title">지점등록정보</h3>
			</div>

			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputName">매장명</label> <input type="text"
						class="form-control" value="${branchDetail.branchName }"
						name="branchName" readonly>
				</div>
				<div class="form-group">
					<label for="exampleNumber">지점번호</label> <input type="number"
						class="form-control" value="${branchDetail.branchCode }"
						name="branchCode" readonly>
				</div>
				<div class="form-group">
					<label for="exampleInputAddress">주소</label> <input type="text"
						class="form-control" value="${branchDetail.addr }" name="addr"
						readonly>
				</div>
				<div class="form-group">
					<label for="exampleInputPhone">전화번호</label> <input type="text"
						class="form-control" value="${branchDetail.branchContact }"
						name="branchContact" readonly>
				</div>
				<div class="form-group">
					<label for="exampleInputInfo">추가정보</label> <input type="text"
						class="form-control" id="exampleInputInfo" disabled>
				</div>
				<c:if test="${branchDetail.branchCode eq '000000' }">
					<div style="clear: both;" class="btn-group float-right">

						<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
							확인</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>

</body>




