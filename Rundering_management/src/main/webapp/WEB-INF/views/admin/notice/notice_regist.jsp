<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<body>


<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2"> 
			<div class="col-sm-6">
				<h1>공지사항 작성</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">공지사항 작성</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<div class="card card-primary card-outline">     
	<div class="card-body">
	<form role="form" method="post" action="<%=request.getContextPath()%>/admin/notice/regist" name="registForm" enctype="multipart/form-data">
	<input type="hidden" name="employeeId" value="MA22001">
		<div class="form-group">
			<input class="form-control" placeholder="제목" name="title">
		</div>
<!-- 		<div class="form-group">
			<input class="form-control" placeholder="작성자:" name="employeeId" value="MA22001" readonly>
		</div> -->
		<div class="">
              <textarea class="form-control" rows="10" cols="30" id="" name="content"></textarea>
           	
          </div>
          <div class="form-group">								
								<div class="card mt-2">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>&nbsp;&nbsp;
										<button class="btn btn-xs btn-primary mb-" onclick="addFile_go();"	type="button" id="addFileBtn" style="background-color: #82BBD8; border: #82BBD8;">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
     </form>
	</div>

	<div class="card-footer">
		<div class="float-right">
			<button onclick="history.go(-1)" class="btn btn-warning">뒤로가기</button>
			<button onclick="regist_go()" type="submit" class="btn btn-primary">공지등록</button>
		</div>
	</div>
</div>
	<script>
	      window.onload=function(){	
	      summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
	      }
	      
	</script>

  <script>

		function regist_go(){
			var form = document.registForm;
			if(form.title.value==""){
				alert("제목은 필수입니다.");
				return;
			}
			
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

</body>
