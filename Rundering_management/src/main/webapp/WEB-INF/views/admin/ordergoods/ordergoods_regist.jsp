<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="min-height: 571.281px;">

	<div style="min-height: 688.281px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h1>물품등록</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#"> <i
									class="fa fa-dashboard">물품관리</i>
							</a></li>
							<li class="breadcrumb-item active">등록</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section class="content register-page">
			<div class="register-box">
				<div class="login-logo">
					<a href=""><b>물품 등록</b></a>
				</div>
				<!-- form start -->
				<div class="card">
					<div class="register-card-body">
						<form role="form" class="form-horizontal" action="regist.do"
							method="post">
							<input type="hidden" name="picture">
							<div class="input-group mb-3">
								<div class="mailbox-attachments clearfix"
									style="text-align: center; margin: 0 auto">
									<div
										style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;"
										id="pictureView" class="mailbox-attachment-icon has-img">
									</div>
									<button class="btn btn-primary btn-sm" id="sendBtn"
										type="button" style="bottom: 0; width: 100%;">첨부</button>

								</div>
								<br>
							</div>
							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>물품명
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>수량
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>




							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>금액
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>비고
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>

						</form>
						<div class="btn-group float-right">
							<button type="button" id="sendBtn"
								class="btn btn-primary btn-sm  ">승인</button>
							&nbsp;&nbsp;
							<button class="btn btn-danger btn-sm  " id="sendBtn"
								type="button">반려</button>
						</div>
					</div>
					<!-- register-card-body -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
</body>
</html>