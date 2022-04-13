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
				<form role="modifyForm" class="form-horizontal" action="modify"
					method="post" name="modifyForm">
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
							<input class="form-control" name="articlesName" type="text" id="articlesName" value="${orderGoods.articlesName }">
						</div>
					</div>
					<div class="form-group row">
						<label for="articlesCode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품코드
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesCode" type="text" id="articlesCode" value="${orderGoods.articlesCode }">
						</div>
					</div>

					<div class="form-group row">
						<!-- sort num -->
						<label for="clcode" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>상품분류
						</label>
						<div class="col-sm-8 input-group-sm">
							<select id="clcode" name="clcode"
								class="form-control">
								<option value="${orderGoods.clcode }" ${orderGoods.clcode eq 'B' ? 'selected':'' }>가루세제</option>
								<option value="${orderGoods.clcode }" ${orderGoods.clcode eq 'C' ? 'selected':'' }>엑체세제</option>
								<option value="${orderGoods.clcode }" ${orderGoods.clcode eq 'D' ? 'selected':'' }>섬유유연제</option>
								<option value="${orderGoods.clcode }" ${orderGoods.clcode eq 'E' ? 'selected':'' }>세탁비누</option>
								<option value="${orderGoods.clcode }" ${orderGoods.clcode eq 'F' ? 'selected':'' }>세탁보조용품</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>판매가
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="price" type="text" id="price" value="${orderGoods.price }">
						</div>
					</div>
					<div class="form-group row">
						<label for="each" class="col-sm-4">
							<span style="color: red; font-weight: bold;">*</span>단위
						</label>
						<div class="col-sm-5 input-group-sm">
							<input class="form-control" name="each" type="text" id="each"
							style="text-align:right;" value="${orderGoods.each }">
						</div>
						<div class="col-sm-3 input-group-sm">
							<select onchange="list_go(1);" id="perPageNum" name="perPageNum"
								class="form-control">
								<option value="${orderGoods.each }" ${orderGoods.each eq 'n' ? 'selected':'' }>개</option>
								<option value="${orderGoods.each }" ${orderGoods.each eq 'h' ? 'selected':'' }>매</option>
								<option value="${orderGoods.each }" ${orderGoods.each eq 'g' ? 'selected':'' }>g</option>
								<option value="${orderGoods.each }" ${orderGoods.each eq 'kg' ? 'selected':'' }>kg</option>
								<option value="${orderGoods.each }" ${orderGoods.each eq 'ml' ? 'selected':'' }>ml</option>
								<option value="${orderGoods.each }" ${orderGoods.each eq 'l' ? 'selected':'' }>L</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="note" class="col-sm-4">
							<span style="font-weight: bold;">&nbsp;&nbsp;</span>비고
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="note" type="text" id="note" value="${orderGoods.note }">
						</div>
					</div>

				</form>
				<div class="btn-group float-right">
					<div class="input-group-sm">
						<button type="button" id="sendBtn"
							class="btn btn-primary btn-sm" onclick="modifyPOST_go();">수정</button>
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

<script>
function modifyPOST_go(){
	var form = document.modifyForm;
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
	 //alert("modify btn click");
	 $("form[role='modifyForm']").submit();
}
</script>

</body>
