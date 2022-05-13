<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css">
</head>

<body>
	<div class="col-md-12">
		<div class="card card-primary card-outline">
			<div class="card-header">
				<h3 class="card-title">건의사항 작성</h3>
			</div>
			<form role="form" action="<%=request.getContextPath() %>/branch/suggest/regist" method="post" name="registForm" enctype="multipart/form-data">
				<div class="card-body p-1">
					<div class="form-group">
						<label for="title"
							style="margin-left: 10px; margin-top: 10px; font-size: large;">제목</label>
							<input type="text" name="title" id="title" class="form-control"
							placeholder="제목을 입력하세요">
					</div>
					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="writer" style="margin-left: 10px; font-size: large;">작성자</label>
								<input type="text" id="writer" readonly name="writer"
									class="form-control" value="${loginEmployee.employeeId }">
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="branchName"
									style="margin-left: 10px; font-size: large;">소속지점</label> <input
									type="text" id="branchName" readonly name="branchName"
									class="form-control" value="${loginEmployee.branchCode }">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="content" style="margin-left: 10px; font-size: large;">내용</label>
						<textarea style="border: none; height: 100px; resize: none;"
							class="textarea" rows="10" cols="20" id="content" name="content"></textarea>
					</div>
				</div>
				   <div class="form-group">								
								<div class="card mt-2">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>&nbsp;&nbsp;
										<button class="btn btn-xs btn-primary mb-" onclick="addFile_go();"	type="button" id="addFileBtn" style="background-color: #7b9acc; border: #7b9acc;">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
				
			</form>
			<div class="card-footer">
				<div class="float-right">
					<button onclick="history.go(-1)" class="btn btn-warning">뒤로가기</button>
					<button onclick="regist_go()" type="submit" id="registBtn" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
	</div>



	<script>
	window.onload=function(){
		summernote_go($('textarea[name="content"]'),'<%=request.getContextPath()%>');	
   	} 
	</script>

	<script>
		function regist_go() {
			var form = document.registForm;
			if (form.title.value == "") {
				alert("제목은 필수입니다.");
				return;
			}
			alert("등록 완료되었습니다.");
			form.submit();
		}
	</script>
	
	   
<script>

var dataNum = 0;

	function addFile_go(){
	   
	   if($('input[name="uploadFile"]').length >= 5){
	      alert("파일추가는 5개까지만 가능합니다.");
	      return;
	   }
	   
	   var div = $("<div>").addClass("inputRow").attr("data-no", dataNum);
	   var input = $("<input>").attr({"type":"file", "name":"uploadFile"}).css("display", "inline");
	   
	   div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0; outline:0;' class='badge bg-red' type='button'>X</button>");
	   
	   $('.fileInput').append(div);
	   dataNum++;
	}

	function remove_go(dataNum){
		$('div[data-no="'+dataNum+'"]').remove();
	}
	
	function regist_go(){
		//alert("regist btn click");
		
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name + " : "+ file.value);
			if(file.value == ""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}
		
		if($("input[name='title']").val()==""){ //form.title.value
			alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
		}
		
		$("form[role='form']").submit();
		
	}
	
</script> 
	<script>
	
	<c:if test="${from eq 'modify' }">
	alert("수정되었습니다.");

	</c:if>

	<c:if test="${from eq 'remove' }">
		alert("삭제되었습니다.");

		window.opener.parent.location.reload(true);
		window.close();

	</c:if>
	
</script> 
	
	
</body>
