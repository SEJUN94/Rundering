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
							<input class="form-control" name="articlesName" type="text" id="articlesName">
						</div>
					</div>
					<div class="form-group row">
						<label for="articlesCode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품코드
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesCode" type="text" id="articlesCode">
						</div>
					</div>

					<div class="form-group row">
						<!-- search bar -->
						<!-- sort num -->
						<label for="clcode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품분류
						</label>
						<div class="col-sm-8 input-group-sm">
							<select id="clcode" name="clcode"
								class="form-control">
								<option value="i">가루세제</option>
								<option value="p">엑체세제</option>
								<option value="e">섬유유연제</option>
								<option value="n">세탁비누</option>
								<option value="o">세탁보조용품</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>판매가
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="price" type="text" id="price">
						</div>
					</div>
					<div class="form-group row">
						<label for="each" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>단위
						</label>
						<div class="col-sm-5 input-group-sm">
							<input class="form-control" name="each" type="text" id="each"
							style="text-align:right;">
						</div>
						<div class="col-sm-3 input-group-sm">
							<select onchange="list_go(1);" id="searchType" name="searchType"
								class="form-control">
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
							<input class="form-control" name="note" type="text" id="note">
						</div>
					</div>

				</form>
				<div class="btn-group float-right">
					<div class="input-group-sm">
						<button type="button" id="sendBtn"
							class="btn btn-primary btn-sm" onclick="regist_go();">등록</button>
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
<script>
	function regist_go(){
		var form = document.registForm;
		if(form.articlesName.value==""){
			alert("상품명은 필수입니다.");
			return;
		}
		if(form.articlesCode.value==""){
			alert("세탁물품코드는 필수입니다.");
			return;
		}
		if(form.price.value==""){
			alert("물품가격은 필수입니다.");
			return;
		}
		form.submit();
	}
</script>
</body>
</html>