<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
textarea {
	width: 100%;
	height: 500px;
}
</style>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>문의 상세보기</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">문의 상세보기</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<div class="card card-primary card-outline">


	<div class="card-body p-0">
		<div class="mailbox-read-info">
			<h5>Message Subject Is Placed Here</h5>

		</div>
		<div class="mailbox-read-message">
			<p>Hello John,</p>


		</div>
	</div>
	<div class="card-footer bg-white">
		<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
			<li><span class="mailbox-attachment-icon"><i
					class="far fa-file-pdf"></i></span>
				<div class="mailbox-attachment-info">
					<a href="#" class="mailbox-attachment-name"><i
						class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
						class="mailbox-attachment-size clearfix mt-1"> <span>1,245
							KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
							class="fas fa-cloud-download-alt"></i></a>
					</span>
				</div></li>

		</ul>
	</div>

	<div class="card-footer">
		<button type="reset" class="btn btn-danger">
			<i class="fas fa-times"></i> 삭제
		</button>
		<div class="float-right">
			<button onclick="history.go(-1)" class="btn btn-warning">
				<i class="far fa-envelope"></i> 뒤로가기
			</button>
			<a
				href="<%=request.getContextPath()%>/customercenter/question/modify.do">
			<button type="submit" class="btn btn-primary">
				<i class="far fa-envelope"></i> 수정하기
			</button>
			</a>
		</div>
	</div>

</div>
