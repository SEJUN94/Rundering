<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
</head>


<title>상세 보기</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6"></div>
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
					<div class="card-body pad">
						<div class="row" style="padding-bottom:10px;">
							<div class="col-2">
								<label for="memberNo">회원번호</label> <input type="text" id="memberNo"
								readonly name='memberNo' class="form-control"
								value="${member.memberNo }">
							</div>
							<div class="col-3">
								<label for="id">아이디</label> <input type="text" id="id"
									readonly name="id" class="form-control"
									value="${member.id }">
							</div>
							<div class="col-2">
								<label for="name">이름 </label><input type="text" id="name" 
									readonly name="name"class="form-control" 
									value="${member.name }">
							</div>
							<div class="col-3">
								<label for="phone">연락처 </label><input type="text" id="phone" 
									readonly name="phone" class="form-control"
									 value="${member.phone}">
							</div>
						</div>
						<div class="form-group ">
							<div class="row">
								<div class="col-4">
									<label for="registDate">email </label><input type="text"
										id="registDate" readonly name="registDate"
										class="form-control" value="${member.email }">
								</div>
								<div class="col-6">
									<label for="registDate">마지막로그인 </label> <input type="text"
										id="registDate" readonly name="registDate"
										class="form-control" value="${member.lastLogpsnHourLiver }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="content">상태</label>
							<div>${suggest.content }</div>
						</div>

					</div>
					

					<!--end card-body  -->
					<div class="card-footer">
						<div class="float-right">
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
	
</body>