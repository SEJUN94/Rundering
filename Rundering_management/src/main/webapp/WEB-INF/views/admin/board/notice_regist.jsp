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
		<div class="form-group">
			<input class="form-control" placeholder="제목:">
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="카테고리:">
		</div>
		<div class="">
              <textarea class="form-control" rows="10" cols="30" id="" name="content"></textarea>
           	
          </div>
	</div>

	<div class="card-footer">
		<button type="reset" class="btn btn-danger">
			<i class="fas fa-times"></i> 삭제
		</button>
		<div class="float-right">
			<button onclick="history.go(-1)" class="btn btn-warning">
				<i class="far fa-envelope"></i> 뒤로가기
			</button>
			<button type="submit" class="btn btn-primary">
				<i class="far fa-envelope"></i> 공지등록
			</button>
		</div>
	</div>
</div>
<script>
      window.onload=function(){
   	  console.log($('textarea[name="content"]'))	
      summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
      }
</script>

</body>
