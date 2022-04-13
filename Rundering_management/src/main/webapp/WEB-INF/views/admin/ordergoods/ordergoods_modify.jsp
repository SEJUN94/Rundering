<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content register-page">
	<div class="">
		<div class="login-logo">
			<a href=""><b>물품 등록</b></a>
		</div>
		<!-- form start -->
		<div class="card">
			<div class="card-body">
				<form role="form" class="form-horizontal" action="regist"
					method="post" name="registForm">
					<input type="hidden" name="picture">
					<div class="input-group">
						<div style="text-align: center; margin: 0 auto"></div>
						<br>
					</div>
					<div class="form-group row">
						<label for="articlesName" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품명
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesName" type="text" id="articlesName" value="${orderGoods.articlesName }" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="articlesCode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품코드
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesCode" type="text" id="articlesCode" value="${orderGoods.articlesCode }" readonly>
						</div>
					</div>

					<div class="form-group row">
						<!-- sort num -->
						<label for="clcode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품분류
						</label>
						<div class="col-sm-8 input-group-sm">
							<select id="clcode" name="clcode"
								class="form-control" disabled>
								<option value="D1001">가루세제</option>
								<option value="D1002">엑체세제</option>
								<option value="D1003">섬유유연제</option>
								<option value="D1004">세탁비누</option>
								<option value="D1005">세탁보조용품</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>판매가
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="price" type="text" id="price" value="${orderGoods.price }" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="pwd" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>단위
						</label>
						<div class="col-sm-5 input-group-sm">
							<input class="form-control" name="pwd" type="text" id="pwd"
							style="text-align:right;" value="${orderGoods.each }" readonly>
						</div>
						<div class="col-sm-3 input-group-sm">
							<select onchange="list_go(1);" id="perPageNum" name="perPageNum"
								class="form-control" disabled>
								<option value="3">개</option>
								<option value="5">매</option>
								<option value="5">g</option>
								<option value="5">kg</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="note" class="col-sm-4">
							<span style="font-weight: bold;">&nbsp;&nbsp;</span>비고
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="note" type="text" id="note" value="${orderGoods.note }" readonly>
						</div>
					</div>

				</form>
				<div class="btn-group float-right">
					<div class="input-group-sm">
						<button type="button" id="sendBtn"
							class="btn btn-primary btn-sm" onclick="modify_go();">수정</button>
					</div>
					&nbsp;&nbsp;
					<div class="input-group-sm">
						<button class="btn btn-danger btn-sm" id="sendBtn" type="button"
								onclick="history.go(-1);">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<form role="form">
   <input type="hidden" name="articlesCode" value="${orderGoods.articlesCode }" />
</form>

</body>
