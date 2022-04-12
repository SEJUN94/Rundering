<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="content register-page">
	<div class="">
		<div class="login-logo">
			<a href=""><b>물품 등록</b></a>
		</div>
		<!-- form start -->
		<div class="card">
			<div class="card-body">
				<form role="form" class="form-horizontal" action="regist.do"
					method="post">
					<input type="hidden" name="picture">
					<div class="input-group">
						<div style="text-align: center; margin: 0 auto"></div>
						<br>
					</div>
					<div class="form-group row">
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="color: red; font-weight: bold;">*</span>상품명
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="pwd" type="password" id="pwd">
						</div>
					</div>
					<div class="form-group row">
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="color: red; font-weight: bold;">*</span>상품코드
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="pwd" type="password" id="pwd">
						</div>
					</div>

					<div class="form-group row">
						<!-- search bar -->
						<!-- sort num -->
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="color: red; font-weight: bold;">*</span>상품분류
						</label>
						<div class="col-sm-8 input-group-sm">
							<select onchange="list_go(1);" id="perPageNum" name="perPageNum"
								class="form-control">
								<option value="10" selected="">정렬개수</option>
								<option value="2">2개씩</option>
								<option value="3">3개씩</option>
								<option value="5">5개씩</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="color: red; font-weight: bold;">*</span>판매가
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="pwd" type="password" id="pwd">
						</div>
					</div>
					<div class="form-group row">
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="color: red; font-weight: bold;">*</span>단위
						</label>
						<div class="col-sm-8 input-group-sm">
							<select onchange="list_go(1);" id="perPageNum" name="perPageNum"
								class="form-control">
								<option value="3">개</option>
								<option value="5">kg</option>
							</select>
						</div>

					</div>
					<div class="form-group row">
						<label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
							<span style="font-weight: bold;">&nbsp;&nbsp;</span>비고
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="pwd" type="password" id="pwd">
						</div>
					</div>

				</form>
				<div class="btn-group float-right">
					<div class="input-group-sm">
						<button type="button" id="sendBtn"
							class="btn btn-primary btn-sm  ">등록</button>
					</div>
					&nbsp;&nbsp;
					<div class="input-group-sm">
						<button class="btn btn-danger btn-sm  " id="sendBtn" type="button">목록</button>
					</div>
				</div>
			</div>
			<!-- register-card-body -->
		</div>
	</div>
</section>
</body>
</html>