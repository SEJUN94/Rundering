<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<head>
</head>


<title>상세 보기</title>

<body>
 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>건의사항
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	상세보기
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width:960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">상세보기</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="modifyBtn" onclick="modify_go('${anonymous.ano}');">수 정</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="removeBtn" onclick="remove_go('${anonymous.ano}');">삭 제</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();" >닫 기</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">						
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" readonly								
									name='title' class="form-control" value="${anonymous.title }">
							</div>
							<div class="form-group ">
								<div class="row">
									<div class="col">
										<label for="writer">작성자
										<input type="text" id="writer" readonly
											name="writer" class="form-control" value="${anonymous.writer }"></label>
									</div>
									<div class="col">
										<label for="branchName">소속지점
										<input type="text" id="branchName" readonly
											name="branchName" class="form-control" value="${anonymous.branchName }"></label>
									</div>
									<div class="col">
										<label for="registDate">등록일
										<input type="text" id="registDate" readonly
											name="registDate" class="form-control" value="${anonymous.registDate }"></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<div>${anonymous.content }</div>
							</div>
						
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
   <script>
	 function modify_go(ano){
		 location.href="modifyForm?ano="+ano;
	 }
	 
	 function remove_go(ano){
		 location.href="remove?ano="+ano;
	 }	
   
   <c:if test="${from eq 'modify' }">
   		alert("수정되었습니다.");
   </c:if>
   <c:if test="${from eq 'remove'}">
   		alert("삭제되었습니다.");
		window.close();
		window.opener.location.reload();
   </c:if>
   </script>
 </body>