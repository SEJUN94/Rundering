<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="orderList" value="${dataMap.orderList }" />

<head>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<style >
.inputRow {
	margin-left: 15px;
	display: inline-block;
}
</style>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css">
</head>

<body>

	<section class="content-header" style="width: 60%; max-width: 758px; margin: auto;">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>문의하기</h1>
				</div>
				<!-- <div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">문의하기</li>
					</ol>
				</div> -->
			</div>
		</div>
	</section>

	<div class="card mb-3" style="width: 60%; max-width: 758px; margin: auto; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 10%);">
		<form role="form" action="regist" method="post" name="registForm" enctype="multipart/form-data">
			<div class="card-body pt-0">
				<div class="form-group">
					<label for="question" style="margin-left: 10px; margin-top: 10px; font-size: large;">제목</label>
					<input type="text" name="question" id="question" class="form-control" placeholder="제목을 입력하세요">
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
								<label for="writer"
									style="margin-left: 10px; margin-top: 10px; font-size: large;">요청자</label>
								<input type="hidden" name="writer" id="writer"
									class="form-control" value="${loginUser.memberNo }"> <input
									type="text" readonly class="form-control"
									value="${loginUser.name }">
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="secretyn"
									style="margin-left: 10px; margin-top: 10px; font-size: large;">공개여부</label>
								<div class="form-group">
									<div style="margin-left: 10px; margin-top: 10px; font-size: large;">
										<input type="radio" name="secretyn" id="secretyn" value="N" />공개
										&nbsp;&nbsp;
										<input type="radio" name="secretyn" id="secretyn" value="Y" /> 비공개
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="fcontent" style="margin-left: 10px; font-size: large;">내용</label>
					<textarea style="border: none; height: 100px; resize: none;"
						class="textarea" rows="10" cols="20" id="fcontent" name="fcontent"></textarea>
				</div>
				<!-- <div class="card">
					<div class="card-header">
						<div class="row">
							<button class="btn btn-xs btn-secondary" onclick="addFile_go();"
								type="button" id="addFileBtn">
								<i class="fas fa-images"></i> Add File
							</button>
							&nbsp;&nbsp;
							<div class="card-footer fileInput p-0">
								<div class="inputRow" data-no="0">
									<label for="inputFile" data-no="0"
										class="btn btn-secondary btn-sm input-group-addon"
										onclick="justPressed(this)">파일선택</label> <input
										id="inputFileName" type="text" name="tempPicture" data-no="0"
										disabled />
									<button onclick="remove_go(0);"
										style="border: 0; outline: 0; padding: 6px; padding-bottom: 5px; margin-left: 5px;"
										class="badge bg-red" type="button">X</button>
								</div>
							</div>
							<div class="overlay" style="display: none;">
								<i class="fas fa-2x fa-spinner fa-spin"></i>
							</div>
						</div>
					</div>
				</div> -->
				     <div class="form-group">								
								<div class="card mt-2">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>&nbsp;&nbsp;
										<button class="btn btn-xs btn-secondary" onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
				<div class="card">
					<div class="row">
						<div class="col-3">
							<div class="orderno">
								<label for="orderno" style=" margin-left: 20px; margin-top: 10px; margin-bottom: 10px; font-size: large;">주문내역 선택</label>
							</div>
						</div>
						<div class="col-4">
							<c:if test="${!empty orderList }">
								<select id="orderno" name="orderno"
									class="form-control" style=" margin-top: 3px;">
										<option value="">선택</option>
									<c:forEach var="order" items="${orderList }" varStatus="i">
										<option value="${order.orderno }">${order.orderno }</option>
									</c:forEach>	
								</select>
							</c:if>
							<c:if test="${empty orderList }">
								<p style="padding-top: 12px;">주문 내역이 없습니다.</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer">
		<div class="float-right">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/question/list'" class="btn btn-warning">뒤로가기</button>
			<button  type="button" onclick="regist_go()" type="submit" id="registBtn"
				class="btn btn-primary">요청하기</button>
		</div>
	</div>
		</form>
	</div>

	
	
	
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!--  이쁜알럽트창 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
	
	<script>
	window.onload=function(){
		summernote_go($('textarea[name="fcontent"]'),'<%=request.getContextPath()%>');
	}
	</script>

	<script>
		function regist_go() {
			
			var files = $('input[name="uploadFile"]');
			for(var file of files){
				//console.log(file.name + " : "+ file.value);
				if(file.value == ""){
					Swal.fire({
						icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '파일을 선택하세요.'
					});
					file.focus();
					file.click();
					return false;
				}
			}
			
			var form = document.registForm;
			if (form.question.value == "") {
				Swal.fire({
					icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title : '제목은 필수입니다.'
				});
				return false;
			}
			if (form.secretyn.value == "") {
				Swal.fire({
					icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title : '공개여부를 선택하세요.'
				});
				return false;
			}
			Swal.fire({
				icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '등록되었습니다.'
			});
			form.submit();
		}
	</script>
	
	<script>

	var dataNum = 0;

		function addFile_go(){
		   
		   if($('input[name="uploadFile"]').length >= 3){
			   Swal.fire({
					icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title : '파일추가는 3개까지만 가능합니다.'
				});
		      return;
		   }
		   
		   var div = $("<div>").addClass("inputRow pb-2").attr("data-no", dataNum);
		   var input = $("<input>").attr({"type":"file", "name":"uploadFile"}).css("display", "inline");
		   
		   div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0; outline:0;' class='badge bg-red' type='button'>X</button>");
		   
		   $('.fileInput').append(div);
		   dataNum++;
		}

		function remove_go(dataNum){
			$('div[data-no="'+dataNum+'"]').remove();
		}
		
	
</script> 
</body>
