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
				<a href=""><b>물품 상세</b></a>
			</div>
			<!-- form start -->
			<div class="card">
				<div class="card-body">
					<div class="row">
						<input type="hidden" name="oldPicture" value=""> <input
							type="file" id="inputFile" onchange="changePicture_go();"
							name="picture" style="display: none">
						<div class="input-group col-md-12">
							<div class="col-md-12" style="text-align: center;">
								<div class="manPicture" data-id="C1001" id="pictureView"
									style="border: 1px solid green; height: 140px; width: 140px; margin: 0 auto; margin-bottom: 5px;"></div>
								<div class="input-group input-group-sm">
									<label for="inputFile"
										class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
									<input id="inputFileName" class="form-control" type="text"
										name="tempPicture" disabled="" value=""> <input
										id="picture" class="form-control" type="hidden"
										name="uploadPicture">
								</div>
							</div>
						</div>
					</div>
					<form role="form" class="form-horizontal" action="regist"
						method="post" name="registForm">
						<input type="hidden" name="picture">
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

			<form role="imageForm" action="upload/picture" method="post"
				enctype="multipart/form-data">
				<input id="inputFile" name="pictureFile" type="file"
					class="form-control" onchange="picture_go();"
					style="display: none;"> <input id="oldFile" type="hidden"
					name="oldPicture" value="" /> <input type="hidden"
					name="checkUpload" value="0" />
			</form>
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
			window.opener.location.reload();
		</script>
	</c:if>

	<script>
		function remove_go() {
			var formObj = $("form[role='form']");
			var answer = confirm("정말 삭제하시겠습니까?");
			if (answer) {
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

	<script>
	window.onload=function(){
		MemberPictureThumb('<%=request.getContextPath()%>');
		//alert(window.opener.location.href);
		if(window.opener.location.href.indexOf('admin/ordergoods/list')>-1){
			//alert("member/list 확인");
			$('div#isMemberList').html();	
		}		
		
		<c:if test="${param.from eq 'modify'}" >
			alert("${member.name}님의 정보가 수정되었습니다.");	
			location.href='detail.do?id=${member.id}';
			
			if(${parentReload}){			
				if(confirm('로그인 사용자의 정보가 수정되었습니다.\n현재 화면을 닫고 새로고침 하시겠습니까?')){
					window.close();
					window.opener.parent.location.reload(true);
				}	
			}
		</c:if>
	}
</script>
</body>