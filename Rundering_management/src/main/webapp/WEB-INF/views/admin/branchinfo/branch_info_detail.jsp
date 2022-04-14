<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>

	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">지점장 정보</h3>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputName">name</label> <input type="name"
					class="form-control" id="exampleInputName" placeholder="이름"
					disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputPhone">phone</label> <input type="phone"
					class="form-control" id="exampleInputPhone" placeholder="전화번호"
					disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email</label> <input type="email"
					class="form-control" id="exampleInputEmail1" placeholder="이메일"
					disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputAddress">address</label> <input
					type="address" class="form-control" id="exampleInputAddress"
					placeholder="주소" disabled>
			</div>

			<div class="form-group ">
				<label for="exampleInputPds">임대차계약서 </label><br> <a class="btn"
					href="상대경로/test.pdf" download><button type="button"
						class="btn btn-block btn-default">file.pdf</button></a>
			</div>

			<div style="clear: both;" class="btn-group float-right">

				<button type="button" id="sendBtn" class="btn btn-primary btn-sm  ">
					승인</button>
				&nbsp;&nbsp;
				<button type="button" id="sendBtn" class="btn btn-danger btn-sm ">
					반려</button>
			</div>
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
			<div class="btn-group float-right">
				<button type="button" id="sendBtn" class="btn btn-primary btn-sm  ">
					승인</button>
				&nbsp;&nbsp;
				<button type="button" id="sendBtn" class="btn btn-danger btn-sm  ">
					반려</button>
			</div>
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
			<div class="btn-group float-right">
				<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
					확인</button>
			</div>
		</div>
	</div>


	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">지점등록정보</h3>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputName">매장명</label> <input type="text"
					class="form-control" id="exampleInputName" disabled>
			</div>
			<div class="form-group">
				<label for="exampleNumber">지점번호</label> <input type="number"
					class="form-control" id="exampleInputNumber" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputAddress">주소</label> <input type="text"
					class="form-control" id="exampleInputAddress" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputPhone">전화번호</label> <input type="number"
					class="form-control" id="exampleInputPhone" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputTime">운영시간</label> <input type="text"
					class="form-control" id="exampleInputTime" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputInfo">추가정보</label> <input type="text"
					class="form-control" id="exampleInputInfo" disabled>
			</div>

			<div style="clear: both;" class="btn-group float-right">

				<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
					확인</button>
			</div>
		</div>
	</div>
</body>




