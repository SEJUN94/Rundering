<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css">
</head>

<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>문의하기</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">문의하기</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<div class="card card-primary card-outline">
		<form role="form" action="regist" method="post" name="registForm">
			<div class="card-body">
				<div class="form-group">
					<label for="question"
						style="margin-left: 10px; margin-top: 10px; font-size: large;">제목</label>
					<input type="text" name="question" id="question"
						class="form-control" placeholder="제목을 입력하세요">
				</div>
				<div class="form-group">
					<div class="row">
						<div class=" col">
							<label for="setbukdoorclcode"
								style="margin-left: 10px; margin-top: 10px; font-size: large;">카테고리
								구분</label> <select id="setbukdoorclcode" name="setbukdoorclcode"
								class="form-control">
								<option value="US">이용 문의</option>
								<option value="OR">주문 문의</option>
								<option value="ET">기타 문의</option>
							</select>
						</div>
						<div class=" col">
							<div class="form-group">
								<label for="memberno"
									style="margin-left: 10px; margin-top: 10px; font-size: large;">요청자</label>
								<input type="text" id="memberno" name="memberno" readonly
									class="form-control" value="${loginUser.name }">
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="secretyn"
									style="margin-left: 10px; margin-top: 10px; font-size: large;">공개여부</label>
								<div class="form-group">
									<div style="margin-left: 10px; margin-top: 10px; font-size: large;">
										<input type="radio" name="secretyn" id="secretyn" value="Y" />
										공개 &nbsp;&nbsp;
										<input type="radio" name="secretyn" id="secretyn" value="N" />
										비공개
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="fcontent" style="margin-left: 10px; font-size: large;">▼▽▼문의할
						내용을 입력하세요▼▽▼</label>
					<textarea style="border: none; height: 100px; resize: none;"
						class="textarea" rows="10" cols="20" id="fcontent" name="fcontent"></textarea>
				</div>
			</div>
		</form>
	</div>

	<div class="card-footer">
		<div class="float-right">
			<button onclick="history.go(-1)" class="btn btn-warning">뒤로가기</button>
			<button onclick="regist_go()" type="submit" id="registBtn" class="btn btn-primary">요청하기</button>
		</div>
	</div>

	<script>
	window.onload=function(){
		summernote_go($('textarea[name="fcontent"]'),'<%=request.getContextPath()%>');
	}
	</script>

	<script>
		function regist_go() {
			var form = document.registForm;
			if (form.question.value == "") {
				alert("제목은 필수입니다.");
				return;
			}
			form.submit();
		}
	</script>
</body>
