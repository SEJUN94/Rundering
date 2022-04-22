<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote.min.css">
</head>

<title>AS요청 수정</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1></h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="list.do"> <i
								class="fa fa-dashboard"></i>AS 요청
						</a></li>
						<li class="breadcrumb-item active">수정</li>
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
						<h3 class="card-title p-1">수정하기</h3>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">
						<form action="modify" method="post" role="modifyForm">
							<input type="hidden" name="asno" value="${asRequest.asno }" />
							<div class="form-group">
								<label for="title">제 목</label> <input type="text" id="title"
									name='title' class="form-control" value="${asRequest.title }">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="employeeId">요청자 <input type="text"
											id="employeeId" readonly name="employeeId"
											class="form-control" value="${asRequest.employeeId }"></label>
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
								<div class="form-group ">
									<div class="row">
										<div class=" col">
											<label for="articlesCode">물품<select
												class="form-control" name="articlesCode" id="articlesCode"
												style=" width: 195px;">
												<option value="A001">세탁기</option>
												<option value="A002">건조기</option>
												<option value="A003">에어컨</option>
											</select></label> 
										</div>
										<div class="col">
											<label for="fixturesName">고장물품<select
												class="form-control" name="fixturesCode" id="fixturesCode"
												style=" width: 195px;">
											<c:choose>
												<c:when test="${loginEmployee.branchCode == '060101'}">
													<option value="A06010101">세탁기1호기</option>
													<option value="A06010201">세탁기2호기</option>
													<option value="A06010102">건조기1호기</option>
													<option value="A06010202">건조기2호기</option>
													<option value="A06010103">에어컨1호기</option>
													<option value="A06010203">에어컨2호기</option>
												</c:when>
												<c:when test="${loginEmployee.branchCode == '060201'}">
													<option value="A06020101">세탁기1호기</option>
													<option value="A06020201">세탁기2호기</option>
													<option value="A06020102">건조기1호기</option>
													<option value="A06020202">건조기2호기</option>
													<option value="A06020103">에어컨1호기</option>
													<option value="A06020203">에어컨2호기</option>
												</c:when>
											</c:choose>
											</select></label>
										</div>
										<div class="col">
											<label for="requestDate">고장날짜 <input type="date"
												id="requestDate" name="requestDate" class="form-control"
												value="${asRequest.requestDate }"></label>
										</div>
									</div>
								</div>
								<label for="ascontent">내 용</label>
								<textarea class="textarea" name="ascontent" id="ascontent"
									rows="25" cols="90" placeholder="1000자 내외로 작성하세요.">${fn:escapeXml(asRequest.ascontent)}</textarea>
							</div>
						</form>
					</div>
					<!--end card-body  -->
					<div class="card-footer">
						<div class="float-right">
							<button type="button" class="btn btn-primary" id="modifyBtn"
								onclick="modifyPOST_go();">수정</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn"
								onclick="history.go(-1);">취소</button>
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

	<script>
	window.onload=function(){
		summernote_go($('textarea[name="ascontent"]'),'<%=request.getContextPath()%>');	
   	}
	
	 function modifyPOST_go(){
		 $("form[role='modifyForm']").submit();
	 }
   </script>
</body>