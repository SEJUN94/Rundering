<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>휴먼계정 상세정보</title>
</head>


<body>
	<div class="card container">
		<div class="card-header">
			<h3 class="card-title">휴먼계정 상세정보</h3>
		</div>

		<div class="card-body">

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputName">이름</label> <input type="name"
						class="form-control" id="InputName" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputNumber">전화번호</label> <input type="number"
						class="form-control" id="InputNumber" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputEmail">이메일</label> <input type="text"
						class="form-control" id="InputEmail" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="InputAddress">주소</label> <input type="text"
						class="form-control" id="InputAddress" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputNumber">주문횟수</label> <input type="number"
						class="form-control" id="InputNumber" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="InputNumber">취소횟수</label> <input type="number"
						class="form-control" id="InputNumber" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputDate">가입일</label> <input type="date"
						class="form-control" id="InputDate" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="InputDate">마지막 로그인</label> <input type="datetime-local"
						class="form-control" id="InputTime" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="InputDate">휴먼 전환일</label> <input type="date"
						class="form-control" id="InputDate" disabled>
				</div>
			</div>


			<div style="clear: both;" class="btn-group float-right">
				<span><button type="button" id="sendBtn" class="btn btn-success btn-sm ">
					휴먼해제</button>
				<button type="button" id="sendBtn" class="btn btn-primary btn-sm ">
					닫기</button></span>
			</div>
		</div>

	</div>
</body>
</body>

