<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<label for="articlesName" class="col-sm-4"> <span
								style="color: red; font-weight: bold;">*</span>상품명
							</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="articlesName" type="text"
									id="articlesName" value="${orderGoods.articlesName }" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="articlesCode" class="col-sm-4"> <span
								style="color: red; font-weight: bold;">*</span>상품코드
							</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="articlesCode" type="text"
									id="articlesCode" value="${orderGoods.articlesCode }" readonly>
							</div>
						</div>
						<div class="form-group row">
							<!-- sort num -->
							<label for="clcode" class="col-sm-4"> <span
								style="color: red; font-weight: bold;">*</span>상품분류
							</label>
							<div class="col-sm-8 input-group-sm">
								<select id="clcode" name="clcode" class="form-control" disabled>
									<option value="B" ${orderGoods.clcode eq 'B' ? 'selected':'' }>가루세제</option>
									<option value="C" ${orderGoods.clcode eq 'C' ? 'selected':'' }>엑체세제</option>
									<option value="D" ${orderGoods.clcode eq 'D' ? 'selected':'' }>섬유유연제</option>
									<option value="E" ${orderGoods.clcode eq 'E' ? 'selected':'' }>세탁비누</option>
									<option value="F" ${orderGoods.clcode eq 'F' ? 'selected':'' }>세탁보조용품</option>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="price" class="col-sm-4"> <span
								style="color: red; font-weight: bold;">*</span>판매가
							</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="price" type="text" id="price"
									value="${orderGoods.price }" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="pwd" class="col-sm-4"> <span
								style="color: red; font-weight: bold;">*</span>단위
							</label>
							<div class="col-sm-5 input-group-sm">
								<input class="form-control" name="pwd" type="text" id="pwd"
									style="text-align: right;" value="${orderGoods.each }" readonly>
							</div>
							<div class="col-sm-3 input-group-sm">
								<select onchange="list_go(1);" id="perPageNum" name="perPageNum"
									class="form-control" disabled>
									<option value="n" ${orderGoods.each eq 'n' ? 'selected':'' }>개</option>
									<option value="h" ${orderGoods.each eq 'h' ? 'selected':'' }>매</option>
									<option value="g" ${orderGoods.each eq 'g' ? 'selected':'' }>g</option>
									<option value="kg" ${orderGoods.each eq 'kg' ? 'selected':'' }>kg</option>
									<option value="ml" ${orderGoods.each eq 'ml' ? 'selected':'' }>ml</option>
									<option value="l" ${orderGoods.each eq 'l' ? 'selected':'' }>L</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="note" class="col-sm-4"> <span
								style="font-weight: bold;">&nbsp;&nbsp;</span>비고
							</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="note" type="text" id="note"
									value="${orderGoods.note }" readonly>
							</div>
						</div>

					</form>
					<div class="btn-group float-right">
						<div class="input-group-sm">
							<button type="button" id="sendBtn" class="btn btn-primary btn-sm"
								onclick="modify_go();">수정</button>
						</div>
						&nbsp;&nbsp;
						<div class="input-group-sm">
							<button class="btn btn-danger btn-sm" id="sendBtn" type="button"
								onclick="remove_go();">삭제</button>
						</div>
						&nbsp;&nbsp;
						<div class="input-group-sm">
							<button class="btn btn-secondary btn-sm" id="sendBtn"
								type="button" onclick="">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form role="form">
		<input type="hidden" name="articlesCode"
			value="${orderGoods.articlesCode }" />
	</form>
	<script>
		function modify_go() {
			var formObj = $("form[role='form']");
			formObj.attr({
				'action' : 'modifyForm.do',
				'method' : 'post'
			});
			formObj.submit();
		}
	</script>
	<c:if test="${from eq 'modify' }">
		<script>
			alert("수정되었습니다.");
			window.close();
			window.opener.location.reload();
		</script>
	</c:if>
	
	<script>
		function remove_go(){
			var formObj = $("form[role='form']");
			var answer = confirm("정말 삭제하시겠습니까?");
			if(answer){		
				formObj.attr("action", "remove");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}
		<c:if test="${from eq 'remove'}" >
			alert("삭제되었습니다.");
			window.close();
			window.opener.location.reload();
		</c:if>
	</script>
</body>