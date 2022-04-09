<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
</style>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>상세보기</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">상세보기</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<div class="ml-3 mr-3">
		<div class="card card-primary card-outline">
			<div class="card-body">
				<div class="form-group">
					<input class="form-control" placeholder="제목:">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="카테고리:">
				</div>
				<textarea class="textquestion" placeholder="문의내용을 입력하세요."
					style="width: 100%; height: 300px;"></textarea>
			</div>
			<div class="card-footer">
				<button type="reset" class="btn btn-danger">
					<i class="fas fa-times"></i> 삭제
				</button>
				<div class="float-right">
					<button onclick="history.go(-1)" class="btn btn-warning">
						<i class="far fa-envelope"></i> 뒤로가기
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row ml-2 mr-2">
		<div class="col-12">
			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">Reply</h3>
					<div class="card-tools"></div>
				</div>
				<div class="ml-2 mr-2">
					<div class="col-12 float-left">
						<div class="form-group">
							<label for="exampleInputBorder ml-2" id="requestText">고객님
								안녕하세요 Rundering관리자입니다.</label> <span class="form-group-append"
								style="float: right;"> 관리자 </span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card-footer">
							<form action="#" method="post">
								<div class="input-group">
									<input type="text" name="message"
										placeholder="Type Message ..." class="form-control"> <span
										class="input-group-append">
										<button type="button" class="btn btn-primary">Send</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>