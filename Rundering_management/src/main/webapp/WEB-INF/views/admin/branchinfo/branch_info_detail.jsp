<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<body>
	<div class="card container mt-3">
		<div class="card-header">
			<h3 class="card-title">지점장 정보</h3>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputName">name</label> <input type="text"
					class="form-control" id="exampleInputName" placeholder="이름" value="${branchDetail.name }" name="name" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputPhone">phone</label> <input type="text"
					class="form-control" id="exampleInputPhone" placeholder="전화번호" value="${branchDetail.phone }" name="phone"
					disabled value="">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email</label> <input type="email"
					class="form-control" id="exampleInputEmail1" placeholder="이메일" value="${branchDetail.email }" name="email"
					disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputAddress">address</label> <input
					type="text" class="form-control" id="exampleInputAddress"
					placeholder="주소" value="${branchDetail.addr }" name="addr" disabled>
			</div>

			<div class="form-group ">
				<label for="exampleInputPds">임대차계약서 </label><br> <a class="btn"
					href="상대경로/test.pdf" download><button type="button"
						class="btn btn-block btn-default">file.pdf</button></a>
			</div>

			<c:if test="${branchDetail.branchCode eq '000000' }">
				<div style="clear: both;" class="btn-group float-right">
						<div class="input-group">
							<button type="button" id="sendBtn" class="btn btn-primary btn-sm  ">
								승인</button>
						</div>
						&nbsp;&nbsp;
						<div class="input-group">
							<button type="button" id="sendBtn" class="btn btn-danger btn-sm ">
								반려</button>
						</div>
				</div>
			</c:if>
		</div>
	</div>

	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">지점등록정보</h3>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputName">매장명</label> <input type="text"
					class="form-control" value="${branchDetail.branchName }" name="branchName" readonly>
			</div>
			<div class="form-group">
				<label for="exampleNumber">지점번호</label> <input type="number"
					class="form-control" value="${branchDetail.branchCode }" name="branchCode" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputAddress">주소</label> <input type="text"
					class="form-control" value="${branchDetail.addr }" name="addr" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputPhone">전화번호</label> <input type="text"
					class="form-control" value="${branchDetail.branchContact }" name="branchContact" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputTime">운영시간</label> <input type="text"
					class="form-control" value="24시" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputInfo">추가정보</label> <input type="text"
					class="form-control" id="exampleInputInfo"  disabled>
			</div>
			<c:if test="${branchDetail.branchCode eq '000000' }">
				<div style="clear: both;" class="btn-group float-right">
	
					<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
						확인</button>
				</div>
			</c:if>
		</div>
	</div>
	
	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">심사내역서</h3>
		</div>
		<div class="card-body">

			<div class="form-group ">
				<label for="exampleInputPds">download </label><br> <a
					class="btn" href="상대경로/test.pdf" download><button type="button"
						class="btn btn-block btn-default">file.pdf</button></a>
			</div>
			<c:if test="${branchDetail.branchCode eq '000000' }">
				<div class="btn-group float-right">
					<div class="input-group">
						<button type="button" id="sendBtn" class="btn btn-primary btn-sm  ">
							승인</button>
					</div>
					&nbsp;&nbsp;
					<div class="input-group">
						<button type="button" id="sendBtn" class="btn btn-danger btn-sm  ">
							반려</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>

	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">수의계약서</h3>
		</div>
		<div class="card-body">

			<div class="form-group ">
				<label for="exampleInputPds">download </label><br> <a
					class="btn" href="<%=request.getContextPath() %>/test.pdf" download><button type="button"
						class="btn btn-block btn-default">file.pdf</button></a>
			</div>
			<c:if test="${branchDetail.branchCode eq '000000' }">
				<div class="btn-group float-right">
					<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
						확인</button>
				</div>
			</c:if>
		</div>
	</div>
</body>




