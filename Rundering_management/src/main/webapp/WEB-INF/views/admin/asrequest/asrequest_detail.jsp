<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
</head>


<title>상세 보기</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="list.do"> <i
								class="fa fa-dashboard"></i>AS 요청
						</a></li>
						<li class="breadcrumb-item active">상세보기</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!-- Main content -->
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">상세보기</h3>
					</div>
					<!--end card-header  -->
					<div class="card-body pad col-12">
						<div class="form-group">
							<label for="title">제 목</label> <input type="text" id="title"
								readonly name='title' class="form-control"
								value="${asRequest.title }">
						</div>
						<div class="form-group ">
							<div class="row">
								<div class="col">
									<label for="employeeId">요청자 <input type="text" id="employeeId"
										readonly name="employeeId" class="form-control"
										value="${asRequest.employeeId }"></label>
								</div>
								<div class="col">
									<label for="branchCode">소속지점 <input type="text"
										id="branchCode" readonly name="branchCode"
										class="form-control" value="${asRequest.branchCode }"></label>
								</div>
								<div class="col">
									<label for="registDate">등록일 <input type="text"
										id="registDate" readonly name="registDate"
										class="form-control" value="${asRequest.registDate }"></label>
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="row">
								<div class="col-6">
									<label for="fixturesName">고장물품 </label>
									<input type="text" id="fixturesName"
										readonly name="fixturesName" class="form-control"
										value="${asRequest.fixturesName }">
								</div>
								<div class="col-6">
									<label for="requestDate">고장날짜 </label>
									<input type="text" id="requestDate"
										readonly name="requestDate" class="form-control"
										value="${asRequest.requestDate }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="ascontent">요청 내용</label>
							<div>${asRequest.ascontent }</div>
						</div>

					</div>
					<!--end card-body  -->					
					<div class="card-footer">
						<div class="float-right">
							<%-- <button type="button" class="btn btn-danger" id="removeBtn"
								onclick="remove_go('${asRequest.asno}');">삭제</button>
							&nbsp;&nbsp; --%>
							<button type="button" class="btn btn-warning" id="okBtn"
								onclick="ok_go('${asRequest.asno}');">조치완료</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="cancelBtn"
								onclick="CloseWindow();">닫 기</button>
						</div>
					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<!-- /.content -->
	
	<!-- 이쁜알럽트창 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
	
	<script>
		function ok_go(asno) {
			location.href = "ok?asno=" + asno;
		}

		<c:if test="${from eq 'ok' }">
		Swal.fire({
			icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title : '완료되었습니다.'
		});
		window.close();
		window.opener.location.reload();
		</c:if>
	</script>
</body>