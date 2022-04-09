<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
</head>
<title>세탁 품목 수정</title>
<body>

<section class="content register-page">
<div class="register-box">
				<div class="login-logo">
					<a href=""><b>세탁 품목 수정</b></a>
				</div>
				<!-- form start -->
				<div class="card">
					<div class="register-card-body">
						<form role="form" class="form-horizontal" action="modify.do" method="post">
							<input type="hidden" name="picture">
							<div class="input-group mb-3">
								<div class="mailbox-attachments clearfix" style="text-align: center; margin: 0 auto">
									
									

								</div>
								<br>
							</div>
							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>품목명</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>
							




							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>세탁 가격</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
									비고
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="pwd" type="password" id="pwd">
								</div>
							</div>

						</form>
						<div class="btn-group float-right">
							<button type="button" id="sendBtn" class="btn btn-primary btn-sm  ">수정</button>
							&nbsp;&nbsp;
							
						</div>
					</div>
					<!-- register-card-body -->
				</div>
			</div>
			</section>

</body>
